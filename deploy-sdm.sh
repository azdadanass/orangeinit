mkdir -p ~/files
mkdir -p ~/log

docker stop sdm-orange
docker rm sdm-orange
docker image rm azdadanass/sdm-orange:latest
docker pull azdadanass/sdm-orange:latest
docker run -d --name sdm-orange \ 
 -p 8082:8080 \
 -v ~/files/:/usr/local/tomcat/webapps/ROOT/files/ \
 -v ~/log/:/usr/local/tomcat/webapps/ROOT/log/ \
 -e LANG="fr_FR.UTF-8" -e LC_ALL="fr_FR.UTF-8" \ 
 -v /etc/timezone:/etc/timezone:ro \ 
 -v /etc/localtime:/etc/localtime:ro \
 azdadanass/sdm-orange:latest