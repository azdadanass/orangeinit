script_dir=$(dirname $0)

cp -r $script_dir/scripts ~
chmod +x ~/scripts/*.sh

$script_dir/install/docker.sh
$script_dir/install/nginx.sh
$script_dir/install/p7zip.sh
$script_dir/install/ncpa.sh

$script_dir/config/config-backup.sh

$script_dir/install/mysql.sh




