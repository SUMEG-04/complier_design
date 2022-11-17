%{
#include<stdio.h>
int valid=1;
int yylex();
int yyerror(char *s);
%}

%token digit id
%left '+' '-'
%left '*' '/'

%%
start: s{printf("\nResult=%d\n",$$); return 0;};
s: s '+' s {$$=$1+$3;}
   | s '-' s {$$=$1-$3;}
   | s '*' s {$$=$1*$3;}
   | s '/' s {$$=$1/$3;}
   | '-' digit {$$=-$2;}
   | '-' id {$$=-$2;}
   | digit {$$=$1;}
   | id {$$=$1;}
   ;
%%

int main(void)
{
printf("\nYou can only enter either integer or operator");
printf("\nENter your expression to compute ");
yyparse();
if(valid==1){
printf("\nIt is a vaild expression!\n");
}
}

int yyerror(char *s){
valid=0;
printf("\nInvalid Expression\n");
return 0;
}
