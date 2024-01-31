mkdir -p /app/files
mkdir -p /app/log/ibuy

docker stop ibuy-orange
docker rm ibuy-orange
docker image rm azdadanass/ibuy-orange:latest
docker pull azdadanass/ibuy-orange:latest
docker run -d --name ibuy-orange \
 -p 8086:8080 \
 -v /app/files/:/usr/local/tomcat/webapps/ROOT/files/ \
 -v /app/log/ibuy/:/usr/local/tomcat/webapps/ROOT/log/ \
 -e LANG="fr_FR.UTF-8" -e LC_ALL="fr_FR.UTF-8" \
 -v /etc/timezone:/etc/timezone:ro \
 -v /etc/localtime:/etc/localtime:ro \
 azdadanass/ibuy-orange:latest