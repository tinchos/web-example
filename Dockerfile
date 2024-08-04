FROM nginx:alpine

ARG LANG
ARG TAG

COPY index.html /usr/share/nginx/html/index.html
COPY logo.png /usr/share/nginx/html/logo.png

RUN sed -i 's/{{LANG}}/'"$LANG"'/g' /usr/share/nginx/html/index.html && \
    sed -i 's/{{TAG}}/'"$TAG"'/g' /usr/share/nginx/html/index.html

#RUN mkdir -p /var/cache/nginx /var/run /var/log/nginx && \
#    chown -R nginx:nginx /var/cache/nginx /var/run /var/log/nginx /usr/share/nginx/html

#USER nginx

EXPOSE 80

#CMD ["nginx", "-g", "daemon off;"]