#!/bin/bash

if [ "$1"  == "" ];
then
	echo "Coloque o ip da rede na execução do script"
	echo "Exemplo: $0 192.168.0 - Não precisa ser completo"
elif [ "$2"  == "" ];
then
	echo "Caso queira colocar uma porta, pode colocar logo após o ip"
	echo "Podem ser usadas as seguintes portas:"
	echo "80 HTTP"
	echo "443 HTTPS"
	echo "22 SSH"
	echo "21 FTP"
	echo "25 e 587 SMTP"
	echo "53 DNS"
	echo "110 POP3"
	echo "143 IMAP"
	echo "3389 RDP"
	echo "8080 e 8443 HTTP Alternativo"

else
	for ip in {1..254};
	do
	hping3 -S -p $2 -c 1 $1.$ip 2> /dev/null  | grep "flags=SA" | cut -d " " -f 2 | cut -d "=" -f 2

	# 1> STDOUT
	# 2> STDERR
	# 0> STDIN
done

fi
