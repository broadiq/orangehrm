FROM ubuntu:16.04
MAINTAINER Orangehrm <samanthaj@orangehrm.com>
 
RUN apt-get update
RUN apt-get -y install apt-utils
RUN apt-get -y install locales
 
# Set the locale
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
 
RUN apt-get -y install software-properties-common
RUN apt-get update

RUN apt-get -y install software-properties-common
RUN add-apt-repository -y ppa:ondrej/php
RUN apt-get update
RUN apt-get install -y php5.6
RUN apt-get install -y php5.6-mbstring php5.6-mcrypt php5.6-mysql php5.6-xml php5.6-cli
RUN php -v
RUN apt-get -y install apache2 php-pear curl lynx-cur wget unzip supervisor openssh-server

# Install apache, PHP, and supplimentary programs. curl and lynx-cur are for debugging the container.
#RUN DEBIAN_FRONTEND=noninteractive apt-get -y install apache2 mysql-server libapache2-mod-php5 php5-mysql php5-gd php-pear php-apc php5-curl curl lynx-cur wget unzip supervisor openssh-server

# Enable apache mods.
#RUN a2enmod php5
RUN a2enmod rewrite

# Manually set up the apache environment variables
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid

# Export port 80
EXPOSE 80

# Download the source
#RUN wget -c http://downloads.sourceforge.net/project/orangehrm/stable/3.3.2/orangehrm-3.3.2.zip -O ~/orangehrm-3.3.2.zip &&\
#    unzip -o ~/orangehrm-3.3.2.zip -d /var/www/site && \
#    rm ~/orangehrm-3.3.2.zip
    
RUN wget -c http://downloads.sourceforge.net/project/orangehrm/stable/4.1.2/orangehrm-4.1.2.zip -O ~/orangehrm-4.1.2.zip &&\
    unzip -o ~/orangehrm-4.1.2.zip -d /var/www/site && \
    rm ~/orangehrm-4.1.2.zip

# Fix Permission
RUN cd /var/www/site/orangehrm-4.1.2; bash fix_permissions.sh

# Set the configuration file with the correct environment settings
ADD docker-build-files/Conf.php /var/www/site/orangehrm-4.1.2/lib/confs
ADD docker-build-files/databases.yml /var/www/site/orangehrm-4.1.2/symfony/config
# Add the init.sh to configure and start the server.
ADD init.sh .

# Update the default apache site with the config we created.
ADD docker-build-files/apache-config.conf /etc/apache2/sites-enabled/000-default.conf

# Copy Supervisor configuration
ADD docker-build-files/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Start apache/mysql
#CMD /usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf
CMD ./init.sh
