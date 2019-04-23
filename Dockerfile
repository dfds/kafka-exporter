FROM danielqsj/kafka-exporter

COPY ./run-exporter.sh .

ENTRYPOINT [ "/run-exporter.sh" ]