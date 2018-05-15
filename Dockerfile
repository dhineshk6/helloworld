FROM busybox
MAINTAINER Dhinesh

ADD index.html /www/index.html

EXPOSE 3000

# Create a basic webserver and sleep forever
CMD httpd -p 3000 -h /www; tail -f /dev/null
