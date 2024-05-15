#!/bin/bash

#Variables para las IP
MY_WINIP="10.65.0.14"
MY_IP="10.65.0.77"
GUILLERMO_IP="10.65.0.63"

#Vaciar y reiniciar las tablas
iptables -F
iptables -X
iptables -Z
iptables -t nat -F

#Politicas por defecto
iptables -P INPUT ACCEPT
iptables -P OUTPUT ACCEPT
iptables -P FORWARD ACCEPT

#Aceptar localhost
#iptables -A INPUT -s 127.0.0.1 -j ACCEPT
#iptables -A OUTPUT -s 127.0.0.1 -j ACCEPT
#iptables -A FORWARD -s 127.0.0.1 -j ACCEPT

#Aceptar SSH de la maquina de Guillermo
iptables -A INPUT -p tcp --dport 22 -s $GUILLERMO_IP -j ACCEPT
iptables -A OUTPUT -p tcp --sport 22 -d $GUILLERMO_IP -j ACCEPT

iptables -A INPUT -p tcp --dport 22 -s $MY_WINIP -j ACCEPT
iptables -A OUTPUT -p tcp --sport 22 -d $MY_WINIP -j ACCEPT

#Redireccionar del 6666 al 3306
iptables -t nat -A PREROUTING  -s $GUILLERMO_IP -p tcp --dport 6666 -j REDIRECT --to-port 3306
iptables -t nat -A OUTPUT -d $GUILLERMO_IP -p tcp --sport 3306 -j REDIRECT --to-port 6666

