#!/bin/bash

CAMINHO_RESTORE=/home/vinicius/Documents/Estudos/Shell-Script/Alura/restore_mutillidae
PROFILE=alura-s3
BUCKET_NAME=vtf-labs-elb
DATA=$(date +%F)

export AWS_PROFILE=$PROFILE
aws s3 sync s3://$BUCKET_NAME/$DATA $CAMINHO_RESTORE
cd $CAMINHO_RESTORE

if [ -f $1.sql ] 
then
	mysql -u root mutillidae < $1.sql
	if [ $? -eq 0 ]
	then
		echo "Restore realizado com sucesso!"
	fi
else
	echo "O Arquivo procurado não existe!"
fi
