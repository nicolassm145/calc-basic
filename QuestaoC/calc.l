%{
  #include "calc.tab.h"
  #include <stdlib.h>
%}

%%

[0-9]+\.[0-9]+  { 
                  yylval.num = atof(yytext); 
                  printf("[LEX] Número real: %s\n", yytext);
                  return NUM; 
                }

[0-9]+          { 
                  yylval.num = atof(yytext); 
                  printf("[LEX] Número inteiro: %s\n", yytext);
                  return NUM; 
                }

[a-zA-Z]        { 
                  yylval.var = yytext[0]; 
                  printf("[LEX] Variável: %c\n", yytext[0]);
                  return VAR; 
                }

"="             { printf("[LEX] Atribuição: =\n"); return ATRIB; }
"+"             { printf("[LEX] Operador: +\n"); return MAIS; }
"-"             { printf("[LEX] Operador: -\n"); return MENOS; }
"*"             { printf("[LEX] Operador: *\n"); return VEZES; }
"/"             { printf("[LEX] Operador: /\n"); return DIVIDE; }

"("             { printf("[LEX] Parêntese: (\n"); return ESQPAREN; }
")"             { printf("[LEX] Parêntese: )\n"); return DIRPAREN; }

"\n"            { printf("[LEX] Nova linha\n"); return EOL; }
[ \t]           { /* ignora espaços e tabs */ }
.               { printf("[LEX] Caractere inválido: %s\n", yytext); }

%%

int yywrap() {
    return 1;
}
