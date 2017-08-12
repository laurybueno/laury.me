FROM hacklab/wordpress
LABEL mantainer "Hacklab <contato@hacklab.com.br>"

ARG composer='--no-dev'
USER www-data

# Insert our data and dependencies
COPY ["docker-entrypoint-extra", "/docker-entrypoint-extra"]
COPY ["composer.json", "/var/www/html/composer.json"]
RUN mkdir vendor
RUN composer install -v $composer
COPY ["wp-content", "/var/www/html/wp-content"]


# Fix file permissions
USER root
RUN chown -R www-data: wp-content

