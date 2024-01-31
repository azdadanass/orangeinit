
mkdir -p /app/certs

sudo openssl req -new -newkey rsa:2048 -nodes -keyout /app/certs/apps.key -out /app/certs/apps.csr -subj "/C=MA/ST=CASABLANCA/L=CASABLANCA/O=ORANGE/OU=DSI/CN=apps.orange.int/emailAddress=mohamed.yaddas@orange.com"
sudo openssl req -new -newkey rsa:2048 -nodes -keyout /app/certs/iadmin.key -out /app/certs/iadmin.csr -subj "/C=MA/ST=CASABLANCA/L=CASABLANCA/O=ORANGE/OU=DSI/CN=iadmin.orange.int/emailAddress=mohamed.yaddas@orange.com"
sudo openssl req -new -newkey rsa:2048 -nodes -keyout /app/certs/sdm.key -out /app/certs/sdm.csr -subj "/C=MA/ST=CASABLANCA/L=CASABLANCA/O=ORANGE/OU=DSI/CN=sdm.orange.int/emailAddress=mohamed.yaddas@orange.com"
sudo openssl req -new -newkey rsa:2048 -nodes -keyout /app/certs/ilogistics.key -out /app/certs/ilogistics.csr -subj "/C=MA/ST=CASABLANCA/L=CASABLANCA/O=ORANGE/OU=DSI/CN=ilogistics.orange.int/emailAddress=mohamed.yaddas@orange.com"
sudo openssl req -new -newkey rsa:2048 -nodes -keyout /app/certs/ibuy.key -out /app/certs/ibuy.csr -subj "/C=MA/ST=CASABLANCA/L=CASABLANCA/O=ORANGE/OU=DSI/CN=ibuy.orange.int/emailAddress=mohamed.yaddas@orange.com"
sudo openssl req -new -newkey rsa:2048 -nodes -keyout /app/certs/qr.key -out /app/certs/qr.csr -subj "/C=MA/ST=CASABLANCA/L=CASABLANCA/O=ORANGE/OU=DSI/CN=qr.orange.int/emailAddress=mohamed.yaddas@orange.com"
sudo openssl req -new -newkey rsa:2048 -nodes -keyout /app/certs/public.key -out /app/certs/public.csr -subj "/C=MA/ST=CASABLANCA/L=CASABLANCA/O=ORANGE/OU=DSI/CN=public.orange.int/emailAddress=mohamed.yaddas@orange.com"
sudo openssl req -new -newkey rsa:2048 -nodes -keyout /app/certs/public.key -out /app/certs/public.csr -subj "/C=MA/ST=CASABLANCA/L=CASABLANCA/O=ORANGE/OU=DSI/CN=portainer-sdm.orange.int/emailAddress=mohamed.yaddas@orange.com"

