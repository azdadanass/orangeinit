mkdir -p ~/files
mkdir -p ~/log

docker stop qr-orange
docker rm qr-orange
docker image rm azdadanass/qr-orange:latest
docker pull azdadanass/qr-orange:latest
docker run -d --name qr-orange \
 -p 8085:8080 \
 -v ~/files/:/usr/local/tomcat/webapps/ROOT/files/ \
 -v ~/log/:/usr/local/tomcat/webapps/ROOT/log/ \
 -e LANG="fr_FR.UTF-8" -e LC_ALL="fr_FR.UTF-8" \
 -v /etc/timezone:/etc/timezone:ro \
 -v /etc/localtime:/etc/localtime:ro \
 azdadanass/qr-orange:latest