# 🎓 IndiqPass - Guia Rápido de Uso
**Criado por Lucas Buarque**

---

## 🚀 Comandos Essenciais (Cole e Use!)

### 1️⃣ Preparação Inicial (Faça UMA VEZ)

```bash
# Vá para a pasta do projeto
cd /Users/lucasbuarque/Documents/Github/calculadora-indiqai/sui-first-steps/backend/indiqpass

# Mude para testnet
sui client switch --env testnet

# Veja seu endereço
sui client active-address

# Pegue tokens de teste (cole seu endereço no Discord)
# Discord: https://discord.gg/sui
# Canal: https://discord.com/channels/916379725201563759/971488439931392130
# Comando: !faucet SEU_ENDERECO
```

---

## 🔨 Build e Teste (Sempre que mudar código)

```bash
# Build (compila o código)
sui move build

# Testa (roda os 9 testes)
sui move test
```

**Resultado esperado dos testes:**
```
Test result: OK. Total tests: 9; passed: 9; failed: 0
```

---

## 📤 Publicar na Blockchain (Faça UMA VEZ)

```bash
sui client publish --gas-budget 100000000
```

**⚠️ IMPORTANTE:** Salve o `PackageID` que aparece no resultado!
Exemplo: `PackageID: 0x1234567890abcdef...`

---

## 🎮 Usar Seu Sistema de Fidelidade

### Criar Um Cartão de Fidelidade

```bash
sui client call \
  --package SEU_PACKAGE_ID_AQUI \
  --module loyalty_card \
  --function create_card \
  --gas-budget 10000000
```

**⚠️ IMPORTANTE:** Salve o `ObjectID` do cartão criado!

---

### Ver Informações do Seu Cartão

```bash
sui client object SEU_CARD_ID_AQUI
```

**Você verá:**
- Quantos pontos tem
- Quantas indicações fez
- Quem é o dono (você)

---

### Adicionar 50 Pontos de Compra

```bash
sui client call \
  --package SEU_PACKAGE_ID_AQUI \
  --module loyalty_card \
  --function add_purchase_points \
  --args SEU_CARD_ID_AQUI 50 \
  --gas-budget 10000000
```

**O que acontece:**
- Adiciona 50 pontos ao cartão
- NÃO aumenta contador de indicações

---

### Adicionar 25 Pontos de Indicação

```bash
sui client call \
  --package SEU_PACKAGE_ID_AQUI \
  --module loyalty_card \
  --function add_referral_points \
  --args SEU_CARD_ID_AQUI 25 \
  --gas-budget 10000000
```

**O que acontece:**
- Adiciona 25 pontos ao cartão
- TAMBÉM aumenta contador de indicações (+1)

---

### Resgatar Prêmio (Gastar Pontos)

```bash
sui client call \
  --package SEU_PACKAGE_ID_AQUI \
  --module loyalty_card \
  --function redeem_reward \
  --args SEU_CARD_ID_AQUI 100 \
  --gas-budget 10000000
```

**O que acontece:**
- Remove 100 pontos do cartão
- ⚠️ Precisa ter pelo menos 100 pontos!
- ⚠️ Mínimo de resgate é 100 pontos

---

## 🎯 Exemplo Prático Completo

Imagine este cenário:

### Dia 1: João cria sua conta
```bash
# João cria seu cartão
sui client call --package 0x123... --module loyalty_card --function create_card --gas-budget 10000000
# Resultado: Cartão criado com 0 pontos, 0 indicações
```

### Dia 2: João compra R$ 100
```bash
# Seu sistema dá 10 pontos (1 ponto = R$ 10)
sui client call --package 0x123... --module loyalty_card --function add_purchase_points --args 0xabc... 10 --gas-budget 10000000
# Resultado: João tem 10 pontos
```

### Dia 5: João compra mais R$ 50
```bash
# Seu sistema dá 5 pontos
sui client call --package 0x123... --module loyalty_card --function add_purchase_points --args 0xabc... 5 --gas-budget 10000000
# Resultado: João tem 15 pontos
```

