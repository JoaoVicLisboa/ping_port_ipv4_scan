#!/bin/bash


if [ "$1" == "" ]
then
	echo "Coloque o endereço IP depois da chamada do script"
	echo "Exemplo $0 192.168.0 - Não precisa ser completo"
else
	for host in {1..254};
do
	ping -c 1 $1.$host | grep "64 bytes" | cut -d " " -f 4 |  sed 's/.$//'
done
fi

