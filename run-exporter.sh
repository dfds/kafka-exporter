#!/bin/sh

/bin/kafka_exporter \
--kafka.server=${KAFKA_SERVER} \
--sasl.username=${SASL_USERNAME} \
--sasl.password=${SASL_PASSWORD} \
--tls.ca-file=/etc/ssl/certs/ca-certificates.crt \
--sasl.enabled \
--topic.filter=${TOPIC_FILTER} \
--topic.exclude=${TOPIC_EXCLUDE} \
--group.filter=${GROUP_FILTER} \
--sasl.mechanism=plain \
--tls.enabled \
--kafka.labels=${LABELS} \
--refresh.metadata=${REFRESH_METADATA}
