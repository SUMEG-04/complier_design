%{
#include<stdio.h>
#include<math.h>
int k=0;
%}

%%

[a-zA-Z]+ {
if(yyleng>k){
k=yyleng;
}
}
[0-9]+ {}

%%

int main()
{
yyin=fopen("samplefile.txt","r");
yylex();
printf("\n\t%d max length of word",k);
printf("\n");
fclose(yyin);
return 0;
}

int yywrap()
{
return 1;
}

