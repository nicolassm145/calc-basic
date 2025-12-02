# Calculadora Simples - Flex + Bison 

##  Descrição
Implementação de uma calculadora simples usando **Flex** (analisador léxico) e **Bison** (analisador sintático) baseada na seguinte Gramática Livre de Contexto (GLC):

```
S → E
E → E + T | E - T | T
T → T * F | T / F | F
F → N | ( E )
```

Onde: `N = [0-9]+` (números inteiros)

### Restrições
- A calculadora aceita **apenas números inteiros**
- Números reais (ex: `2.5`, `3.14`) **não são suportados** e gerarão erro
- Demonstra o funcionamento dos analisadores léxico e sintático

---


## Como Compilar

### Pré-requisitos
- `flex` (analisador léxico)
- `bison` (analisador sintático)
- `gcc` (compilador C)

### Comandos de Compilação

```bash
# 1. Gerar o parser com Bison
bison -d calc.y

# 2. Gerar o scanner com Flex
flex calc.l

# 3. Compilar tudo com GCC
gcc calc.tab.c lex.yy.c -o calc
```

**Comando único:**
```bash
bison -d calc.y && flex calc.l && gcc calc.tab.c lex.yy.c -o calc
```

---

## Como Executar

### Modo Interativo
```bash
./calc
```

Digite expressões e pressione **ENTER** para ver o resultado:
```
2 + 3
5 * 4 - 2
(10 + 5) / 3
```

Para sair: **Ctrl+D** (Linux/Mac) ou **Ctrl+Z** (Windows)

### Usando Arquivos de Teste

#### Teste 1 - Operação Simples (`5 + 3`)
```bash
./calc < teste1.txt
```

**Saída esperada:**
```
[LEX] Número reconhecido: 5
[LEX] Operador: +
[LEX] Número reconhecido: 3
[LEX] Nova linha
[BISON] Redução: F → N = 5
[BISON] Redução: T → F = 5
[BISON] Redução: E → T = 5
[BISON] Redução: F → N = 3
[BISON] Redução: T → F = 3
[BISON] Redução: E + T = 5 + 3 = 8

===> RESULTADO = 8
```

#### Teste 2 - Operação com Parênteses (`10 * (2 + 3)`)
```bash
./calc < teste2.txt
```

**Saída esperada:**
```
[LEX] Número reconhecido: 10
[LEX] Operador: *
[LEX] Parêntese: (
[LEX] Número reconhecido: 2
[LEX] Operador: +
[LEX] Número reconhecido: 3
[LEX] Parêntese: )
[LEX] Nova linha
[BISON] Redução: F → N = 10
[BISON] Redução: T → F = 10
[BISON] Redução: F → N = 2
[BISON] Redução: T → F = 2
[BISON] Redução: E → T = 2
[BISON] Redução: F → N = 3
[BISON] Redução: T → F = 3
[BISON] Redução: E + T = 2 + 3 = 5
[BISON] Redução: F → (E) = 5
[BISON] Redução: T * F = 10 * 5 = 50

===> RESULTADO = 50
```

#### Teste 3 - Números Reais (`7.5 + 2.3`) - **ERRO ESPERADO**
```bash
./calc < teste3.txt
```

**Saída esperada:**
```
[LEX] Número reconhecido: 7
[LEX] Caractere inválido: .
[LEX] Número reconhecido: 5
[LEX] Operador: +
[LEX] Número reconhecido: 2
[LEX] Caractere inválido: .
[LEX] Número reconhecido: 3
[LEX] Nova linha
Erro: syntax error
```

**Explicação:** O analisador léxico reconhece números inteiros separadamente e trata o `.` como caractere inválido, causando erro sintático.

---


## 📄 Licença

Veja o arquivo [LICENSE](LICENSE) para mais detalhes.