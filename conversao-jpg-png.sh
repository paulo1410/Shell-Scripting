#!/bin/bash

converte_imagem() {
cd ~/Downloads/imagens-livross

if  [ ! -d png ]
then
	mkdir png
fi

for imagem in *.jpg
do
	local imagem_sem_extensao=$(echo $imagem | awk -F. '{print $1}')
	convert $imagem png/$imagem_sem_extensao.png

done
}

clear
converte_imagem 2>erros_converte.txt

if [ $? -eq 0 ]
then
	echo "Conversão Realizada com sucesso"
else
	echo "Houve uma falha no processo"
fi



