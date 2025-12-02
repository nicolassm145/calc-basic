# Calculadora com Números Reais - Flex + Bison (Questão B)

## Descrição
Implementação **modificada** de uma calculadora usando **Flex** (analisador léxico) e **Bison** (analisador sintático) baseada na seguinte Gramática Livre de Contexto (GLC):

```
S → E
E → E + T | E - T | T
T → T * F | T / F | F
F → N | ( E )
```

### Modificações da Parte B
- A calculadora aceita **números inteiros E reais**
- Suporta números decimais (ex: `2.5`, `3.14`, `10.0`)
- Usa tipo `double` para todos os cálculos
- Mantém o rastreamento completo dos analisadores

### Mudanças Implementadas

#### Analisador Léxico (calc.l)
- **Regex ampliada:** `[0-9]+\.[0-9]+` para números reais
- **Conversão:** `atof()` ao invés de `atoi()`
- Reconhece tanto inteiros quanto reais

#### Analisador Sintático (calc.y)
- **Tipo de valor:** `%define api.value.type {double}`
- **Formato de saída:** `%.4f` (4 casas decimais)
- Todos os cálculos usam precisão de ponto flutuante

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
2.5 + 3.8
5 * 4.2 - 2
(10.5 + 5) / 3.0
```

Para sair: **Ctrl+D** (Linux/Mac) ou **Ctrl+Z** (Windows)

### Usando Arquivos de Teste

#### Teste 1 - Dois Números Reais (`5.5 + 3.2`)
```bash
./calc < teste1.txt
```

**Saída esperada:**
```
[LEX] Número real reconhecido: 5.5
[LEX] Operador: +
[LEX] Número real reconhecido: 3.2
[LEX] Nova linha
[BISON] Redução: F → N = 5.5000
[BISON] Redução: T → F = 5.5000
[BISON] Redução: E → T = 5.5000
[BISON] Redução: F → N = 3.2000
[BISON] Redução: T → F = 3.2000
[BISON] Redução: E + T = 5.5000 + 3.2000 = 8.7000

===> RESULTADO = 8.7000
```

#### Teste 2 - Inteiro × Real (`10 * 2.5`)
```bash
./calc < teste2.txt
```

**Saída esperada:**
```
[LEX] Número inteiro reconhecido: 10
[LEX] Operador: *
[LEX] Número real reconhecido: 2.5
[LEX] Nova linha
[BISON] Redução: F → N = 10.0000
[BISON] Redução: T → F = 10.0000
[BISON] Redução: F → N = 2.5000
[BISON] Redução: T * F = 10.0000 * 2.5000 = 25.0000

===> RESULTADO = 25.0000
```

#### Teste 3 - Operação Complexa com Reais (`7.8 / 2.0 + 1.5`)
```bash
./calc < teste3.txt
```

**Saída esperada:**
```
[LEX] Número real reconhecido: 7.8
[LEX] Operador: /
[LEX] Número real reconhecido: 2.0
[LEX] Operador: +
[LEX] Número real reconhecido: 1.5
[LEX] Nova linha
[BISON] Redução: F → N = 7.8000
[BISON] Redução: T → F = 7.8000
[BISON] Redução: F → N = 2.0000
[BISON] Redução: T / F = 7.8000 / 2.0000 = 3.9000
[BISON] Redução: E → T = 3.9000
[BISON] Redução: F → N = 1.5000
[BISON] Redução: T → F = 1.5000
[BISON] Redução: E + T = 3.9000 + 1.5000 = 5.4000

===> RESULTADO = 5.4000
```

---


## Licença

Veja o arquivo [LICENSE](../LICENSE) para mais detalhes.