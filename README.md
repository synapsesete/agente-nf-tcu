
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

    NotaFiscal "*" --> Emitente : Emissor
    ItemNotaFiscal "*" --* NotaFiscal
    ItemNotaFiscal "*" --> TipoProduto
    Emitente "*" --> Município : Municipio de Origem
    NotaFiscal "*" --> Destinatário : Receptor
    Destinatário "*" --> Município : Municipio de Origem
    NotaFiscal ..> DestinoOperacao
    Destinatário ..> IndicadorIE
    NotaFiscal ..> ConsumidorFinal
    NotaFiscal ..> PresencaDoComprador

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
        - ConsumidorFinal consumidorFinal
        - PresencaDoComprador presencaDoComprador
        - float Valor
    }

    class ItemNotaFiscal {
        - int numeroProduto
        - String descricaoProdutoServico
        - int CFOP
        - float Quantidade
        - String Unidade
        - Float valorUnitario
        -/Float valorTotal
    }

    class TipoProduto {
        <<Entity>>
        - String codigoNCMSH
        - String NCMSH
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
        - IndicadorIE indicadorIE
    }

    class IndicadorIE {
        <<Enumeration>>
        - CONTRIBUINTE_ISENTO
        - NAO_CONTRIBUINTE
        - CONTRIBUINTE_ICMS
        - DF

    }

    class DestinoOperacao {
        <<Enumeration>>
        - OPERACAO_INTERESTADUAL
        - OPERACAO_INTERNA
        - CONTRIBUINTE_ISENTO
    }

    class ConsumidorFinal {
        <<Enumeration>>
        - CONSUMIDOR_FINAL
        - NORMAL
    }

    class PresencaDoComprador {
        <<Enumeration>>
        - NAO_SE_APLICA
        - OPERACAO_PRESENCIAL
        - OPERECAO_NAO_PRESENCIAL_PELA_INTERNET
        - OPERACAO_NAO_PRESENCIAL_OUTROS
    }

```