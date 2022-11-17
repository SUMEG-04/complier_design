%{
#include<stdio.h>
int n=0,m=4;
%}

%%
[a][b][c][d] {n++;for(int i=n*m-1;i>=0;i--){
for(int j=0;j<=i;j++){
fprintf(yyout,"%c",yytext[j]);
}
fprintf(yyout,"\n");
}
}
%%

int main()
{
yyin=fopen("text.txt","r");
yyout=fopen("text.c","w");
yylex();
fclose(yyin);
fclose(yyout);
return 0;
}

int yywrap(){
return 1;}
