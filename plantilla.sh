#/bin/bash
#Autor: Sergio Lagüens Tornero
#Fecha: 23/10/2020
#Descripción: Esta es la plantilla para cualquier script

funcionComprobacionRoot(){
if [ $(id -u) -ne 0 ] ; then
	clear "No eres el root"
	sleep 2;clear;exit 1
else
	continue
fi;}
funcionComprobacionParametros(){
if [ $1 -eq 2 ] ; then
	continue
else
	echo "El número de parámetros es incorrecto, tienen que ser x parámetros"
	sleep 2;clear;exit 1
fi;}

comprobacionRoot
comprobacionParametros $#

opcion=$1
dni=$2

emp=grep -w $dni empleados
numero=cut -d: -f1
nombre=cut -d: -f2
apel=cut -d: -f3
puesto=cut -d: -f5
suelmen=cut -d: -f6

case $1 in 
m) 	echo "DATOS DEL EMPLEADO"
	echo "_______________________"
	echo ""
	echo "Nº Empleado: $numero"
	echo "Nombre: $nombre"
	echo "Apellido: $apel"
	echo "DNI: $dni"
	echo "Puesto: $puesto"
	echo "Sueldo mensual: $suelmen"
	echo "_______________________"
;;

a)	echo "SUELDO ANUAL DEL EMPLEADO"
	echo "_______________________"
	echo ""
	echo "Nombre: $nombre"
	echo "Apellido: $apel"
	echo "DNI: $dni"
	echo "Sueldo mensual: $suelmen"
	echo "Sueldo anual: $suelan"
	echo "_______________________"
;;

*)	echo "Parámetro incorrecto, el priemr parámetro debe de ser 'm' o 'a'"
	exit 1;
esac
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
