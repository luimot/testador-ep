#! /bin/bash

if gcc -Wall -std=c99 -pedantic -O2 ep1.c -o ep1.out -lm ; then
	#Testa de 0 a 9:
	for NUM_TEST in {0..9}
	do
		printf "${1}\n${NUM_TEST}" > tt.in
		./ep1.out < tt.in
		ps2pdf ep1out.ps && google-chrome ep1out.pdf &
		sleep 2
	done
else
	echo "Erro!"
fi
