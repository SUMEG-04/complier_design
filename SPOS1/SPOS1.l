%{
#include<stdio.h>
int line=0,word=0,c_letter=0,num=0,spl_chr=0,total=0;
%}

%%
\n {line++;word++;}
[\t ' '] word++;
[a-zA-Z] c_letter++;
[0-9] num++;
. spl_chr++;
%%

int main()
{
    yyin=fopen("samplefile.txt","r");
    yylex();
    total=c_letter+num+spl_chr;
    printf("\nfile Contents...\n");
    printf("\n\t%d lines",lines); 
    printf("\n\t%d words",words);
    printf("\n\t%d characters",c_letter);
    printf("\n\t%d DIgits",num);
    printf("\n\t%d special character",spl_chr);
    printf("\n\t total %d characters",total);
    return 0;
}

int yywrap()

{return 1;}

