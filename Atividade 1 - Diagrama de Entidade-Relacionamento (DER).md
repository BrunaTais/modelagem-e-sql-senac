# Atividade 1 – Diagrama de Entidade-Relacionamento (DER)

Esta atividade tem como objetivo desenvolver a **modelagem conceitual** de um banco de dados relacional
para um sistema de streaming de filmes, utilizando o **Diagrama de Entidade-Relacionamento (DER)**.

## Objetivo
Modelar as principais entidades do sistema, seus atributos e relacionamentos,
respeitando as regras de negócio propostas.

## Entidades modeladas
- **Usuário**
- **Endereço**
- **Conteúdo**
- **Estúdio**
- **Visualização** (relacionamento N:N entre Usuário e Conteúdo)

## Regras de negócio consideradas
- Cada usuário deve possuir **um único endereço**.
- Um conteúdo está associado a **um único estúdio**.
- Um estúdio pode estar associado a **vários conteúdos**.
- O relacionamento de visualização permite registrar quais conteúdos foram assistidos pelos usuários,
  incluindo o **tempo de visualização**.

## Ferramentas utilizadas
- MySQL Workbench

## Arquivos
- Diagrama ER desenvolvido no MySQL Workbench (`.mwb`)

> Atividade acadêmica desenvolvida no Curso Técnico em Desenvolvimento de Sistemas (Senac),
> na unidade curricular **Auxiliar na Modelagem e Manipulação de Banco de Dados**.

