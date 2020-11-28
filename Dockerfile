FROM alpine
WORKDIR /root
COPY run.sh /root
COPY install.sh /root
RUN sh /root/install.sh
CMD sh /root/run.sh