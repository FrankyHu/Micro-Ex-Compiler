%{
#include "microEX.tab.hpp"
#include <iostream>
using namespace std;
extern symtab *findForSymbol(const char *s, const char *s2);
extern symtab *findForOP(const char *s);
%}
%%
[pP][rR][oO][gG][rR][aA][mM]		{return PROGRAM;}
[bB][eE][gG][iI][nN]			{return BEGIN_T;}
[eE][nN][dD]				{return END;}
[iI][fF]				{return IF;}
[tT][hH][eE][nN]			{return THEN;}
[eE][lL][sS][eE]			{return ELSE;}
[eE][nN][dD][iI][fF]			{return ENDIF;}
[fF][oO][rR]				{return FOR;}
[tT][oO]				{return TO;}
[dD][oO][wW][nN][tT][oO]		{return DOWNTO;}
[sS][tT][eE][pP]			{return STEP;}
[eE][nN][dD][fF][oO][rR]		{return ENDFOR;}
[wW][hH][iI][lL][eE]			{return WHILE;}
[eE][nN][dD][wW][hH][iI][lL][eE]	{return ENDWHILE;}
[dD][eE][cC][lL][aA][rR][eE]		{return DECLARE;}
[aA][sS]				{return AS;}
[iI][nN][tT][eE][gG][eE][rR]		{yylval.opt = findForOP("Integer");return INTEGER;}
[fF][lL][oO][aA][tT]			{yylval.opt = findForOP("Float");return FLOAT;}
":="					{return ASSIGN;}
">="					{return GE;}
"<="					{return LE;}
"=="					{return E;}
"!="					{return NE;}
">"					{return JL;}
"<"					{return JG;}
[0-9]+\.?[0-9]*[eE][+-]?[0-9]+		{yylval.symp = findForSymbol(yytext,"EXP_FLOAT_LITERAL");return EXP_FLOAT_LITERAL;}
[0-9]+\.[0-9]*				{yylval.symp = findForSymbol(yytext,"Float");return FLOAT_LITERAL;}
[0-9]+					{yylval.symp = findForSymbol(yytext,"Integer");return INT_LITERAL;}
\"[ -~]*\"				{yylval.symp = findForSymbol(yytext,"STR_LITERAL");return STR_LITERAL;}
[a-zA-Z_][0-9a-zA-Z_]*			{yylval.symp = findForSymbol(yytext,"");return ID;}
[\t\r\n ]+ ; 				// ignore 
\%\%[ -~]+ ;				// ignore comment
.					{return yytext[0];}
%%
