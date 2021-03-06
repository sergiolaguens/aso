#/bin/bash
#Autor: Sergio Lagüens Tornero
#Fecha: 23/10/2020
#Descripción: Esta es la plantilla para cualquier script
clear

funcionComprobacionRoot(){
if [ $(id -u) -ne 0 ] ; then
	return 0
else
	return 1
fi;}
funcionMenu(){
dialog --nocancel --menu "NOMBRE" 0 0 5 \
1 "Listar archivos" \
2 "Ver directorios de trabajo" \
3 "Crear directorio" \
4 "Borrar directorio" \
5 "Crear usuario" \
6 "Borrar usuario" \
7 "Salir" 2>fich
opcion=$(cat fich)
rm -r fich
#echo "MENÚ PRINCIPAL"
#echo "1.- Listar archivos"
#echo "2.- Ver directorios de trabajo"
#echo "3.- Crear directorio" 
#echo "4.- Borrar directorio"
#echo "5.- Crear usuario"
#echo "6.- Borrar usuario"
#echo "7.- Salir"
}

opcion=0
while [ $opcion -ne 7 ]
do
funcionMenu
#read -p "Elige una opción: " opcion
echo "\n"
sleep 1
	case $opcion in 
	1)clear; dialog --nocancel --msgbox "$(ls -la)" 0 0
	;;
	2)clear; dialog --nocancel --msgbox "$(pwd)" 0 0
	;;
	3) dialog --nocancel --inputbox "Diga el nombre del directorio: " 0 0 2>dir1
		directorioCrear=$(cat dir1)
		rm -f dir1
		mkdir "$directorioCrear"; clear
	;;
	4)dialog --nocancel --inputbox "Diga el nombre del directorio: " 0 0 2>fich2
		directorioBorrar=$(cat fich2)
		rm -f fich2
		if [ -d $directorioBorrar ]
		then
			if [ $(ls -la $directorioBorrar|wc -l) -eq 3 ]
			then
				rm -r $directorioBorrar
			else
			dialog --nocancel --msgbox "El directorio no está vacío" 0 0; sleep 2;clear
			fi
		else
			dialog --nocancel --msgbox "El nombre no hace referencia a un directorio" 0 0
			sleep 2; clear; break
		fi
	;;
	5)
		if [ funcionComprobacionRoot -ne 0 ]
		then
			dialog --nocancel --msgbox "No eres el root" 0 0
			sleep 2
		else
			dialog --nocancel --inputbox "Diga el nombre del directorio: " 0 0 2>fich3
			nombreUsuario=´cat fich3´
			rm -r fich3; useradd -m $nombreUsuario;clear
		fi
	;;
	6)
		if [ funcionComprobacionRoot -ne 0 ]
		then
			dialog --nocancel --msgbox "No eres el root" 0 0
			sleep 2
		else
			dialog --nocancel --inputbox "Diga el nombre del directorio: " 0 0 2>fich4
			nombreUsuario2=´cat fich4´
			rm -r fich3; userdel -r $nombreUsuario2; clear
		fi
	;;
	7)clear; exit
	;;
	*)clear; exit 1
	;;
	esac
	echo ""
done


