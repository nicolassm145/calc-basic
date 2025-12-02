%{
  #include <stdio.h>
  #include <stdlib.h>

  int yylex();
  void yyerror(const char *s);

  /* Tabela de símbolos simples */
  double symbols[256];
%}

%union {
    double num;
    char var;
}

%token <num> NUM
%token <var> VAR
%token ATRIB MAIS MENOS VEZES DIVIDE ESQPAREN DIRPAREN EOL

%type <num> expressao termo fator

%left MAIS MENOS
%left VEZES DIVIDE

%%

inicio:
      | inicio declaracao EOL
      ;

declaracao:
          VAR ATRIB expressao { 
              symbols[$1] = $3;
              printf("[BISON] Atribuição: %c = %.4f\n", $1, $3);
              printf("\n===> %c = %.4f\n\n", $1, $3);
            }
          | expressao { 
              printf("\n===> RESULTADO = %.4f\n\n", $1); 
            }
          ;

expressao: 
          expressao MAIS termo { 
              printf("[BISON] E + T = %.4f + %.4f = %.4f\n", $1, $3, $1 + $3);
              $$ = $1 + $3; 
            }
          | expressao MENOS termo { 
              printf("[BISON] E - T = %.4f - %.4f = %.4f\n", $1, $3, $1 - $3);
              $$ = $1 - $3; 
            }
          | termo { 
              printf("[BISON] E → T = %.4f\n", $1);
              $$ = $1; 
            }
          ;

termo:
      termo VEZES fator { 
          printf("[BISON] T * F = %.4f * %.4f = %.4f\n", $1, $3, $1 * $3);
          $$ = $1 * $3; 
        }
      | termo DIVIDE fator { 
          if ($3 == 0) {
              yyerror("Erro: divisão por zero!");
              $$ = 0;
          } else {
              printf("[BISON] T / F = %.4f / %.4f = %.4f\n", $1, $3, $1 / $3);
              $$ = $1 / $3; 
          }
        }
      | fator { 
          printf("[BISON] T → F = %.4f\n", $1);
          $$ = $1; 
        }
      ;

fator:
      NUM { 
          printf("[BISON] F → N = %.4f\n", $1);
          $$ = $1; 
        }
      | VAR {
          printf("[BISON] F → VAR(%c) = %.4f\n", $1, symbols[$1]);
          $$ = symbols[$1];
        }
      | ESQPAREN expressao DIRPAREN { 
          printf("[BISON] F → (E) = %.4f\n", $2);
          $$ = $2; 
        }
      ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Erro: %s\n", s);
}

int main() {
    yyparse();
    return 0;
}
