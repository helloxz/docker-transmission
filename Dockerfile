FROM alpine:3.12
WORKDIR /root
COPY *.sh /root
#COPY install.sh /root
RUN sh -c '/bin/echo -e "1"|sh /root/install.sh'
CMD sh /root/run.sh