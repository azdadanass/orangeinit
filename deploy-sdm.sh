mkdir -p ~/files
mkdir -p ~/log

docker stop sdm-orange
docker rm sdm-orange
docker image rm 41.248.252.127:5000/sdm-orange:latest
docker pull 41.248.252.127:5000/sdm-orange:latest
docker run -d --name sdm-orange -p 8082:8080 -v ~/files/:/usr/local/tomcat/webapps/ROOT/files/  -e LANG="fr_FR.UTF-8" -e LC_ALL="fr_FR.UTF-8" -v /etc/timezone:/etc/timezone:ro -v /etc/localtime:/etc/localtime:ro 41.248.252.127:5000/sdm-orange:latest