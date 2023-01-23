#!/bin/bash

PNG=~/Documents/Estudos/Shell-Script/Alura/imagens-livros/PNG

conversao_png(){
cd ~/Documents/Estudos/Shell-Script/Alura/imagens-livros
if
	[ ! -d $PNG ]
then
	mkdir -p $PNG
fi

for imagens in *.jpg
do
	imagens_sem_extensao=$(ls $imagens | awk -F. '{ print $1 }')
	convert $imagens_sem_extensao.jpg $PNG/$imagens_sem_extensao.png 
done
}

conversao_png 2> erros_conversao.txt
if [ $? -eq 0 ]
then
	echo "Imagens convertidas com sucesso!!!"
else
	echo "Ops...houve algum problema ao converter as imagens..."
fi
