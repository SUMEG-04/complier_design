%{
#include<stdio.h>
#include<string.h>
int operator_count=0,operand_count=0,valid=1,top=-1,l=0,j=0,k=0;
char operand[10][10],operator[10][10],stack[100];
%}

/*let us assume that there is an expression which is iif it is in the following form
a+b
(a+b)+c
a+(b*c)*/
%%
"(" {top++;stack[top]='(';}
")" {
if(stack[top]!='('){
      valid=0;
}
else if(operand_count>0 && (operand_count-operator_count)!=1){
valid=0;
}
else{
top--;
operand_count=1;
operator_count=0;
}
}
"+"|"-"|"*"|"/" {
operator_count++;
strcpy(operator[l],yytext);
l++;
}
[0-9]+|[a-zA-Z][a-zA-Z0-9_]* {
operand_count++;
strcpy(operand[j],yytext);
j++;
}
\n {return 0;}
%%



int main(){
printf("enter your airthmetic expression ");
yylex();

if(valid==1 && top==-1)
{
printf("\nValid Expression\n");
}
else
{
printf("\nInvalid Expression\n");
}

return 0;
}

int yywrap()
{return 1;}
