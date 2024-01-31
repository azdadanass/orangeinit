mkdir -p /app/files
mkdir -p /app/log/ilogistics

docker stop ilogistics-orange
docker rm ilogistics-orange
docker image rm azdadanass/ilogistics-orange:latest
docker pull azdadanass/ilogistics-orange:latest
docker run -d --name ilogistics-orange \
 -p 8083:8080 \
 -v /app/files/:/usr/local/tomcat/webapps/ROOT/files/ \
 -v /app/log/ilogistics/:/usr/local/tomcat/webapps/ROOT/log/ \
 -e LANG="fr_FR.UTF-8" -e LC_ALL="fr_FR.UTF-8" \
 -v /etc/timezone:/etc/timezone:ro \
 -v /etc/localtime:/etc/localtime:ro \
 azdadanass/ilogistics-orange:latest