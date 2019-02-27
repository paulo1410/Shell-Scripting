#!/bin/bash

memoria_total=$(free | grep -i mem | awk '{ print $2 }')
memoria_consumida=$(free | grep -i mem | awk '{ print $3 }')
relacao_memoria_atual_total=$(bc <<< "scale=2;$memoria_consumida/$memoria_total *100" | awk -F. '{ print $1 }')

if [ $relacao_memoria_atual_total -gt 50 ]
then
  echo "O consumo de memória está a cima do limite. Atualmente o consumo e de $(free -h | grep -i mem | awk '{ print $3 }') "
fi
