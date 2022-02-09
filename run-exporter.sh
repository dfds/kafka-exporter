#!/bin/sh

/bin/kafka_exporter \
--kafka.server=${KAFKA_SERVER} \
--sasl.username=${SASL_USERNAME} \
--sasl.password=${SASL_PASSWORD} \
--tls.ca-file=/etc/ssl/certs/ca-certificates.crt \
--kafka.version=3.0.0 \
--sasl.enabled \
--sasl.mechanism=plain \
--tls.enabled
