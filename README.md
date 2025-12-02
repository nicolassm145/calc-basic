# Calculadora - Flex + Bison

## Descrição Geral

Este repositório contém a implementação de calculadoras usando **Flex** (analisador léxico) e **Bison** (analisador sintático), baseadas na seguinte Gramática Livre de Contexto (GLC):

```
S → E
E → E + T | E - T | T
T → T * F | T / F | F
F → N | ( E )
```

As implementações demonstram o funcionamento dos analisadores léxico e sintático com diferentes requisitos.

---

## Estrutura do Projeto

```
calc-basic/
├── QuestaoA/          # Questão A: Apenas números inteiros
│   ├── calc.l         # Analisador léxico
│   ├── calc.y         # Analisador sintático
│   ├── teste1.txt     # Teste: operação simples
│   ├── teste2.txt     # Teste: com parênteses
│   ├── teste3.txt     # Teste: números reais (erro esperado)
│   └── README.md      # Documentação detalhada da Questão A
│
├── QuestaoB/          # Questão B: Números inteiros E reais
│   ├── calc.l         # Analisador léxico (modificado)
│   ├── calc.y         # Analisador sintático (modificado)
│   ├── teste1.txt     # Teste: dois números reais
│   ├── teste2.txt     # Teste: inteiro × real
│   ├── teste3.txt     # Teste: operação complexa com reais
│   └── README.md      # Documentação detalhada da Questão B
│
├── QuestaoC/          # Questão C: Com suporte a variáveis
│   ├── calc.l         # Analisador léxico (com variáveis)
│   ├── calc.y         # Analisador sintático (com tabela de símbolos)
│   ├── teste1.txt     # Teste: exemplo da questão
│   ├── teste2.txt     # Teste: variáveis com multiplicação
│   ├── teste3.txt     # Teste: atribuição e divisão
│   └── README.md      # Documentação detalhada da Questão C
│
├── LICENSE
└── README.md          
```

---

## Questões Implementadas

### **[`Questão A`](QuestaoA/README.md)** - Calculadora com Números Inteiros

**Requisito:** Implementar calculadora empregando flex + bison que aceita **apenas números inteiros**.

**Como compilar e executar:**
```bash
cd QuestaoA
bison -d calc.y && flex calc.l && gcc calc.tab.c lex.yy.c -o calc
./calc < teste1.txt  # Operação simples
./calc < teste2.txt  # Com parênteses
./calc < teste3.txt  # Números reais (erro)
```

---

### **[`Questão B`](QuestaoB/README.md)** - Calculadora com Números Inteiros E Reais


**Requisito:** Implementação **modificada** de uma calculadora que aceita **números inteiros e reais**.

**Como compilar e executar:**
```bash
cd QuestaoB
bison -d calc.y && flex calc.l && gcc calc.tab.c lex.yy.c -o calc
./calc < teste1.txt  # Dois números reais
./calc < teste2.txt  # Inteiro × real
./calc < teste3.txt  # Operação complexa
```

---

### **[`Questão C`](QuestaoC/README.md)** - Calculadora com Variáveis

**Requisito:** Ampliar a calculadora para admitir **variáveis identificadas por uma letra** e permitir operações com elas.

**Como compilar e executar:**
```bash
cd QuestaoC
bison -d calc.y && flex calc.l && gcc calc.tab.c lex.yy.c -o calc
./calc < teste1.txt  # Exemplo da questão
./calc < teste2.txt  # Variáveis com multiplicação
./calc < teste3.txt  # Atribuição e divisão
```

---

---

## 🔧 Pré-requisitos

Para compilar e executar os programas, você precisa ter instalado:
- `flex` (analisador léxico)
- `bison` (analisador sintático)
- `gcc` (compilador C)

### Instalação no Ubuntu:
```bash
sudo apt-get install flex bison gcc
```


## 📄 Licença

Veja o arquivo [LICENSE](LICENSE) para mais detalhes.