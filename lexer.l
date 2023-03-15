%%
[A-Za-z_][A-Za-z0-9_]* {return ID;}
[0-9]+ {return CTE_L;}
[0-9]+\.[0-9]+([Ee][-+]?[0-9]+)? {return CTE_F;}
\"(\\.|[^"\\])*\" {return CTE_STR;}
[ \t\n] {/*ignore whitespace*/}
%%