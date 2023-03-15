%{
#include "parser.tab.h"
%}
%%
[ \t\n]+ {/*ignore whitespace*/}
[A-Za-z_][A-Za-z0-9_]* {return ID;}
[0-9]+\.[0-9]+([Ee][-+]?[0-9]+)? {return CTE_F;}
[0-9]+ {return CTE_L;}
\"(\\.|[^"\\])*\" {return CTE_STR;}
%%