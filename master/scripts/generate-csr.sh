
sudo mkdir -p /etc/nginx/ssl/

sudo openssl req -new -newkey rsa:2048 -nodes -keyout /etc/nginx/ssl/apps.key -out /etc/nginx/ssl/apps.csr -subj "/C=MA/ST=CASABLANCA/L=CASABLANCA/O=ORANGE/OU=DSI/CN=apps.orange.int/emailAddress=mohamed.yaddas@orange.com"
sudo openssl req -new -newkey rsa:2048 -nodes -keyout /etc/nginx/ssl/iadmin.key -out /etc/nginx/ssl/iadmin.csr -subj "/C=MA/ST=CASABLANCA/L=CASABLANCA/O=ORANGE/OU=DSI/CN=iadmin.orange.int/emailAddress=mohamed.yaddas@orange.com"
sudo openssl req -new -newkey rsa:2048 -nodes -keyout /etc/nginx/ssl/sdm.key -out /etc/nginx/ssl/sdm.csr -subj "/C=MA/ST=CASABLANCA/L=CASABLANCA/O=ORANGE/OU=DSI/CN=sdm.orange.int/emailAddress=mohamed.yaddas@orange.com"
sudo openssl req -new -newkey rsa:2048 -nodes -keyout /etc/nginx/ssl/ilogistics.key -out /etc/nginx/ssl/ilogistics.csr -subj "/C=MA/ST=CASABLANCA/L=CASABLANCA/O=ORANGE/OU=DSI/CN=ilogistics.orange.int/emailAddress=mohamed.yaddas@orange.com"
sudo openssl req -new -newkey rsa:2048 -nodes -keyout /etc/nginx/ssl/ibuy.key -out /etc/nginx/ssl/ibuy.csr -subj "/C=MA/ST=CASABLANCA/L=CASABLANCA/O=ORANGE/OU=DSI/CN=ibuy.orange.int/emailAddress=mohamed.yaddas@orange.com"
sudo openssl req -new -newkey rsa:2048 -nodes -keyout /etc/nginx/ssl/qr.key -out /etc/nginx/ssl/qr.csr -subj "/C=MA/ST=CASABLANCA/L=CASABLANCA/O=ORANGE/OU=DSI/CN=qr.orange.int/emailAddress=mohamed.yaddas@orange.com"
sudo openssl req -new -newkey rsa:2048 -nodes -keyout /etc/nginx/ssl/public.key -out /etc/nginx/ssl/public.csr -subj "/C=MA/ST=CASABLANCA/L=CASABLANCA/O=ORANGE/OU=DSI/CN=public.orange.int/emailAddress=mohamed.yaddas@orange.com"

