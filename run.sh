#! /bin/bash
###Altere os valores NOMEARQ para a saída (.ps) que você programou no seu programa .c
###Altere o valor de INICIO e FIM para alterar até que ordem você quer que o script execute
NOMEARQ="ep1out"
INICIO=6
FIM=6

[[ ! -f tt.in ]] && touch tt.in
[[ ! -f $NOMEARQ".pdf" ]] && touch $NOMEARQ".pdf"
if gcc -Wall -std=c99 -pedantic -O2 ep1.c -o ep1.out -lm ; then
	if [ $# -eq 0 ]
	then
		echo "Nao foram encontrados argumentos, coloque-os para selecionar o tipo de fractal!"
	else
	#Testa de 0 a 9:
		for (( NUM_TEST=$INICIO; NUM_TEST<=$FIM; NUM_TEST++ ))
		do
			printf "${1}\n${NUM_TEST}" > tt.in
			./ep1.out < tt.in
			ps2pdf $NOMEARQ".ps" && google-chrome $NOMEARQ".pdf" &
			sleep 2
		done
	fi
else
	echo "Erro ou Warning!"
fi
