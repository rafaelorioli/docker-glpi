FROM debian:10
RUN apt-get update
RUN apt-get install -y apache2

RUN sudo apt-get install -y software-properties-common \
  && add-apt-repository ppa:ondrej/php \
  && apt-get update

RUN apt-get install -y --force-yes \
  wget \
  php5.6 \
  php5.6-mysql \
  php5.6-ldap \
  php5.6-xmlrpc \
  curl \
  php5.6-curl \
  php5.6-gd \
  php5.6-mbstring \
  php5.6-simplexml \
  php5.6-xml \
  php5.6-apcu \
  php5.6-imap

RUN a2enmod rewrite && service apache2 stop
WORKDIR /var/www/html
COPY start.sh /opt/
RUN chmod +x /opt/start.sh
RUN usermod -u 1000 www-data
COPY cron_glpi /etc/cron.d/glpi
RUN chmod 0644 /etc/cron.d/glpi
RUN service cron start
RUN  echo "date.timezone = \"America/Sao_Paulo\"" >> /etc/php/5.6/cli/php.ini
CMD cron
CMD /opt/start.sh
RUN ln -sf /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime
EXPOSE 80
