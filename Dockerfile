FROM danielqsj/kafka-exporter:v1.10.0

COPY ./run-exporter.sh .

ENTRYPOINT [ "/run-exporter.sh" ]
