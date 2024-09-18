import logging

import fastapi
from opentelemetry._logs import set_logger_provider
from opentelemetry.exporter.otlp.proto.grpc._log_exporter import OTLPLogExporter
from opentelemetry.instrumentation.fastapi import FastAPIInstrumentor
from opentelemetry.sdk._logs import LoggerProvider, LoggingHandler
from opentelemetry.sdk._logs.export import BatchLogRecordProcessor
from opentelemetry.sdk.resources import Resource
from opentelemetry.sdk.trace import TracerProvider
from opentelemetry.sdk.trace.export import BatchSpanProcessor, ConsoleSpanExporter
from opentelemetry.trace import get_tracer_provider, set_tracer_provider

# Configure Trace Provider
set_tracer_provider(TracerProvider())
get_tracer_provider().add_span_processor(BatchSpanProcessor(ConsoleSpanExporter()))

# Configure Logger
logger_provider = LoggerProvider(
    resource=Resource.create(
        {
            "service.name": "fastapi_server",
            "service.instance.id": "instance-1",
        }
    )
)
set_logger_provider(logger_provider)
exporter = OTLPLogExporter(insecure=True)
logger_provider.add_log_record_processor(BatchLogRecordProcessor(exporter))
handler = LoggingHandler(level=logging.NOTSET, logger_provider=logger_provider)

# Attach OTLP handler to root logger
logging.getLogger().addHandler(handler)
logger1 = logging.getLogger("fastapi_server.dicing")

app = fastapi.FastAPI()


@app.get("/dice")
def roll_dice():
    import random

    logger1.info("Rolling dice")
    return {"dice": random.randint(1, 6)}


FastAPIInstrumentor.instrument_app(app)


if __name__ == "__main__":
    import uvicorn

    logger1.warning("Starting FastAPI server")
    uvicorn.run(app, host="0.0.0.0", port=8000)