### Dia 7: João indica Maria e ela compra
```bash
# Seu sistema dá 20 pontos de bônus
sui client call --package 0x123... --module loyalty_card --function add_referral_points --args 0xabc... 20 --gas-budget 10000000
# Resultado: João tem 35 pontos, 1 indicação
```

### Dia 10: João indica Pedro e ele compra
```bash
# Mais 20 pontos de bônus
sui client call --package 0x123... --module loyalty_card --function add_referral_points --args 0xabc... 20 --gas-budget 10000000
# Resultado: João tem 55 pontos, 2 indicações
```

### Dia 15: João compra R$ 500
```bash
# 50 pontos!
sui client call --package 0x123... --module loyalty_card --function add_purchase_points --args 0xabc... 50 --gas-budget 10000000
# Resultado: João tem 105 pontos, 2 indicações
```

### Dia 20: João resgata um prêmio de 100 pontos
```bash
sui client call --package 0x123... --module loyalty_card --function redeem_reward --args 0xabc... 100 --gas-budget 10000000
# Resultado: João tem 5 pontos restantes, 2 indicações
```

---

## 🎨 Como Personalizar

### Mudar Pontos Mínimos para Resgate

Edite o arquivo `sources/loyalty_card.move`:

```move
const MIN_REDEEM_POINTS: u64 = 100;  // Mude 100 para outro valor
```

Depois:
```bash
sui move build
sui client publish --gas-budget 100000000
```

### Adicionar Mais Funções

Você pode adicionar:
- Transferir pontos entre cartões
- Verificar histórico de pontos
- Criar níveis (Bronze, Prata, Ouro)
- Expirar pontos antigos
- E muito mais!

---

## ❓ Perguntas Frequentes

### P: Quanto custa cada operação?
**R:** Aproximadamente 0.0005 a 0.001 SUI por operação (~R$ 0,001)

### P: Posso mudar os pontos depois?
**R:** Só através das funções. Ninguém pode alterar diretamente na blockchain.

### P: E se eu perder o CARD_ID?
**R:** Use: `sui client objects` para ver todos seus objetos

### P: Posso deletar um cartão?
**R:** Não há função de deletar no código atual (segurança)

### P: Onde ficam armazenados os pontos?
**R:** Na blockchain Sui, não em um banco de dados tradicional

### P: Qualquer um pode adicionar pontos ao meu cartão?
**R:** Sim, no código atual. Em produção, adicione controle de acesso (admin/capability)

---

## 🔗 Links Úteis

- **Tutorial Completo (PT):** [TUTORIAL_PT.md](./TUTORIAL_PT.md)
- **Documentação (EN):** [README.md](./README.md)
- **Sui Docs:** https://docs.sui.io/
- **Sui Explorer:** https://suiexplorer.com/
- **Discord Sui:** https://discord.gg/sui

---

## 📊 Status do Projeto

```
✅ Código funcional
✅ 9 testes passando (100%)
✅ Documentação completa
✅ Pronto para testnet
✅ Pronto para produção (com ajustes de segurança)
```

---

## 🎯 Próximos Passos Sugeridos

1. ✅ **Teste no testnet** - Siga este guia
2. ⏭️ **Integre com backend** - Use Sui SDK (TypeScript/Rust)
3. ⏭️ **Adicione controle de acesso** - Só admins podem dar pontos
4. ⏭️ **Crie frontend** - React/Next.js para usuários finais
5. ⏭️ **Deploy em mainnet** - Quando tudo estiver testado

---

**Dica Final:** Salve o PACKAGE_ID e CARD_ID em um arquivo `.env` ou `notes.txt` para não perder!

**Exemplo de notes.txt:**
```
PACKAGE_ID=0x1234567890abcdef...
CARD_ID=0xabcdef1234567890...
MY_ADDRESS=0x9876543210fedcba...
```

---

**Criado com ❤️ por Lucas Buarque**
*IndiqPass - Seu sistema de fidelidade on-chain na Sui*
