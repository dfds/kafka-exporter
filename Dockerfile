FROM danielqsj/kafka-exporter:latest

COPY ./run-exporter.sh .

ENTRYPOINT [ "/run-exporter.sh" ]
