%{
#include "y.tab.h"
%}
/* defined section */
%%
[0-9]+ {yylval=atoi(yytext); return NUMBER;} //this is send to the yacc code as
[a-zA-Z]+ {return ID;} //this is send to the yacc code as token ID [\t]+ ;
\n {return 0;}
. {return yytext[0];}
%%
int yywrap()
{
return 1;
}

