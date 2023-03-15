%{
#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
void yyerror(const char *);
int yyparse();
int yylex();
int main();
%}

%start programa

%token ID
%token CTE_L
%token CTE_F
%token CTE_STR

%%
programa    : ID
%%

void yyerror(const char *s) {fprintf(stderr, "%s\n", s); exit(1);}

int yywrap() {return 1;}

int main() {yyparse();}
