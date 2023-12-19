mkdir -p ~/files
mkdir -p ~/log

docker stop apps-orange
docker rm apps-orange
docker image rm 41.248.252.127:5000/apps-orange:latest
docker pull 41.248.252.127:5000/apps-orange:latest
docker run -d --name apps-orange -p 8080:8080 -v ~/files/:/usr/local/tomcat/webapps/ROOT/files/  -e LANG="fr_FR.UTF-8" -e LC_ALL="fr_FR.UTF-8" -v /etc/timezone:/etc/timezone:ro -v /etc/localtime:/etc/localtime:ro 41.248.252.127:5000/apps-orange:latest