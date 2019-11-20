FROM alpine
COPY run.sh /usr/local/bin
RUN chmod +x /usr/local/bin/run.sh
WORKDIR /usr/src/app
ENTRYPOINT ["/usr/local/bin/run.sh"]
