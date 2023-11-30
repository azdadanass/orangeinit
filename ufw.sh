# deny incoming and allow outgoing connections
sudo ufw default deny incoming
sudo ufw default allow outgoing

# deny  apps ports 
sudo ufw deny 8080:8086/tcp
sudo ufw deny 8080:8086/udp

# allow ssh
sudo ufw allow 22

# allow http and https
sudo ufw allow 80
sudo ufw allow 443

# allow portainer port
sudo ufw allow 9443

# allow mysql only  for docker LAN
sudo ufw allow from 172.17.0.0/24 to any port 3306

# enable firewall
sudo ufw enable