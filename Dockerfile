FROM nginx

COPY ./nginx/default.conf /etc/nginx/conf.d/default.conf

COPY ./nginx/backend-not-found.html /var/www/html/backend-not-found.html

COPY ./nginx/includes/ /etc/nginx/includes/

COPY ./ssl/ /etc/ssl/certs/nginx/
