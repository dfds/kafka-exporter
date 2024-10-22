FROM danielqsj/kafka-exporter:v1.8.0

COPY ./run-exporter.sh .

ENTRYPOINT [ "/run-exporter.sh" ]
