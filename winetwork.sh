#!/bin/bash


BlueF='\e[1;34m'
cyan='\e[0;36m'
red='\e[1;31m'
yellow='\e[1;33m'
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
   echo "*** listar as placas ativas ***"
   ifconfig -a
    ;;

   Desabilitar/eth0)
   echo "Desabilitar uma placa com endereço eth0)"
   ifconfig eth0 down
    ;;

   Rotas)
   echo " Ver as portas abertas no computador:"
   netstat -r
    ;;

   portas/abertas)
   echo "Portas abertas no computador: "
   netstat -a
    ;;

   Conexões/TCP)
   echo " Conexões TCP conectadas do seu computador: "
   netstat -nt
    ;;

   processos/ativos)
   echo "Verificar os processos ativos"
   ps aux
    ;;

   uptime)
   echo "uptime"
   uptime
    ;;

   logins/efetuados)
   echo " mostra os logins efetuados no sistema:"
   who -lH
    ;;

   endereços/configurados)
   echo "endereços de rede configurados:"
   ip addr list
    ;;

   Rede)
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
   ;;
   
   Espaço/Disco)
   echo "Verificação de espaço em disco"
   df -h
   ;;

   Sistema)
   echo "Seu Sistema"
   cat /etc/os-release
   ;;

   Logs)
   echo "Verificação de Logs"
   tail -400 /var/log/messages
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
