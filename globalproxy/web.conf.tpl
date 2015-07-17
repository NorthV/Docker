server {
    #listen 80;

    server_name {{DOMAIN}};

    location / {
		proxy_pass http://{{HOST}};

		proxy_set_header Host $host;
		proxy_set_header X-Real-IP $remote_addr;
		proxy_set_header X-Forwarded-For $remote_addr;
		proxy_read_timeout 600;
		client_max_body_size 100m;
    }

}