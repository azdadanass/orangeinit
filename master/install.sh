script_dir=$(dirname $0)


if [ ! -d "/app/" ]
then
	echo folder /app not found
	exit
fi

if [ ! -d "/backup/" ]
then
	echo folder /backup not found
	exit
fi


mkdir -p /app/log
mkdir -p /app/tmp


cp -r $script_dir/scripts /app
chmod +x /app/scripts/*.sh

$script_dir/install/docker.sh
$script_dir/install/nginx.sh
$script_dir/install/p7zip.sh
$script_dir/install/ncpa.sh

$script_dir/config/config-backup.sh

$script_dir/install/mysql.sh




