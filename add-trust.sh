#!/bin/sh

HOST=$2
USER=$1

if [ -z $HOST -o -z $USER ]; then
	echo "sh $0 user host"
	exit
fi

if [ ! -e ~/.ssh/id_rsa.pub ]; then
	echo "id_ras.pub not exists"
	exit
fi

PUB_RSA=`cat ~/.ssh/id_rsa.pub`

ssh ${USER}@${HOST} "echo $PUB_RSA >> ~/.ssh/authorized_keys"
