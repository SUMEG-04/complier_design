%{
#include<stdio.h>
int cm=0;
%}

type int|boolean|float|double|char|byte|short

keyword auto|double|int|struct|break|long|else|switch|case|return|enum|typedef|char|register|extern union|const short|float|unsigned|continue|signed|for|void|default|sizeof|goto|volatile|do|static|if|while|cout|cin

start "/*"
end "*/"
nostar [^*]
sp [ \t\n]
dbend "*"[^/]

%s newstate

%%
"using" {;}
{type} {printf("[TYPE]");
fprintf(yyout,"[TYPE] : %s ",yytext);}

"//".* {cm++; printf("[single line comment]");
fprintf(yyout,"[SINGLES LINES COMMENT]: %s ",yytext);}

{start} { yymore();BEGIN newstate;}
<newstate>nostar {yymore(); BEGIN newstate;}
<newstate>sp {yymore(); BEGIN newstate;}
<newstate>dbend {yymore(); BEGIN newstate;}
<newstate>{end} {cm++; printf("[multiline comment]");BEGIN 0;
fprintf(yyout,"[MULTILINE COMMENT] : %s ",yytext);}

[0-9]+ {printf("[integer]");
fprintf(yyout,"[INTEGER] : %s ",yytext);}

[0-9]*[.][0-9]+ {printf("[float]");
fprintf(yyout,"[FLOAT] : %s ",yytext);}

[+\-*/%=] {printf("[operator]");
fprintf(yyout,"[OPERATION] : %s ",yytext);}


[a-zA-Z][a-zA-Z_0-9]*[=] {printf("[identifier]");
fprintf(yyout,"[IDENTIFIER] : %s ",yytext);}

[#][a-zA-Z][a-zA-Z_0-9]* {printf("[keyword]");
fprintf(yyout,"[KEYWORD] : %s ",yytext);}

{keyword} {printf("[keyword]");
fprintf(yyout,"[KEYWORD] : %s ",yytext);}

. {;}

%%
int yywrap()
{
return 1;
}
int main()
{
yyin=fopen("msg.txt","r");
yyout=fopen("detected.text","w");

yylex();

fclose(yyin);
fclose(yyout);

return 0;}
