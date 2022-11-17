%{
#include<stdio.h>
%}

%%

@ {return 0;}

. {
char n=*yytext;
int asc=(int)n;

if(asc >=97 && asc<=122){
int x=(int)n - 97;
x=(x+3)%26;

int z=97+x;
char ch=(char)z;

//fprintf(yyout,"%s",yytext);
fprintf(yyout,"%c",ch);
}
else{
if(asc>=65 && asc >=90)
{
int x=(int)n-65;
x=(x+3)%26;
int z=65+x;
char ch=(char)z;
//frpintf(yyout,"%s",yytext);
fprintf(yyout,"%c",ch);
}
else{
fprintf(yyout,"%s",yytext);
}}
}

%%
int yywrap()
{
return 1;
}


int main(){
yyin=fopen("msg.txt","r");
yyout=fopen("msgcypher.txt","w");

yylex();

fclose(yyin);
fclose(yyout);

return 0;
}
