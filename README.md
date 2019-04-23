# kafka-exporter
Prometheus Kafka exporter.

This is using [danielqsj/kafka-exporter](https://github.com/danielqsj/kafka_exporter) as base image, but gives configuration values as environment variables instead of parameters.

# Environment variables
Following environment variables needs to be set when running the container.

|Environment variable | Description                            |
|---------------------|----------------------------------------|
| KAFKA_SERVER        | Addresses (host:port) of Kafka server. |
| SASL_USERNAME       | SASL user name.                        |
| SASL_PASSWORD       | SASL user password.                    |
