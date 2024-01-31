mkdir -p /app/files
mkdir -p /app/log/apps

docker stop apps-orange
docker rm apps-orange
docker image rm azdadanass/apps-orange:latest
docker pull azdadanass/apps-orange:latest
docker run -d --name apps-orange \
 -p 8080:8080 \
 -v :/usr/local/tomcat/webapps/ROOT/files/ \
 -v /app/log/apps/:/usr/local/tomcat/webapps/ROOT/log/ \
 -e LANG="fr_FR.UTF-8" -e LC_ALL="fr_FR.UTF-8" \
 -v /etc/timezone:/etc/timezone:ro \
 -v /etc/localtime:/etc/localtime:ro \
 azdadanass/apps-orange:latest