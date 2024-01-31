docker stop portainer
docker rm portainer
docker volume create portainer_data
docker run -d -p 9443:9443 -p 8000:8000 \
    --name portainer --restart always \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v portainer_data:/data \
    -v /app/certs:/certs \
    portainer/portainer-ce:latest \
    --sslcert /certs/portainer.crt \
    --sslkey /certs/portainer.key

#access from https://ip-machine:9443