%{
  #include <stdio.h>
  #include <stdlib.h>

  int yylex();
  void yyerror(const char *s);
%}

/* Com isso agora funciona numeros reais */
%union {
  double num;
}

/* Tokens do Lexico */
%token <num> num
%type <num> expressao termo fator
%token MAIS MENOS VEZES DIVIDE
%token ESQPAREN DIRPAREN
%token EOL

/* Pra fazer calculo certo */
%left MAIS MENOS
%left VEZES DIVIDE

%%

/*
  S → E
  E → E + T | E - T | T
  T → T * F | T / F | F
  F → N | ( E )
*/

inicio:
    | inicio expressao EOL { 
        printf("\n===> RESULTADO = %.4f\n\n", $2); 
      }
    ;

expressao: 
    expressao MAIS termo { 
        printf("[BISON] Redução: E + T = %.4f + %.4f = %.4f\n", $1, $3, $1 + $3);
        $$ = $1 + $3; 
      }
    | expressao MENOS termo { 
        printf("[BISON] Redução: E - T = %.4f - %.4f = %.4f\n", $1, $3, $1 - $3);
        $$ = $1 - $3; 
      }
    | termo { 
        printf("[BISON] Redução: E → T = %.4f\n", $1);
        $$ = $1; 
      }
    ;

termo:
    termo VEZES fator { 
        printf("[BISON] Redução: T * F = %.4f * %.4f = %.4f\n", $1, $3, $1 * $3);
        $$ = $1 * $3; 
      }
    | termo DIVIDE fator { 
        if ($3 == 0) {
            yyerror("Erro: divisão por zero!");
            $$ = 0;
        } else {
            printf("[BISON] Redução: T / F = %.4f / %.4f = %.4f\n", $1, $3, $1 / $3);
            $$ = $1 / $3; 
        }
      }
    | fator { 
        printf("[BISON] Redução: T → F = %.4f\n", $1);
        $$ = $1; 
      }
    ;

fator:
    num { 
        printf("[BISON] Redução: F → N = %.4f\n", $1);
        $$ = $1; 
      }
    | ESQPAREN expressao DIRPAREN { 
        printf("[BISON] Redução: F → (E) = %.4f\n", $2);
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
