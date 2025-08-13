FROM danielqsj/kafka-exporter:v1.9.0

COPY ./run-exporter.sh .

ENTRYPOINT [ "/run-exporter.sh" ]
