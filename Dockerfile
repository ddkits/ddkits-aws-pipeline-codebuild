

#  Script.s#  Script.s

FROM ddkits/lamp:7

MAINTAINER Mutasem Elayyoub "melayyoub@outlook.com"

WORKDIR /var/www/html

RUN ln -sf $DDKITSFL/logs /var/log/nginx/access.log \
    && ln -sf $DDKITSFL/logs /var/log/nginx/error.log \
    && chmod 600 /etc/mysql/my.cnf \
    && rm /etc/apache2/sites-enabled/*
RUN chmod -R 777 /var/www/html
ADD . /var/www/html
# COPY Laravel/php.ini /etc/php/7.0/fpm/php.ini
RUN rm -rf /etc/apache2/sites-enabled/*
# COPY Laravel/sites/default00.conf /etc/apache2/sites-enabled/default00.conf

# ssh
ENV SSH_PASSWD "root:Docker!"
# RUN apt-get update \
#         && apt-get install -y --no-install-recommends dialog \
#         && apt-get update \
#     && apt-get install -y --no-install-recommends openssh-server \
#     && echo "$SSH_PASSWD" | chpasswd

# COPY sshd_config /etc/ssh/

# Fixing permissions
RUN chown -R www-data:www-data /var/www/html
RUN usermod -u 1000 www-data

EXPOSE 80 443 8000 2222

