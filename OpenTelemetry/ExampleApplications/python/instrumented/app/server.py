import os
import logging
from typing import Iterable

import fastapi
from opentelemetry import trace
from opentelemetry._logs import set_logger_provider
from opentelemetry.exporter.otlp.proto.grpc._log_exporter import OTLPLogExporter
from opentelemetry.exporter.otlp.proto.grpc.metric_exporter import OTLPMetricExporter
from opentelemetry.exporter.otlp.proto.grpc.trace_exporter import OTLPSpanExporter
from opentelemetry.instrumentation.fastapi import FastAPIInstrumentor
from opentelemetry.metrics import (
    CallbackOptions,
    Observation,
    get_meter_provider,
    set_meter_provider,
)
from opentelemetry.sdk._logs import LoggerProvider, LoggingHandler
from opentelemetry.sdk._logs.export import BatchLogRecordProcessor, ConsoleLogExporter
from opentelemetry.sdk.metrics import MeterProvider
from opentelemetry.sdk.metrics.export import (
    ConsoleMetricExporter,
    PeriodicExportingMetricReader,
)
from opentelemetry.sdk.resources import Resource
from opentelemetry.sdk.trace import TracerProvider
from opentelemetry.sdk.trace.export import BatchSpanProcessor, ConsoleSpanExporter
from opentelemetry.trace import get_tracer_provider, set_tracer_provider

from dotenv import load_dotenv
WRITE_TO_CONSOLE = False
load_dotenv()

resource = Resource.create({
    "service.name": os.getenv("OTEL_SERVICE_NAME"),
    "service.instance.id": "local"
})

# Configure Metrics
metric_otlp_exporter = OTLPMetricExporter(insecure=True)
metric_otlp_reader = PeriodicExportingMetricReader(metric_otlp_exporter)

if WRITE_TO_CONSOLE:
    metric_console_exporter = ConsoleMetricExporter()
    metric_console_reader = PeriodicExportingMetricReader(metric_console_exporter)
    meter_provider = MeterProvider(
        metric_readers=[metric_console_reader, metric_otlp_reader]
    )
else:
    meter_provider = MeterProvider(metric_readers=[metric_otlp_reader])
set_meter_provider(meter_provider)

print(f'METRICS: {os.getenv("OTEL_EXPORTER_OTLP_METRICS_ENDPOINT")}')
print(f'TRACE:   {os.getenv("OTEL_EXPORTER_OTLP_TRACES_ENDPOINT")}')

# Configure Trace Provider
trace_provider = TracerProvider(resource=resource)
if WRITE_TO_CONSOLE:
    trace_console_exporter = ConsoleSpanExporter()
    processor = BatchSpanProcessor(trace_console_exporter)
    trace_provider.add_span_processor(processor)
else:
    trace_otlp_exporter = OTLPSpanExporter(insecure=True, endpoint=os.getenv("OTEL_EXPORTER_OTLP_TRACES_ENDPOINT"))
    processor = BatchSpanProcessor(trace_otlp_exporter)
    trace_provider.add_span_processor(processor)

set_tracer_provider(trace_provider)

# Configure Logger
logger_provider = LoggerProvider(resource=resource)

set_logger_provider(logger_provider)
log_otlp_exporter = OTLPLogExporter(insecure=True, endpoint=os.getenv("OTEL_EXPORTER_OTLP_LOGS_ENDPOINT"))
if WRITE_TO_CONSOLE:
    log_console_exporter = ConsoleLogExporter()
    logger_provider.add_log_record_processor(BatchLogRecordProcessor(log_console_exporter))
else: 
    logger_provider.add_log_record_processor(BatchLogRecordProcessor(log_otlp_exporter))

handler = LoggingHandler(level=logging.NOTSET, logger_provider=logger_provider)

# Attach OTLP handler to root logger
logging.getLogger().addHandler(handler)
logger1 = logging.getLogger("fastapi_server.dicing")


## Metrics Instrumentation Helpers
def observable_counter_func(options: CallbackOptions) -> Iterable[Observation]:
    yield Observation(1, {})


def observable_up_down_counter_func(
    options: CallbackOptions,
) -> Iterable[Observation]:
    yield Observation(-10, {})


def observable_gauge_func(options: CallbackOptions) -> Iterable[Observation]:
    yield Observation(9, {})


meter = get_meter_provider().get_meter("fastapi_server.dicing", "0.1.2")
# Counter
counter = meter.create_counter("counter")

# Async Counter
observable_counter = meter.create_observable_counter(
    "observable_counter",
    [observable_counter_func],
)

# UpDownCounter
updown_counter = meter.create_up_down_counter("updown_counter")

# Async UpDownCounter
observable_updown_counter = meter.create_observable_up_down_counter(
    "observable_updown_counter", [observable_up_down_counter_func]
)

# Histogram
histogram = meter.create_histogram("histogram")

# Async Gauge
gauge = meter.create_observable_gauge("gauge", [observable_gauge_func])

app = fastapi.FastAPI()


tracer = trace.get_tracer(__name__)

@app.get("/dice")
def roll_dice():
    import random

    with tracer.start_as_current_span("roll_dice") as span:
        span.set_attribute("dice", "d6")
        logger1.info("Rolling dice")
        diced = random.randint(1, 6)
        counter.add(1)
        updown_counter.add(diced)
        histogram.record(diced)
        return {"dice": diced}


FastAPIInstrumentor.instrument_app(app)


if __name__ == "__main__":
    import uvicorn

    logger1.info("Starting FastAPI server")
    uvicorn.run(app, host="0.0.0.0", port=8000)
