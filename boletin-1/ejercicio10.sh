#!/bin/bash
#Realiza un script que nos permita realizar copias de seguridad del tipo .tar.gz de los directorios: /home y  v  /root
#La copia de seguridad se realizará en el directorio /tmp/copia con el nombre de:
#Host_fecha.tar.gz
#Donde: Host: es el nombre del equipo y Fecha: Año-mes-día
#Utiliza  las siguientes variables:
#DIR_BACKUP  Directorio de destino
#DIR_ORIGEN  Directorios orígenes
#HOST  El nombre del equipo
#FECHA  Año-mes-día
#Se debe comprobar si el directorio de destino existe, sino habrá que crearlo.
#Si la copia diaria ya se ha realizado deberá dar la posibilidad de reemplazar la copia.
#Deberá indicar si la copia ha sido realizada con éxito.
#Este script sólo puede ser ejecutado por el root.
clear

if [ $(id -u) -ne 0 ]
then
	dialog --infobox "No eres el root" 0 0;sleep 2;clear;exit
else
	continue
fi

dir_backup=/tmp/copia/$(hostname)_$(date +%y-%m-%d).tar.gz
dir_origen="/home /root"

if [ -d /tmp/copia ]
then
	continue
else
	mkdir /tmp/copia
fi
	
if [ -f $dir_backup ]
then
	dialog --infobox "Ya se ha realizado la copia de seguridad de hoy" 0 0;sleep 2;clear;exit
else
	tar -cf $dir_backup $dir_origen >/dev/null
	dialog --infobox "Copia realizada con éxito. Saliendo..." 0 0;sleep 2;clear;exit
fi











