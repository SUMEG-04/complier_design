%{
#include<stdio.h>
#include<stdlib.h>
int yylex();
int yyerror(char* s);
%}

%token A B C NL

%%
start: s NL{printf("valid string\n"); return 0;};
s: A s B
 | 
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
