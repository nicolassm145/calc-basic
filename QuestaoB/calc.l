%{
  #include "calc.tab.h"
  #include <stdlib.h>
%}

%%

[0-9]+\.[0-9]+  { 
                  yylval = atof(yytext); 
                  printf("[LEX] Número real reconhecido: %s\n", yytext);
                  return NUM; 
                }

[0-9]+          { 
                  yylval = atof(yytext); 
                  printf("[LEX] Número inteiro reconhecido: %s\n", yytext);
                  return NUM; 
                }

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
