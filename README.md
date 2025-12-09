![banner](./recursos/imagens/banner.jpg)
# Primeiros Passos em Sui

**Por Lucas Buarque** | [GitHub](https://github.com/lucasbuarque)

---

## 📋 Sobre Este Repositório

Este repositório contém uma coleção de exemplos práticos e tutoriais sobre **Sui Move**, incluindo:

- 📚 **Tutoriais básicos** - Conceitos fundamentais de Move (variáveis, structs, functions, etc.)
- 🚀 **IndiqPass** - Sistema completo de fidelidade e indicações on-chain (projeto destaque!)

---

## 🎯 Projeto Destaque: IndiqPass

![Status](https://img.shields.io/badge/status-production%20ready-success)
![Tests](https://img.shields.io/badge/tests-9%2F9%20passing-success)
![Move](https://img.shields.io/badge/Sui-Move-blue)

**IndiqPass** é um sistema de cartão de fidelidade e programa de indicações rodando diretamente na blockchain Sui.

### ✨ Features

- 💳 Criação de cartões de fidelidade on-chain
- ⭐ Sistema de pontos por compras
- 🤝 Sistema de pontos por indicações
- 🎁 Resgate de recompensas
- 🧪 100% testado (9/9 testes passando)

### 🚀 Quick Start

```bash
# Navegue até o projeto
cd backend/indiqpass

# Build
sui move build

# Teste
sui move test

# Leia a documentação
open INDEX.md  # ou README.md
```

📖 **[Ver documentação completa do IndiqPass →](./backend/indiqpass/INDEX.md)**

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

## 🎓 Introdução ao Sui

**Sui** é uma plataforma de blockchain e contratos inteligentes de **camada 1** projetada para que a propriedade de ativos digitais seja rápida, privada, segura e acessível.

**Move** é uma linguagem de código aberto para escrever pacotes seguros para manipular objetos na blockchain. Ela permite bibliotecas, ferramentas e comunidades de desenvolvedores comuns em blockchains com modelos de dados e execução muito diferentes.

## ⚙️ Pré-requisitos

### 1. Instalar Sui CLI

Siga a documentação oficial para instalar o Sui CLI no seu sistema:

**macOS/Linux:**
```bash
brew install sui
```

**Ou via Cargo:**
```bash
cargo install --locked --git https://github.com/MystenLabs/sui.git --branch testnet sui
```

**Verificar instalação:**
```bash
sui --version
```

📖 [Documentação oficial de instalação](https://docs.sui.io/build/install)

### 2. Instalar um Editor de Código

Recomendamos o **Visual Studio Code** com as seguintes extensões:

- [Move (Extension)](https://marketplace.visualstudio.com/items?itemName=mysten.move) - Language server para Move
- [Move Formatter](https://marketplace.visualstudio.com/items?itemName=mysten.prettier-move) - Formatador de código
- [Move Syntax](https://marketplace.visualstudio.com/items?itemName=damirka.move-syntax) - Syntax highlighting

📥 [Baixar VS Code](https://code.visualstudio.com/)

---

## 🚀 Como Usar Este Repositório

### 1️⃣ Clone o Repositório

```bash
git clone https://github.com/lucasbuarque/calculadora-indiqai.git
cd calculadora-indiqai/sui-first-steps
```

### 2️⃣ Escolha Seu Caminho

**🎯 Quer usar o IndiqPass?**
```bash
cd backend/indiqpass
open INDEX.md  # Leia o índice de documentação
```

**📚 Quer aprender Sui Move do zero?**
```bash
cd backend/00_intro  # Comece pelo básico
```

### 3️⃣ Build e Teste

Em qualquer pasta de exemplo:
```bash
# Build do projeto
sui move build

# Rodar testes
sui move test
```

---

## 📖 Estrutura do Repositório

```
sui-first-steps/
├── README.md                  ← Você está aqui
├── backend/
│   ├── indiqpass/            ← 🌟 Projeto principal
│   │   ├── INDEX.md          ← Comece por aqui!
│   │   ├── sources/          ← Código Move
│   │   ├── tests/            ← Testes
│   │   └── ...docs...        ← Documentação completa
│   ├── 00_intro/             ← Tutorial: Introdução
│   ├── 01_variables/         ← Tutorial: Variáveis
│   ├── 02_referencias/       ← Tutorial: Referências
│   └── ...                   ← Mais tutoriais
├── extras/                    ← Conteúdo extra
└── recursos/                  ← Imagens e recursos
```

---

## 🎓 Roteiro de Aprendizado

### Para Iniciantes (2-3 horas)

1. ✅ Leia esta introdução
2. ✅ Instale Sui CLI
3. ✅ Percorra os tutoriais básicos (00 a 10)
4. ✅ Teste cada exemplo

### Para Desenvolvedores (1 dia)

1. ✅ Complete o roteiro iniciante
2. ✅ Estude o código do IndiqPass
3. ✅ Modifique e teste alterações
4. ✅ Publique no testnet

### Para Produção (1 semana)

1. ✅ Domine os conceitos
2. ✅ Integre com backend
3. ✅ Crie frontend
4. ✅ Teste extensivamente
5. ✅ Publique em mainnet

---

## 🛠️ Instalação do Git

1. [Instalação no Mac](#macgit)
2. [Instalação no Windows](#windowsgit)
3. [Instalação no Linux](#linuxgit)

## Instalação no Mac <a id="macgit"></a>

1. Certifique-se de ter o **Homebrew** instalado: [https://brew.sh/](https://brew.sh/).
2. Abra um terminal e insira os seguintes comandos:
```sh
brew update
brew install git
```
3. Se precisar de mais informações sobre a instalação, você pode encontrá-las na documentação [oficial do Git](https://www.git-scm.com/download/mac).

## Instalação no Windows <a id="windowsgit"></a>

1. Baixe o instalador na página oficial do Git: [https://www.git-scm.com/download/win](https://www.git-scm.com/download/win).
2. Siga as instruções indicadas. As opções padrão do instalador geralmente são suficientes, mas se você quiser personalizar sua instalação de alguma forma e souber o que está fazendo, sinta-se à vontade para mudar o que for necessário.

## Instalação no Linux <a id="linuxgit"></a>

1. Para distribuições baseadas em Debian, como o Ubuntu, você pode executar os seguintes comandos:
```bash
sudo apt update
sudo apt install git-all
```
2. Se precisar de informações sobre a instalação em alguma outra distribuição específica, você pode encontrá-las na documentação [oficial do Git](https://git-scm.com/download/linux).

## 2. Configurando o Git

É uma boa ideia configurar os valores globais do seu usuário antes de começar a usar o Git. Você pode fazer isso com os seguintes comandos.

> :information_source: Lembre-se de substituir os exemplos com seus dados pessoais.
```sh
git config --global user.name "Nome Exemplo"
git config --global user.email nome@exemplo.com
```

## 3. Clonando o repositório localmente

No seu terminal, execute o seguinte comando:

```sh
git clone https://github.com/AguaPotavel/sui-first-steps.git
```

> :information_source: Lembre-se que você pode mudar o diretório onde o repositório será clonado. Utilize `cd` para se mover entre os diretórios do seu computador, e `mkdir` para criar um novo. </br></br>
> Mais informações: [Tutorial de comandos básicos](https://aprendolinux.com/aprende-los-comandos-basicos-de-linux/).

Uma vez que o repositório for clonado, você pode navegar até ele:
```sh
cd sui-first-steps
```

Para visualizar o conteúdo, você pode executar o comando:

```sh
ls -a
```

E para abri-lo no editor de código (no nosso caso, VS Code), você pode executar:
```sh
code .
```

## 3. Instalação da Sui CLI

Para poder interagir com o conteúdo dos tutoriais, é necessário instalar a **Sui CLI**.

1. [Instalação no Mac](#maccli)
2. [Instalação no Windows](#windowscli)
3. [Instalação no Linux](#linuxcli)

## Instalação no Mac <a id="maccli"></a>

Podemos instalar o Sui de duas maneiras. Uma usando a ferramenta desenvolvida pela MystenLabs, `suiup`, e outra utilizando o Hombrew. A recomendada para dar seus primeiros passos sem a necessidade de muitas configurações é `suiup`, no entanto, esta ferramenta não deve ser utilizada em ambientes de produção. Vamos explorar ambas as opções.

### `suiup`

* Execute o seguinte comando no seu terminal:
```sh
curl -sSfL https://raw.githubusercontent.com/Mystenlabs/suiup/main/install.sh | sh
```

* Ou você pode baixar os binários e instalá-lo manualmente diretamente do [repositório oficial do `suiup`](https://github.com/Mystenlabs/suiup/releases). Esta opção é um pouco mais avançada, então se você nunca instalou algo de forma semelhante, recomendamos usar o comando acima.

> :information_source: Se você não sabe qual arquitetura possui, pode executar o seguinte comando:
> ```sh
> uname -m
> ```
> * Se aparecer **arm64** → Baixe suiup-macOS-arm64.tar.gz.
> * Se aparecer **x86_64** → Baixe suiup-macOS-x86_64.tar.gz.

1. Você pode testar se a instalação do `suiup` foi bem-sucedida executando o seguinte comando:
```sh
suiup --version
```

2. Depois de instalar o `suiup`, independentemente da opção escolhida, execute o seguinte comando para instalar a Sui CLI:
```sh
suiup install sui
```

3. E novamente, você pode testar se tudo correu bem usando:
```sh
sui --version
```

### Hombrew

1. Certifique-se de ter o **Homebrew** instalado: [https://brew.sh/](https://brew.sh/).
2. Abra um terminal e insira os seguintes comandos:
```sh
brew update
brew install sui
```
3. Você pode testar se tudo foi instalado corretamente executando:
```sh
sui --version
```

## Instalação no Windows <a id="windowscli"></a>

Podemos instalar o Sui de duas maneiras. Uma usando a ferramenta desenvolvida pela MystenLabs, `suiup`, e outra utilizando um gerenciador de pacotes como o **Chocolatey**. A recomendada para dar seus primeiros passos sem a necessidade de muitas configurações é `suiup`, no entanto, esta ferramenta não deve ser utilizada em ambientes de produção. Vamos explorar ambas as opções.

### `suiup`

1. Baixe o instalador diretamente do [repositório oficial do `suiup`](https://github.com/Mystenlabs/suiup/releases).

> :information_source: Se você não sabe qual arquitetura possui, simplesmente baixe o arquivo `suiup-Windows-msvc-x86_64.zip`.

2. Uma vez instalado, abra um terminal e execute o seguinte comando para verificar se tudo correu bem:
```sh
suiup --version
```
> :information_source: Recomendamos usar o Powershell como terminal para executar todos os comandos deste repositório no Windows.

3. Depois de instalar o `suiup`, execute o seguinte comando para instalar a Sui CLI:
```sh
suiup install sui
```

4. E novamente, você pode testar se tudo correu bem usando:
```sh
sui --version
```

### `choco`

1. Certifique-se de ter o **Chocolatey** instalado: [https://chocolatey.org/install](https://chocolatey.org/install).
2. Abra um terminal e insira o seguinte comando:
```sh
choco install sui
```
3. Você pode testar se tudo foi instalado corretamente executando:
```sh
sui --version
```

## Instalação no Linux <a id="linuxcli"></a>

Podemos instalar o Sui de duas maneiras. Uma usando a ferramenta desenvolvida pela MystenLabs, `suiup`, e outra utilizando o gerenciador de pacotes para **Rust** chamado `cargo`. A recomendada para dar seus primeiros passos sem a necessidade de muitas configurações é `suiup`, no entanto, esta ferramenta não deve ser utilizada em ambientes de produção. Vamos explorar ambas as opções.

### `suiup`

* Execute o seguinte comando no seu terminal:
```sh
curl -sSfL https://raw.githubusercontent.com/Mystenlabs/suiup/main/install.sh | sh
```

* Ou você pode baixar os binários e instalá-lo manualmente diretamente do [repositório oficial do `suiup`](https://github.com/Mystenlabs/suiup/releases). Esta opção é um pouco mais avançada, então se você nunca instalou algo de forma semelhante, recomendamos usar o comando acima.

> :information_source: Se você não sabe qual arquitetura possui, pode executar o seguinte comando:
> ```sh
> uname -m
> ```
> * Se aparecer **arm64** → Baixe `suiup-Linux-musl-arm64.tar.gz`.
> * Se aparecer **x86_64** → Baixe `suiup-Linux-musl-x86_64.tar.gz`.

1. Você pode testar se a instalação do `suiup` foi bem-sucedida executando o seguinte comando:
```sh
suiup --version
```

2. Depois de instalar o `suiup`, independentemente da opção escolhida, execute o seguinte comando para instalar a Sui CLI:
```sh
suiup install sui
```

3. E novamente, você pode testar se tudo correu bem usando:
```sh
sui --version
```

### `cargo`

1. Certifique-se de ter o `rustup` instalado: [https://www.rust-lang.org/tools/install](https://www.rust-lang.org/tools/install).
2. Abra um terminal e insira os seguintes comandos:
```sh
rustup update stable
cargo install --git https://github.com/MystenLabs/sui.git sui --branch devnet
```
3. Você pode testar se tudo foi instalado corretamente executando:
```sh
sui --version
```

## 4. Instalação do MVR

O **Move Registry** (MVR) é um gerenciador de pacotes para o Move. Ele permite a qualquer pessoa publicar e utilizar pacotes publicados em novas aplicações desenvolvidas com o Move. 

1. A forma de instalar o `mvr` depende de como você instalou a `sui` CLI.

* Se você instalou com `suiup` (independentemente do seu sistema operacional), execute o seguinte comando:
```sh
suiup install mvr
```

* Se você instalou o `sui` utilizando `cargo`, execute o seguinte comando:
```sh
cargo install --locked --git https://github.com/mystenlabs/mvr --branch release mvr
```

* Por último, se você realizou a instalação manualmente baixando o instalador e **não** instalou o `suiup`, pode baixar o instalador do `mvr` no [repositório oficial](https://github.com/MystenLabs/mvr/releases).

2. Independentemente da opção escolhida, lembre-se de verificar se a instalação foi realizada corretamente:
```sh
mvr --version
```

## 5. Interagindo com o repositório.

O repositório é composto por várias pastas com arquivos para cada tutorial, simplesmente navegue até elas usando `cd` e siga as instruções dentro delas.</br></br>
Cada tutorial possui um arquivo `README.md` com instruções claras de como interagir com eles.

---

## 🌟 Destaques do Repositório

### IndiqPass - Sistema de Fidelidade On-Chain

O projeto principal deste repositório demonstra:

- ✅ Arquitetura completa de um sistema real
- ✅ Integração on-chain + off-chain
- ✅ Testes abrangentes (100% cobertura)
- ✅ Documentação profissional bilíngue
- ✅ Pronto para produção

**Estatísticas:**
- 📊 ~410 linhas de código Move
- 🧪 9 testes automatizados
- 📖 ~5000+ linhas de documentação
- 🌍 2 idiomas (PT + EN)

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
