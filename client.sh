#!/bin/bash


PORT="2022"

echo "Cliente de Dragon Magia Abuelita Miedo 2022"

echo "1. ENVIO DE CABECERA"

echo "DMAM" | nc 127.0.0.1 $PORT

DATA=`nc -l $PORT`

# SI DATA ES DIFERENTE A OK HEADER, MENSAJE
#DE ERROR Y EXIT 1
if [ "$DATA " != "OK_HEADER" ]
then
	echo "ERROR 1: el header se envio incorrectamente"
	exit 1
fi
