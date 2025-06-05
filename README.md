
# Agentes de Notas Fiscais

O projeto fornece um agente que responde às perguntas referentes aos dados de 100 notas fiscais selecionadas aleatoriamente do arquivo de notas fiscais do mês de janeiro/2024, disponibilizado pelo Tribunal de Contas da União.

## Objetivo

A atividade tem por objetivo criar um ou mais agentes que tornem possível a um usuário realizar perguntas sobre os arquivos CSV disponibilizados.

Por exemplo: Qual é o fornecedor que teve maior montante recebido? Qual item teve maior volume entregue (em quantidade)? E assim por diante.


## Modelagem

```mermaid

---
title: NF TCU
---
classDiagram
    note "Notas Fiscais TCU"

    NotaFiscal "*" --> Emitente : Emissor
    Emitente "*" --> Município : Origem
    NotaFiscal "*" --> Destinatário : Receptor
    Destinatário "*" --> Município : Origem
    Destinatário ..> DestinoOperacao

    class NotaFiscal {
        <<Entity>>
        - String chaveDeAcesso
        - String modelo
        - int serie
        - int numero
        - String naturezaDaOperacao
        - Date dataEmissao
        - String eventoMaisRecente
        - Date dataHoraEventoMaisRecente
        - DestinoOperacao destinoOperacao
    }

    class Município {
        <<Entity>>
        - String nome
        - String UF
    }

    class Emitente {
        <<Entity>>
        - String CPFCNPJ
        - String razaoSocial
        - String inscricaoEstadual
    }

    class Destinatário {
        <<Entity>>
        - String CNPJ
        - String nome
        - DestinoOperacao indicadorIE
    }

    class DestinoOperacao {
        <<Enumeration>>
        - CONTRIBUINTE_ISENTO
        - NAO_CONTRIBUINTE
        - CONTRIBUINTE_ICMS

    }

```