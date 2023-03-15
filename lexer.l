%{
#include "parser.tab.h"
%}
%%
"program" {return PROGRAM;}
"if" {return IF;}
"else" {return ELSE;}
"int" {return INT;}
"float" {return FLOAT;}
"print" {return PRINT;}
"var" {return VAR;}

"<>" {return NOT_EQUAL;}

[ \t\n]+ {/*ignore whitespace*/}
[A-Za-z_][A-Za-z0-9_]* {return ID;}
[0-9]+\.[0-9]+([Ee][-+]?[0-9]+)? {return CTE_F;}
[0-9]+ {return CTE_L;}
\"(\\.|[^"\\])*\" {return CTE_STR;}
. {return yytext[0];}
%%