#!/bin/bash


converte_imagem(){
	local caminho_imagem=$1
	local imagemsemextensao=$(echo $caminho_imagem | awk -F. '{print $1}')
	convert $imagemsemextensao.jpg $imagemsemextensao.png

}

varrer_diretorio() {
	cd $1
	for arquivo in *
	do
		local caminho_arquivo=$(find ~/Downloads/imagens-novos-livros -name $arquivo)
		echo $caminho_arquivo
		if [ -d  $caminho_arquivo ]
		then
			varrer_diretorio $caminho_arquivo
		else
			converte_imagem $caminho_arquivo
		fi
	done
}

varrer_diretorio ~/Downloads/imagens-novos-livros
if [ $? -eq 0 ] 
then
	echo "Conversão realizada com sucesso"
else
	echo "Houve um problema"
fi
