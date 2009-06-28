#!/bin/sh
flex microEX.l
bison microEX.ypp -d
g++ microEX.tab.cpp lex.yy.c -ll

