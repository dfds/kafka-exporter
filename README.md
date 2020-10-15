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
| TOPIC_FILTER        | Filter to include topics (for all use `".*"`) |
| GROUP_FILTER        | Filter to include consumergroups (for all use `".*"`) |


## Deployment prerequisites

If the scoped service account is missing for deployment, see https://wiki.dfds.cloud/en/teams/devex/selfservice/Kubernetes-ops-deployment-setup