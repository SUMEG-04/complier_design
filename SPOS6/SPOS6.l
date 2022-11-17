%{
#include<stdio.h>
int line=0,word=0,c_letter=0,b_space=0;
%}

%%
\n {line++;word++;}
[\t ' '] {word++;b_space++;}
[a-zA-Z0-9] c_letter++;

%%

int main()
{
    yyin=fopen("samplefile.txt","r");
    yylex();
    printf("\nfile Contents...\n");
    printf("\n\t%d lines",line);			
    printf("\n\t%d words",word);
    printf("\n\t%d characters",c_letter);
    printf("\n\t%d white space",b_space);
    return 0;
}

int yywrap()

{return 1;}

