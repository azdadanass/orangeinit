echo -e "\033[0;32m"
echo -e "Installation nginx"
echo -e "\033[0m"
sudo apt update
sudo apt -y install nginx

# Configuration nginx
sudo rm  /etc/nginx/sites-enabled/default

# Redemarrage docker
sudo service nginx restart