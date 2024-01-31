mkdir -p /app/files
mkdir -p /app/log/public

docker stop public-orange
docker rm public-orange
docker image rm azdadanass/public-orange:latest
docker pull azdadanass/public-orange:latest
docker run -d --name public-orange \
 -p 8084:8080 \
 -v /app/files/:/usr/local/tomcat/webapps/ROOT/files/ \
 -v /app/log/public/:/usr/local/tomcat/webapps/ROOT/log/ \
 -e LANG="fr_FR.UTF-8" -e LC_ALL="fr_FR.UTF-8" \
 -v /etc/timezone:/etc/timezone:ro \
 -v /etc/localtime:/etc/localtime:ro \
 azdadanass/public-orange:latest