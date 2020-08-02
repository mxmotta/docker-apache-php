FROM debian:latest

# Apache ENVs
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_PID_FILE /var/run/apache2/apache2.pid
ENV APACHE_SERVER_NAME localhost

RUN apt-get update -y && apt-get install -y apache2 php

# Copy files
COPY apache-conf /etc/apache2/apache2.conf
 
# Expose Apache
EXPOSE 80
 
# Launch Apache
CMD ["/usr/sbin/apache2ctl", "-DFOREGROUND"]