%{
#include<stdio.h>
#include<stdlib.h>
int yylex();
int yyerror(char* s);
%}

%token A B NL

%%
start: A A A A A A A A A A s B NL{printf("valid string\n"); return 0;};
s: s A |
 ;
%%

int main(void){
printf("Enter the string\n");
yyparse();
}

int yyerror(char* s)
{
printf("\ninvlid string\n");
return 0;
}
