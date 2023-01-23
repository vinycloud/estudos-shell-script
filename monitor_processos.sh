#!/bin/bash

DIRETORIO=logs_monitor

if [ ! -d $DIRETORIO ]
then
	mkdir $DIRETORIO
fi

monitora_processos(){
processos=$(ps -e -o pid --sort -size | head -n 11 | grep '[0-9]')

for pid in $processos
do
	nome_processo=$(ps -p $pid -o comm=)
	echo -n $(date +%F,%H:%M:%S,) >> $DIRETORIO/$nome_processo.log
	size=$(ps -p $pid -o size | grep '[0-9]')
	echo "$(bc <<< "scale=2;$size/1024") MB" >> $DIRETORIO/$nome_processo.log
done
}

monitora_processos
if [ $? -eq 0 ]
then
	echo "Arquivos gerados com sucesso!!!"
else
	echo "Ocorreu um problema ao gerar os arquivos, favor verificar..."
fi

