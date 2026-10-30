FROM danielqsj/kafka-exporter:v1.11.0

COPY ./run-exporter.sh .

ENTRYPOINT [ "/run-exporter.sh" ]
