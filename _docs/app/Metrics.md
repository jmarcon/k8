# Metrics

## Good Practices

There is some good practices to follow when you are monitoring your system, some of them are:

### [GOLDEN SIGNALS](https://sre.google/sre-book/monitoring-distributed-systems/#xref_monitoring_golden-signals)

The four golden signals are metrics that are the most important to monitor a system according to Google SRE book. Basically, if you need to choose only four metrics to monitor your system, these are the ones you should choose:

- **Latency**: The time it takes to service a request.
- **Traffic**: A measure of how much demand is being placed on your system.
- **Errors**: The rate of requests that fail.
- **Saturation**: How "full" your service is.

### [RED](https://thenewstack.io/monitoring-microservices-red-method/)

The RED is a subset of the Golden Signals, but it is more focused on a microservice architecture.

- _**R**ate_: The number of requests per second.
- _**E**rror_: The number of failed requests per second.
- _**D**uration_: The amount of time taken to serve each request.

### [USE](https://www.brendangregg.com/usemethod.html)

The USE method is more suitable for infrastructure monitoring and is focused on the resource usage. The USE method is based on three metrics:

- _**U**tilization_: The fraction of time that the resource was busy.
- _**S**aturation_: The degree to which the resource has extra work which it can't service.
- _**E**rrors_: The rate at which the resource encounters errors.

In the USE method is important to identify the bottlenecks in small periods of time, so you can visualize where the issues are happening.

An example can be the CPU usage in 80% average in the last 5 minutes, but in the some 30 seconds interval inside the time frame it is 100%. This can create problems for the final user and you need to identify this kind of issue.

#### Resources

- CPU: Usage, Cores, Load
- Memory: Capacity, Usage, Page Faults
- Network: Bandwidth, Packets, Errors
- Storage: Capacity, IOPS, Latency

## Our selected metrics

### Infrastructure

#### Cluster

- **Nodes**: Quantity, Status, Capacity, Number of Pods
- **CPU**: Usage, Cores, Load
- **Memory**: Capacity, Usage, Page Faults
- **Network**: Bandwidth, Packets, Errors

#### Pods

- **CPU**: Requested, Limits, Usage
- **Memory**: Requested, Limits, Usage

### Applications

#### Services (HTTP)

Every request/response must be monitored and store the following metrics in each endpoint:

- **Path**: The path of the request
- **Method**: The HTTP method
- **Status**: The HTTP response status code
- **Latency**: The time it takes to respond to the request (Response time)
- **Origin**: The source of the request (IP, Host, etc)
- **User**: The user that made the request (if available)
- **Body**: The request/response body
- **Headers**: The request/response headers, some very important examples:
  - _Token_: The token used in the request
  - _User-Agent_: The user-agent of the request
  - _Trace-Id_: The trace id of the request
  - _Body_: The request/response body

From these data entries you can generate the RED metrics for the application and, if you need, for each endpoint.

If you store those data in a structured way, using a time series database and/or a log management system, you can create dashboards, alerts, and more.

You can use the same data to store audit logs, identify users behaviors, etc.
