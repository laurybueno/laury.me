FROM hacklab/wordpress:v4.9.8-php7.1

LABEL mantainer "hacklab/ <contato@hacklab.com.br>"

ARG composer='--no-dev'
USER www-data

# Insert our data and dependencies
COPY ["compose/entrypoint-extra", "/docker-entrypoint-extra"]
COPY ["compose/production/wp-config.d/", "/var/www/html/wp-config.d"]
COPY ["composer.json", "/var/www/html/composer.json"]
RUN mkdir vendor
RUN composer install -v $composer
COPY ["wp-content", "/var/www/html/wp-content"]
COPY ["plugins", "/var/www/html/plugins"]
COPY ["themes", "/var/www/html/themes"]


# Fix file permissions
USER root
RUN chown -R www-data: wp-content
