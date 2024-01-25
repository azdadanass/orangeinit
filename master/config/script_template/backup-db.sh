log_folder=~/log
tmp_folder=~/tmp
backup_folder=/backup/db

mkdir -p $log_folder
mkdir -p $tmp_folder
mkdir -p backup_folder


error_log=$log_folder/export_db_error.log
dump_file=$tmp_folder/orange.sql
backup_file=$backup_folder/orange-`date +%Y-%m-%d-%H:%M`.7z



mysqldump \
	--defaults-extra-file=~/scripts/config.cnf \
	--max_allowed_packet=1G \
	--default-character-set=utf8 \
	--single-transaction=TRUE \
	"orange"  \
	--databases  > $dump_file  2>> $error_log

7z a -t7z -m0=lzma -mx=9 -mfb=64 -md=32m -ms=on $backup_file $dump_file  2>> $error_log

ssh backup_server_user@backup_server_ip "mkdir -p $backup_folder"
scp -r $backup_file backup_server_user@backup_server_ip:$backup_folder

find $backup_folder -type f -name "orange*" -mtime +7 -delete 2>> $error_log

