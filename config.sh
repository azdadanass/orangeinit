read -p "Enter main server ip : " main_server_ip
echo $main_server_ip

read -p "Enter the DNS that will be used for applications (ex : telodigital.orange.com) : " dns
echo $dns

while true; do
    read -p "Which protocol ? http or https : " protocol
    case $protocol in
        http) 
			cp ~/orangeinit/nginx/default_80 /etc/nginx/sites-enabled/default
			sudo sed -i "s/main_server_ip/$main_server_ip/g" /etc/nginx/sites-enabled/default
			sudo sed -i "s/telodigital.orange.com/$dns/g" /etc/nginx/sites-enabled/default
			break;;
        https) 
			cp ~/orangeinit/nginx/default_443 /etc/nginx/sites-enabled/default
			sudo sed -i "s/main_server_ip/$main_server_ip/g" /etc/nginx/sites-enabled/default
			sudo sed -i "s/telodigital.orange.com/$dns/g" /etc/nginx/sites-enabled/default
			break;;
        * ) echo "Please answer http or https.";;
    esac
done



