read -p "Enter main server ip : " main_server_ip


read -p "Enter the DNS that will be used for applications [.orange.int] : " dns
dns=${dns:-.orange.int}

while true; do
    read -p "Which protocol ? http or https : " protocol
    case $protocol in
        http) 
			sudo cp /app/orangeinit/nginx/default_80 /etc/nginx/sites-enabled/default
			sudo sed -i "s/main_server_ip/$main_server_ip/g" /etc/nginx/sites-enabled/default
			sudo sed -i "s/dns/$dns/g" /etc/nginx/sites-enabled/default
			break;;
        https) 
			sudo cp /app/orangeinit/nginx/default_443 /etc/nginx/sites-enabled/default
			sudo sed -i "s/main_server_ip/$main_server_ip/g" /etc/nginx/sites-enabled/default
			sudo sed -i "s/dns/$dns/g" /etc/nginx/sites-enabled/default
			break;;
        * ) echo "Please answer http or https.";;
    esac
done


# Redemarrage docker
sudo service nginx restart



