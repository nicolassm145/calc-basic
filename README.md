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

##  Estrutura do Projeto

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
├── LICENSE
└── README.md          # Este arquivo
```

---

## Questões Implementadas

### Questão A - Calculadora com Números Inteiros

**Requisito:** Implementar calculadora empregando flex + bison que aceita **apenas números inteiros**.

**Características:**
- ✅ N = `[0-9]+` (somente inteiros)
- ✅ Números reais **geram erro**
- ✅ Rastreamento completo das ações dos analisadores
- ✅ 2 testes com rastreamento + 1 teste com números reais (erro)

**Acesse:** [`QuestaoA/README.md`](QuestaoA/README.md)

**Como compilar e executar:**
```bash
cd QuestaoA
bison -d calc.y && flex calc.l && gcc calc.tab.c lex.yy.c -o calc
./calc < teste1.txt  # Operação simples
./calc < teste2.txt  # Com parênteses
./calc < teste3.txt  # Números reais (erro)
```

---

### Questão B - Calculadora com Números Inteiros E Reais

**Requisito:** Modificar a implementação da calculadora possibilitando cálculos com **números inteiros e reais**.

**Características:**
- ✅ Aceita números inteiros: `5`, `42`, `100`
- ✅ Aceita números reais: `2.5`, `3.14`, `10.0`
- ✅ Usa tipo `double` para precisão
- ✅ Formato de saída com 4 casas decimais
- ✅ Rastreamento completo das ações dos analisadores

**Acesse:** [`QuestaoB/README.md`](QuestaoB/README.md)

**Como compilar e executar:**
```bash
cd QuestaoB
bison -d calc.y && flex calc.l && gcc calc.tab.c lex.yy.c -o calc
./calc < teste1.txt  # Dois números reais
./calc < teste2.txt  # Inteiro × real
./calc < teste3.txt  # Operação complexa
```

---

## Pré-requisitos

Para compilar e executar os programas, você precisa ter instalado:
- `flex` (analisador léxico)
- `bison` (analisador sintático)
- `gcc` (compilador C)

### Instalação no Ubuntu/Debian:
```bash
sudo apt-get install flex bison gcc
```


---


## 📄 Licença

Veja o arquivo [LICENSE](LICENSE) para mais detalhes.