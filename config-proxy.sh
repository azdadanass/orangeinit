read -p "Enter http proxy address [http://10.127.21.70:80] : " http_proxy
http_proxy=${http_proxy:-http://10.127.21.70:80}


if ! grep -q http_proxy "/etc/environment"; then
  echo "http_proxy=$http_proxy" | sudo tee -a /etc/environment
else
	sudo sed -i "/http_proxy/c\http_proxy=$http_proxy" /etc/environment
fi

read -p "Enter https proxy address [http://10.127.21.70:80] : " https_proxy
https_proxy=${https_proxy:-http://10.127.21.70:80}


if ! grep -q https_proxy "/etc/environment"; then
  echo "https_proxy=$https_proxy" | sudo tee -a /etc/environment
 else
	sudo sed -i "/https_proxy/c\https_proxy=$https_proxy" /etc/environment
fi


if ! grep -q NO_PROXY "/etc/environment"; then
  echo "NO_PROXY=localhost,127.0.0.1,::1" | sudo tee -a /etc/environment
fi





sudo mkdir -p /etc/systemd/system/docker.service.d

echo "[Service]" | sudo tee  /etc/systemd/system/docker.service.d/http-proxy.conf
echo "Environment='HTTP_PROXY=$http_proxy'" | sudo tee -a  /etc/systemd/system/docker.service.d/http-proxy.conf
echo "Environment='HTTPS_PROXY=$https_proxy'" | sudo tee -a  /etc/systemd/system/docker.service.d/http-proxy.conf
echo "Environment='NO_PROXY=localhost,127.0.0.1,::1'" | sudo tee -a  /etc/systemd/system/docker.service.d/http-proxy.conf

sudo systemctl daemon-reload
sudo systemctl restart docker






echo -e  "{" > ~/.docker/config.json
echo -e  " "proxies": {" >> ~/.docker/config.json
echo -e  "   "default": {" >> ~/.docker/config.json
echo -e  "     "httpProxy": '$http_proxy'," >> ~/.docker/config.json
echo -e  "     "httpsProxy": '$http_proxy'," >> ~/.docker/config.json
echo -e  "     "noProxy": "localhost,127.0.0.1,::1"" >> ~/.docker/config.json
echo -e  "   }" >> ~/.docker/config.json
echo -e  " }" >> ~/.docker/config.json
echo -e  "}" >> ~/.docker/config.json


echo
echo
echo "/etc/environment :"
echo
cat /etc/environment
echo
echo
echo "cat /etc/systemd/system/docker.service.d/http-proxy.conf :"
echo
cat /etc/systemd/system/docker.service.d/http-proxy.conf
echo
echo
echo "~/.docker/config.json :"
echo
cat ~/.docker/config.json