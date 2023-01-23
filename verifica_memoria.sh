#!/bin/bash

memoria_total=$(free | grep -i mem | awk '{ print $2 }')
memoria_consumida=$(free | grep -i mem | awk '{ print $3 }')
relacao_memoria_atual=$(bc <<< "scale=2;$memoria_consumida/$memoria_total *100" | awk -F. '{ print $1 }')


if [ $relacao_memoria_atual -gt 20 ]
then
mail -s "O consumo de memória acima do limite" vinytisolution@gmail.com<<del
O consumo de memória está acima do limite. Atualmente o consumo é de $(free -h | grep -i mem | awk '{ print $3 }')
del
fi

