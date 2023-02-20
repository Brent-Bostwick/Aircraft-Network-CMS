FROM ubuntu:22.04

MAINTAINER Manish Khilwani <manish.khilwani@brainstream.tech>
WORKDIR /var/www/app/
# Set timezone:
RUN ln -snf /usr/share/zoneinfo/$CONTAINER_TIMEZONE /etc/localtime && echo $CONTAINER_TIMEZONE > /etc/timezone

# Install dependencies:
RUN apt-get update && apt-get install -y tzdata
RUN apt-get -y install gnupg2
RUN apt -y install ffmpeg
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 9578539176BAFBC6
RUN apt install -y software-properties-common
RUN rm -rf /var/lib/apt/lists/*
RUN add-apt-repository -y ppa:ondrej/php
RUN apt-get update
RUN apt-get install -y apache2
RUN apt install -y libapache2-mod-php8.0
RUN apt install lsb-release ca-certificates apt-transport-https software-properties-common -y
RUN apt-get install -y php8.0 php8.0-fpm
RUN apt-get --allow-releaseinfo-change update

RUN apt-get clean && apt-get update \
    &&  apt-get install -y --no-install-recommends \
        locales \
        apt-utils \
        git \
        libicu-dev \
        g++ \
        libpng-dev \
        libxml2-dev \
        libzip-dev \
        libonig-dev \
        libxslt-dev \
        unzip \
        libpq-dev \
        nodejs \
        npm \
        wget \
        apt-transport-https \
        lsb-release \
        curl \
        vim \
        tree \
        sudo \
        ca-certificates

RUN apt-get install -y libmagickwand-dev
RUN apt-get install -y imagemagick
RUN apt-get -y install cron
# Add the cron job

RUN apt-get install php8.0-common php8.0-mysql php8.0-xml php8.0-xmlrpc php8.0-curl php8.0-gd php8.0-imagick php8.0-cli php8.0-dev php8.0-imap php8.0-mbstring php8.0-opcache php8.0-soap php8.0-zip php8.0-redis php8.0-intl php8.0-pdo -y

# forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/apache2/access.log \
	&& ln -sf /dev/stderr /var/log/apache2/error.log \
	&& ln -sf /dev/stderr /var/log/php8.0-fpm.log

RUN rm -f /etc/apache2/sites-available/000-default.conf
RUN rm -f /etc/apache2/sites-enabled/000-default.conf
COPY ./etc/apache/conf.d/000-default.conf /etc/apache2/sites-available/
RUN ln -s /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-enabled/

COPY --chown=www-data:www-data . /var/www/app

COPY ./etc/php/30-custom-php.ini /etc/php/8.0/fpm/conf.d/
COPY ./etc/php/www.conf /etc/php/8.0/fpm/pool.d/

RUN mkdir -p /run/php && touch /run/php/php8.0-fpm.sock && touch /run/php/php8.0-fpm.pid
RUN apt-get clean

RUN apt-get update && apt-get install -y --no-install-recommends --no-install-suggests supervisor

COPY etc/listener.php /listener.php
COPY etc/supervisor.conf /etc/supervisor/conf.d/supervisor.conf

#RUN php artisan db:seed --class=CreateAdminUserSeeder

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

EXPOSE 80
ENTRYPOINT ["entrypoint.sh"]
