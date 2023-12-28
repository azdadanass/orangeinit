mkdir -p ~/files
mkdir -p ~/log

docker stop iadmin-orange
docker rm iadmin-orange
docker image rm azdadanass/iadmin-orange:latest
docker pull azdadanass/iadmin-orange:latest
docker run -d --name iadmin-orange -p 8081:8080 -v ~/files/:/usr/local/tomcat/webapps/ROOT/files/ -v ~/log/:/usr/local/tomcat/webapps/ROOT/log/ -e LANG="fr_FR.UTF-8" -e LC_ALL="fr_FR.UTF-8" -v /etc/timezone:/etc/timezone:ro -v /etc/localtime:/etc/localtime:ro azdadanass/iadmin-orange:latest