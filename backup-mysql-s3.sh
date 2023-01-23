#!/bin/bash

CAMINHO_BACKUP=/home/vinicius/backup_s3
TABELAS=$(mysql -u root mutillidae -e "show tables;" | grep -v Tables)
DATA=$(date +%F)
BUCKET_NAME=vtf-labs-elb
PROFILE=alura-s3

cd $CAMINHO_BACKUP

if [ ! -d $DATA ]
then
	mkdir $DATA
fi

for table in $TABELAS
do
	mysqldump -u root mutillidae $TABELAS > $CAMINHO_BACKUP/$DATA/$table.sql
done

export AWS_PROFILE=$PROFILE
aws s3 sync $CAMINHO_BACKUP s3://$BUCKET_NAME

if [ $? -eq 0 ]
then
	echo "Backup realizado com sucesso!"
else
	echo "Houve um problema ao realizar o backup..."
fi

