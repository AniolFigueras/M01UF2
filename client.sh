#!/bin/bash

if [ "$1" == "" ]
then
	echo "Debes indicar la direccecion del servidor."
	echo "Ejemplo:"
	echo -e "\t$0 127.0.0.1"
	exit 1
fi

IP_SERVER=$1

IP=`ip a | grep "scope global" | xargs | cut -d " " -f 2 | cut -d "/" -f 1`
PORT="2022"

echo "Cliente de Dragon Magia Abuelita Miedo 2022"

echo "1. ENVIO DE CABECERA"

echo "DMAM $IP" | nc 127.0.0.1 $PORT

DATA=`nc -l $PORT`

echo "3. COMPROBANDO HEADER"

# SI DATA ES DIFERENTE A OK_HEADER, MENSAJE
# DE ERROR Y EXIT 1
if [ "$DATA" != "OK_HEADER" ]
then
	echo "ERROR 1: el header se envio incorrectamente"
	exit 1
fi

echo "4. ENVIADO EL FILE_NAME"

FILE_NAME="dragon.txt"

echo "FILE_NAME $FILE_NAME" | nc $IP_SERVER $PORT

DATA=`nc -l $PORT`

echo "7. RECIBIENDO COMPROBACION FILE_NAME"

if [ "$DATA" != "OK_FILE_NAME" ]
then
	echo "ERROR 2: El filename se envio incorrectamente"
	exit 2
fi

echo "8. ENVIANDO CONTENIDO"

cat client/dragon.txt | nc $IP_SERVER $PORT

DATA=s`nc -l $PORT`
