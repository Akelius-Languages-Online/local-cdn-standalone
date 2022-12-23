FROM debian:bookworm-slim
MAINTAINER Ivaylo Iliev "ivaylo.iliev@akelius.de"

USER root

RUN apt-get update
RUN apt-get install -y nginx nodejs

RUN rm -v /etc/nginx/nginx.conf

ADD conf/nginx.conf /etc/nginx/
ADD conf/mime.types /etc/nginx/

ADD web /usr/share/nginx/html/
ADD web /var/www/html/

RUN echo "daemon off;" >> /etc/nginx/nginx.conf

EXPOSE 8181

CMD service nginx start
