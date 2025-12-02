# Calculadora com Variáveis - Flex + Bison (Questão C)

## Descrição
Implementação **ampliada** de uma calculadora usando **Flex** (analisador léxico) e **Bison** (analisador sintático) com suporte a **variáveis**.

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
a = 5
b = 10
a + b
x = 3.14
x * 2
```

Para sair: **Ctrl+D** (Linux/Mac) ou **Ctrl+Z** (Windows)

---

##  Arquivos de Teste

### Teste 1 - Exemplo da Questão (`teste1.txt`)
```bash
./calc_c < teste1.txt
```

**Conteúdo:**
```
a = 3
a + 2
x = 3.2
y = 9.234
z = x + 2
x * (y - z)
y - 3 - x
```

**Resultado:**
```
a = 3.0000
RESULTADO = 5.0000         (a + 2 = 3 + 2)
x = 3.2000
y = 9.2340
z = 5.2000                 (x + 2 = 3.2 + 2)
RESULTADO = 12.9088        (3.2 * (9.234 - 5.2))
RESULTADO = 3.0340         (9.234 - 3 - 3.2)
```

---

### Teste 2 - Variáveis com Multiplicação (`teste2.txt`)
```bash
./calc_c < teste2.txt
```

**Conteúdo:**
```
m = 5
n = 10.5
m * n + 7
```

**Resultado:**
```
m = 5.0000
n = 10.5000
RESULTADO = 59.5000        (5 * 10.5 + 7)
```

---

### Teste 3 - Atribuição e Divisão (`teste3.txt`)
```bash
./calc_c < teste3.txt
```

**Conteúdo:**
```
p = 20
q = 4
r = p / q
r * (p - q)
```

**Resultado:**
```
p = 20.0000
q = 4.0000
r = 5.0000                 (20 / 4)
RESULTADO = 80.0000        (5 * (20 - 4))
```

---

## Licença

Veja o arquivo [LICENSE](../LICENSE) para mais detalhes.