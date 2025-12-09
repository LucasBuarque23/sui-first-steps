![banner](./recursos/imagens/banner.jpg)

# Primeiros Passos em Sui Move

**Por Lucas Buarque** | [GitHub](https://github.com/lucasbuarque)

Repositório completo para aprender **Sui Move** do zero, com tutoriais práticos e um projeto real de sistema de fidelidade on-chain.

---

## 🚀 O que você vai aprender

- ✅ **Fundamentos de Move** - Sintaxe, tipos, structs, funções
- ✅ **Blockchain Sui** - Objetos, transações, ownership
- ✅ **Projeto Real** - IndiqPass, sistema de fidelidade completo
- ✅ **Deploy na Testnet** - Publique seu primeiro contrato

---

## 🎯 Projeto Destaque: IndiqPass

![Status](https://img.shields.io/badge/status-production%20ready-success)
![Tests](https://img.shields.io/badge/tests-9%2F9%20passing-success)
![Move](https://img.shields.io/badge/Sui-Move-blue)

**Sistema de fidelidade e indicações on-chain**

- 💳 Cartões de fidelidade como NFTs
- ⭐ Pontos por compras e indicações
- 🎁 Resgate de recompensas
- 🧪 100% testado (9/9 testes)

📖 **[Ver documentação →](./backend/indiqpass/README.md)**

---

## 📚 Tutoriais Básicos de Sui Move

Aprenda os fundamentos de Sui Move com exemplos práticos:

| # | Tópico | Descrição | Pasta |
|---|--------|-----------|-------|
| 00 | Introdução | Primeiro contato com Move | [00_intro](./backend/00_intro) |
| 01 | Variáveis | Declaração, tipos, escopo | [01_variables](./backend/01_variables) |
| 02 | Referências | Borrowing e ownership | [02_referencias](./backend/02_referencias) |
| 03 | Tipos Primitivos | u8, u64, bool, address | [03_tipos_primitivos](./backend/03_tipos_primitivos) |
| 04 | Condicionais | if, else, match | [04_condicionais](./backend/04_condicionais) |
| 05 | Vetores | Arrays e operações | [05_vetores](./backend/05_vetores) |
| 06 | Strings | Manipulação de texto | [06_strings](./backend/06_strings) |
| 07 | Structs | Estruturas de dados | [07_structs](./backend/07_structs) |
| 08 | Habilidades | key, store, copy, drop | [08_habilidades](./backend/08_habilidades) |
| 09 | Address | Endereços na blockchain | [09_address](./backend/09_address) |
| 10 | Funções | Entry functions, públicas | [10_funcoes](./backend/10_funcoes) |

---

## 🎓 O que é Sui?

**Sui** é uma blockchain Layer 1 rápida, segura e com baixo custo, ideal para aplicações que exigem alta performance.

**Move** é uma linguagem de programação segura para smart contracts, criada originalmente para o Diem (projeto do Facebook) e adotada pela Sui.

---

## ⚡ Setup Rápido (5 minutos)

### 1️⃣ Instale o Sui CLI

**macOS:**
```bash
brew install sui
```

**Linux:**
```bash
curl -sSfL https://raw.githubusercontent.com/Mystenlabs/suiup/main/install.sh | sh
suiup install sui
```

**Windows:**
```powershell
# Baixe de: https://github.com/Mystenlabs/suiup/releases
suiup install sui
```

**Verifique:**
```bash
sui --version
```

📖 [Mais opções de instalação](https://docs.sui.io/build/install)

### 2️⃣ Clone este repositório

```bash
git clone https://github.com/lucasbuarque/calculadora-indiqai.git
cd calculadora-indiqai/sui-first-steps
```

### 3️⃣ Teste um exemplo

```bash
cd backend/00_intro
sui move build
sui move test
```

✅ **Pronto! Você já compilou e testou seu primeiro código Move!**

---

## � Tutoriais: Do Zero ao Deploy

Siga os tutoriais na ordem para dominar Move:

### 🔰 Nível Iniciante

| # | Tópico | O que você aprende |
|---|--------|--------------------|
| 00 | [Introdução](./backend/00_intro) | Olá mundo em Move |
| 01 | [Variáveis](./backend/01_variables) | Declaração e tipos |
| 02 | [Referências](./backend/02_referencias) | Borrowing e ownership |
| 03 | [Tipos Primitivos](./backend/03_tipos_primitivos) | u8, u64, bool, address |
| 04 | [Condicionais](./backend/04_condicionais) | if/else e lógica |

### 🎯 Nível Intermediário

| # | Tópico | O que você aprende |
|---|--------|--------------------|
| 05 | [Vetores](./backend/05_vetores) | Arrays e coleções |
| 06 | [Strings](./backend/06_strings) | Manipulação de texto |
| 07 | [Structs](./backend/07_structs) | Estruturas de dados |
| 08 | [Habilidades](./backend/08_habilidades) | key, store, copy, drop |

### 🚀 Nível Avançado

| # | Tópico | O que você aprende |
|---|--------|--------------------|
| 09 | [Address](./backend/09_address) | Endereços na blockchain |
| 10 | [Funções](./backend/10_funcoes) | Entry functions, públicas |
| 💎 | [**IndiqPass**](./backend/indiqpass) | **Projeto completo real** |

**💡 Dica:** Cada tutorial tem um `README.md` com explicações e exemplos. Execute `sui move build` e `sui move test` em cada pasta!

---

## 🎓 Roteiro de Aprendizado

### 🟢 Iniciante (2-3 horas)
```bash
# 1. Percorra tutoriais 00-04
cd backend/00_intro && sui move test
cd ../01_variables && sui move test
# ... continue até 04_condicionais

# 2. Experimente modificar o código
# 3. Veja os erros e aprenda com eles
```

### 🟡 Intermediário (1 dia)
```bash
# 1. Complete tutoriais 05-08
# 2. Estude o código do IndiqPass
cd backend/indiqpass
sui move build
sui move test

# 3. Modifique e teste
```

### 🔴 Avançado (1 semana)
```bash
# 1. Publique no testnet
sui client publish --gas-budget 100000000

# 2. Integre com frontend (TypeScript SDK)
# 3. Crie seu próprio projeto
```

---

## � Comandos Úteis

```bash
# Compilar projeto
sui move build

# Executar testes
sui move test

# Publicar no testnet
sui client publish --gas-budget 100000000

# Ver seus objetos
sui client objects

# Chamar uma função
sui client call \
  --package PACKAGE_ID \
  --module MODULE_NAME \
  --function FUNCTION_NAME \
  --gas-budget 10000000
```

---

## 🎯 Estrutura de Cada Tutorial

```
00_intro/
├── README.md          # Explicação do conceito
├── Move.toml          # Configuração do pacote
└── sources/
    └── intro.move     # Código de exemplo
```

**Como usar:**
1. Leia o `README.md`
2. Estude o código em `sources/`
3. Execute `sui move build`
4. Execute `sui move test`
5. Modifique e experimente!

---

## 📦 IndiqPass: Projeto Real

Sistema completo de fidelidade on-chain com:

**Funcionalidades:**
- Criar cartões de fidelidade
- Adicionar pontos por compra
- Adicionar pontos por indicação
- Resgatar recompensas

**Arquitetura:**
- Código Move testado (9/9 testes ✅)
- Documentação completa em PT e EN
- Exemplos de integração
- Pronto para deploy

📖 **[Começar com o IndiqPass →](./backend/indiqpass/README.md)**

---

## 🤝 Contribuindo

Contribuições são bem-vindas! Para contribuir:

1. Fork este repositório
2. Crie uma branch para sua feature (`git checkout -b feature/MinhaFeature`)
3. Commit suas mudanças (`git commit -m 'Adiciona MinhaFeature'`)
4. Push para a branch (`git push origin feature/MinhaFeature`)
5. Abra um Pull Request

### Diretrizes

- Mantenha o código limpo e documentado
- Adicione testes para novas funcionalidades
- Siga os padrões de código existentes
- Atualize a documentação quando necessário

---

## 📄 Licença

Este repositório contém diferentes licenças:

- **Tutoriais básicos (00-10):** MIT License - Uso livre
- **IndiqPass:** Source-available, uso não-comercial - Ver [LICENSE](./backend/indiqpass/LICENSE)

IndiqAI e IndiqPass são marcas registradas. Uso comercial requer permissão.

---

## 📞 Recursos Úteis

### Documentação Oficial
- 📖 [Sui Documentation](https://docs.sui.io/)
- 📚 [Move Book](https://move-book.com/)
- 💻 [Sui Examples](https://github.com/MystenLabs/sui/tree/main/examples)
- 🎓 [Sui Learn](https://sui.io/learn)

### Ferramentas
- 🔍 [Sui Explorer](https://suiexplorer.com/) - Explorador de blockchain
- 💰 [Sui Wallet](https://chrome.google.com/webstore/detail/sui-wallet) - Carteira oficial
- 🛠️ [Sui TypeScript SDK](https://github.com/MystenLabs/sui/tree/main/sdk/typescript)
- 🐍 [Sui Python SDK](https://github.com/FrankC01/pysui)

### Comunidade
- 💬 [Discord Sui](https://discord.gg/sui) - Chat da comunidade
- 🌐 [Fórum Sui](https://forums.sui.io/) - Discussões técnicas
- 🐦 [Twitter @SuiNetwork](https://twitter.com/SuiNetwork) - Novidades
- 📺 [YouTube Sui](https://www.youtube.com/@Sui-Network) - Tutoriais em vídeo

### Testnet
- 🚰 [Faucet Discord](https://discord.com/channels/916379725201563759/971488439931392130) - Pegue SUI de teste
- 🌐 [Testnet Explorer](https://suiexplorer.com/?network=testnet) - Ver transações de teste

---

## 💡 Dicas de Ouro

### Para Aprender
1. 📖 Comece pelos tutoriais básicos na ordem (00 → 10)
2. 🧪 Sempre rode `sui move test` após mudanças
3. 🔍 Use o Explorer para ver suas transações
4. 💬 Pergunte na comunidade quando travar

### Para Desenvolver
1. ⚡ Teste no testnet antes de mainnet
2. 💰 Monitore custos de gas
3. 🔐 Nunca exponha chaves privadas
4. 📊 Use eventos para tracking

### Para Produção
1. 🧪 Teste extensivamente
2. 🔒 Implemente controle de acesso
3. 📈 Configure monitoramento
4. 💾 Faça backup de tudo

---

## 🎯 Objetivos Deste Repositório

Este repositório foi criado para:

- ✨ Ensinar Sui Move de forma prática
- 🚀 Demonstrar aplicações reais em blockchain
- 📚 Fornecer código de referência de qualidade
- 🌍 Contribuir com a comunidade Sui
- 💡 Inspirar novos projetos

---

## 📊 Status do Projeto

| Componente | Status | Testes | Docs |
|------------|--------|--------|------|
| IndiqPass | ✅ Prod Ready | 9/9 ✅ | ✅ Completo |
| Tutoriais 00-10 | ✅ Completo | ✅ | ✅ Completo |
| Extras | 🚧 Em progresso | - | 📝 Parcial |

**Última atualização:** Dezembro 2025

---

## ⭐ Apoie Este Projeto

Se este repositório te ajudou:

- ⭐ Dê uma estrela no GitHub
- 🔄 Compartilhe com outros desenvolvedores
- 💬 Deixe feedback ou sugestões
- 🤝 Contribua com melhorias
- 📢 Mencione em suas redes sociais

---

## 👨‍💻 Sobre o Autor

**Lucas Buarque**

Criador do IndiqPass e mantenedor deste repositório de tutoriais sobre Sui Move.

- 🌐 [GitHub](https://github.com/lucasbuarque)
- 💼 [LinkedIn](#) <!-- Adicione seu link -->
- 🐦 [Twitter](#) <!-- Adicione seu link -->
- 📧 [Email](#) <!-- Adicione seu link -->

**IndiqAI** - Transformando fidelidade e indicações através da blockchain.

---

## 🙏 Agradecimentos

- **Mysten Labs** - Por criar o Sui
- **Comunidade Sui** - Pelo suporte e feedback
- **Contribuidores** - Por melhorias e correções

---

## 📝 Changelog

### v1.0.0 (Dezembro 2025)
- ✅ Release inicial do IndiqPass
- ✅ 11 tutoriais básicos completos
- ✅ Documentação bilíngue (PT/EN)
- ✅ Testes 100% passando

---

**Feito com ❤️ e ☕ por Lucas Buarque**

```
 ___           _ _       ____                 
|_ _|_ __   __| (_) __ _|  _ \ __ _ ___ ___ 
 | || '_ \ / _` | |/ _` | |_) / _` / __/ __|
 | || | | | (_| | | (_| |  __/ (_| \__ \__ \
|___|_| |_|\__,_|_|\__, |_|   \__,_|___/___/
                      |_|                     
    Sistema de Fidelidade On-Chain na Sui
```

*Transformando programas de fidelidade em ativos digitais descentralizados* 🚀
