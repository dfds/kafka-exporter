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

### ServiceAccount

1. Create a ServiceAccount in Confluent Cloud and assign it the MetricsViewer role.

2. In the cluster, under Data Integrations, API Keys, create a new API key that will be owned by the Service Account.

3. Add the following ACLs to new API Key owned by the new Service Account:

|Scope | ID/Name |Permission | Operation | Pattern |
|------|---------|-----------|-----------|---------|
|Cluster | kafka-cluster | ALLOW | DESCRIBE |LITERAL|
|Cluster | kafka-cluster |ALLOW | DESCRIBE_CONFIG |LITERAL|
|Consumer Group | * | ALLOW | DESCRIBE |LITERAL|
|Consumer Group | * | ALLOW | DESCRIBE |PREFIX|
|Topic | * | ALLOW | DESCRIBE |LITERAL|
|Topic | * | ALLOW | DESCRIBE |PREFIX|


