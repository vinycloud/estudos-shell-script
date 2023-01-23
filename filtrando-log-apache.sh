#!/bin/bash

regex="\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"
cd ~/Documents/Estudos/Shell-Script/Alura

if [[ $1 =~ $regex ]]
then
	cat apache.log | grep $1
	if [ $? -ne 0 ]
	then
		echo "O IP informado não existe no log"
	fi
else
	echo "Formato não é valido"
fi

