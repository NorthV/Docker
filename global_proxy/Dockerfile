FROM nginx

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]

RUN sed -i "s|include /etc/nginx/conf\.d/\*\.conf;|& include /etc/nginx/sites/\*\.conf;|" /etc/nginx/nginx.conf
COPY web*.conf.tpl /etc/nginx/sites/
