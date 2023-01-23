#!/bin/bash

URL="recargapay.com.br"

resposta_http=$(curl --write-out %{http_code} --silent --output /dev/null https://$URL)
if [ $resposta_http -eq 200 ]
then
	mail -s "Site OK" vinytisolution@gmail.com<<dell
A página WEB está funcionando corretamente, Status 200!
dell
fi
