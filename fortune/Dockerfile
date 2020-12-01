FROM ubuntu:latest
USER root
ADD fortuneloop.sh /bin/fortuneloop.sh
RUN apt-get update ; apt-get -y install fortune; chmod 755 /bin/fortuneloop.sh  
ENTRYPOINT ["/bin/fortuneloop.sh"]
CMD ["10"]
