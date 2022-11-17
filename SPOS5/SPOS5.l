%{
#include<stdio.h>
int cn=0;
%}

%%
[a-zA-Z][a-zA-Z_0-9]*[=] {cn++;}

%%

int main(){
yyin=fopen("msg.txt","r");
yylex();
printf("\n\t%d no. of identifiers",cn);
fclose(yyin);
return 0;
}

int yywrap()
{
return 1;
}

