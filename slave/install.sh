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


$script_dir/install/ncpa.sh
$script_dir/install/mysql.sh








