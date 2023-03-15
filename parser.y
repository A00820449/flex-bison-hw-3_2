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

%token PROGRAM
%token IF
%token ELSE
%token VAR
%token INT
%token FLOAT
%token PRINT
%token NOT_EQUAL

%token ID
%token CTE_L
%token CTE_F
%token CTE_STR

%%
programa    : PROGRAM ID ':' prog_vars bloque {printf("ACCEPTED\n");}
            ;
prog_vars   : vars
            |
            ;
vars        : VAR var_decl var_decls
            ;
var_decl    : ID id_list ':' tipo ';'
            ;
var_decls   : var_decl var_decls
            |
            ;
id_list     : ',' ID id_list
            |
            ;
tipo        : INT
            | FLOAT
            ;
bloque      : '{' estatutos '}'
            ;
estatutos   : estatuto estatutos
            |
            ;
estatuto    : asignacion
            | condicion
            | escritura
            ;
asignacion  : ID '=' expresion ';'
            ;
condicion   : IF '(' expresion ')' bloque else_cond ';'
            ;
else_cond   : ELSE bloque
            |
            ;
escritura   : PRINT '(' printable printables ')' ';'
            ;
printable   : expresion
            | CTE_STR
            ;
printables  : ',' printable printables
            |
            ;
expresion   : exp exps
            ;
exps        : exp_op exp
            |
            ;
exp_op      : '>'
            | '<'
            | NOT_EQUAL
            ;
exp         : termino terminos
terminos    : term_op termino terminos
            |
            ;
term_op     : '+'
            | '-'
            ;
termino     : factor factores
            ;
factores    : factor_op factor factores
            |
            ;
factor_op   : '*'
            | '/'
            ;
factor      : '(' expresion ')'
            | unary_op var_cte
            ;
unary_op    : '+'
            | '-'
            |
            ;
var_cte     : ID
            | CTE_F
            | CTE_L
            ;
%%

void yyerror(const char *s) {fprintf(stderr, "%s\n", s); exit(1);}

int yywrap() {return 1;}

int main() {yyparse();}
