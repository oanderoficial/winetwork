#!/usr/bin/env bash

BlueF='\e[1;34m'
cyan='\e[0;36m'
red='\e[1;31m'
yellow='\e[1;33m'


funcion_placas(){
       echo "*** listar as placas ativas ***"
       ifconfig -a
}

funcion_desabilitar(){
       echo "Desabilitar uma placa com endereço eth0)"
       ifconfig eth0 down
}

funcion_rotas(){
       echo " Ver as portas abertas no computador:"
       netstat -r
}

funcion_portas(){
       echo "Portas abertas no computador: "
       netstat -a
}

funcion_connection(){
       echo " Conexões TCP conectadas do seu computador: "
       netstat -nt
}

funcion_processos(){
       echo "Verificar os processos ativos"
       ps aux
}

funcion_uptime(){
       echo "uptime"
       uptime
}

funcion_logins(){
       echo " mostra os logins efetuados no sistema:"
       who -lH
}

funcion_address(){
       echo "endereços de rede configurados:"
       ip addr list
}

funcion_rede(){
       echo "Rede"
       echo -e "[+] Verificando conexao com a Internet..."
       sleep 0.15
       echo -e " um momento!\n"
       ping -c 1 google.com &> /dev/null
       if [ $? -gt 0 ]; then
        ping -c 1 uol.com.br &> /dev/null
       if [ $? -gt 0 ]; then
       echo "Verifique sua conexao..."
       echo ""
	 exit 1
       fi
       fi
        echo -e "[+] Internet OK!\n"
       sleep 0.15
}

funcion_space(){
       echo "Verificação de espaço em disco"
       df -h
}

funcion_system(){
       echo "Seu Sistema"
       cat /etc/os-release
}

funcion_logs(){
       echo "Verificação de Logs"
       tail -400 /var/log/messages
}

echo -e $BlueF "
 _______ _______     _______ _______ _______ _______ _______ _______ _______
|\     /|\     /|   |\     /|\     /|\     /|\     /|\     /|\     /|\     /|
| +---+ | +---+ |   | +---+ | +---+ | +---+ | +---+ | +---+ | +---+ | +---+ |
| |   | | |   | |   | |   | | |   | | |   | | |   | | |   | | |   | | |   | |
| |w  | | |i  | |   | |n  | | |e  | | |t  | | |w  | | |o  | | |r  | | |k  | |
| +---+ | +---+ |   | +---+ | +---+ | +---+ | +---+ | +---+ | +---+ | +---+ |
|/_____\|/_____\|   |/_____\|/_____\|/_____\|/_____\|/_____\|/_____\|/_____\|

 "
echo -e $red "Para chamar o menu de opções pressione ENTER"
echo -e $yellow "Digite o Número Desejado"
echo -e $cyan "                                          [Autor: Anderson.b.Silva]"
echo ""


select i in  placas/ativas Desabilitar/eth0 Rotas portas/abertas Conexões/TCP processos/ativos uptime logins/efetuados endereços/configurados Rede Espaço/Disco Sistema Logs sair
do

   case "$i" in

   placas/ativas)
   funcion_placas
    ;;

   Desabilitar/eth0)
   funcion_desabilitar
    ;;

   Rotas)
   funcion_rotas
    ;;

   portas/abertas)
   funcion_portas
    ;;

   Conexões/TCP)
   funcion_connection
    ;;

   processos/ativos)
   funcion_processos
    ;;

   uptime)
   funcion_uptime
    ;;

   logins/efetuados)
   funcion_logins
    ;;

   endereços/configurados)
   funcion_address
    ;;

   Rede)
   funcion_rede
   ;;
   
   Espaço/Disco)
   funcion_space
   ;;

   Sistema)
   funcion_system
   ;;

   Logs)
   funcion_logs
   ;;
   
   sair)
   echo "See you later!"
   break
   ;;

      *)
         echo "opcao invalida, tente novamente"
         ;;


   esac

done

exit 0
