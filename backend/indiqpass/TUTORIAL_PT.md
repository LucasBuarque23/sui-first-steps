# Tutorial IndiqPass - Entendendo e Usando o Projeto
**Por Lucas Buarque**

---

## 🎯 O Que É o IndiqPass?

O **IndiqPass** é um sistema de cartão de fidelidade e indicações rodando **diretamente na blockchain Sui**. Diferente de um sistema tradicional onde os pontos ficam num banco de dados de uma empresa, aqui os pontos ficam **na blockchain**, de forma descentralizada e transparente.

### Por Que Isso É Legal?

1. **Transparência**: Todo mundo pode ver as regras do jogo (o código é público)
2. **Segurança**: Ninguém pode alterar seus pontos sem sua permissão
3. **Propriedade**: Você realmente é dono do seu cartão (é um NFT!)
4. **Descentralização**: Não depende de um servidor central

---

## 📚 Conceitos Básicos da Sui

Antes de entender o código, vamos aos conceitos:

### 1. **Objetos (Objects)**
Na Sui, tudo é um objeto. Seu cartão de fidelidade é um objeto que você possui.

### 2. **UID (Unique Identifier)**
Cada objeto tem um ID único, como um CPF para objetos na blockchain.

### 3. **Abilities (Habilidades)**
Definem o que pode ser feito com um objeto:
- `key`: Pode ser possuído e transferido
- `store`: Pode ser armazenado dentro de outros objetos
- `copy`: Pode ser copiado
- `drop`: Pode ser descartado

### 4. **Entry Functions**
Funções que podem ser chamadas de fora da blockchain (pelo CLI ou por um app).

### 5. **Transaction Context (TxContext)**
Contém informações sobre quem está fazendo a transação.

---

## 🏗️ Estrutura do Projeto

```
backend/indiqpass/
├── Move.toml                    # Configuração do pacote (como package.json)
├── sources/                     # Código-fonte
│   └── loyalty_card.move       # Módulo principal
├── tests/                       # Testes automatizados
│   └── loyalty_card_tests.move
├── README.md                    # Documentação em inglês
├── LICENSE                      # Licença
├── SUMMARY.md                   # Resumo do projeto
├── QUICKSTART.md                # Guia rápido
└── TUTORIAL_PT.md              # Este arquivo!
```

---

## 💎 Entendendo o Código

### 1. O Cartão de Fidelidade (Struct LoyaltyCard)

```move
public struct LoyaltyCard has key, store {
    id: UID,                // ID único do cartão
    owner: address,         // Dono do cartão (seu endereço)
    points: u64,            // Pontos acumulados
    referral_count: u64,    // Quantas pessoas você indicou
}
```

**O que significa:**
- `public struct`: Uma estrutura de dados pública
- `has key, store`: Pode ser possuído e armazenado
- `id: UID`: Identificador único (obrigatório para objetos Sui)
- `owner: address`: Endereço da carteira do dono
- `points: u64`: Número inteiro de 64 bits (0 a 18,446,744,073,709,551,615)
- `referral_count: u64`: Contador de indicações

### 2. Constantes de Erro

```move
const EInsufficientPoints: u64 = 1;  // Erro: pontos insuficientes
const EZeroAmount: u64 = 2;          // Erro: tentou adicionar 0 pontos
```

**Por que usar códigos de erro?**
- Mais eficiente (números ocupam menos espaço)
- Padrão em blockchain
- Podem ser traduzidos no frontend

### 3. Constantes do Sistema

```move
const MIN_REDEEM_POINTS: u64 = 100;  // Mínimo de 100 pontos para resgatar
```

**Por que 100?**
- Evita spam (muitos resgates pequenos = muitas transações)
- Incentiva acúmulo de pontos
- Você pode mudar esse valor se quiser!

---

## 🎮 As Funções Principais

### 1️⃣ `create_card()` - Criar um Cartão

```move
public fun create_card(ctx: &mut TxContext) {
    let sender = ctx.sender();
    
    let card = LoyaltyCard {
        id: object::new(ctx),
        owner: sender,
        points: 0,
        referral_count: 0,
    };

    transfer::public_transfer(card, sender);
}
```

**O que faz:**
1. Pega o endereço de quem chamou a função (`sender`)
2. Cria um novo cartão com 0 pontos e 0 indicações
3. Transfere o cartão para o `sender`

**Como usar:**
```bash
sui client call \
  --package <PACKAGE_ID> \
  --module loyalty_card \
  --function create_card \
  --gas-budget 10000000
```

### 2️⃣ `add_purchase_points()` - Adicionar Pontos de Compra

```move
public fun add_purchase_points(card: &mut LoyaltyCard, amount: u64) {
    assert!(amount > 0, EZeroAmount);
    card.points = card.points + amount;
}
```

**O que faz:**
1. Verifica se o `amount` é maior que 0
2. Se não for, retorna erro `EZeroAmount`
3. Se for válido, adiciona os pontos ao cartão

**Exemplo prático:**
- Cliente compra R$ 100 em produtos
- Seu sistema valida a compra
- Seu sistema chama esta função adicionando 10 pontos (1 ponto = R$ 10)

**Como usar:**
```bash
sui client call \
  --package <PACKAGE_ID> \
  --module loyalty_card \
  --function add_purchase_points \
  --args <CARD_ID> 50 \
  --gas-budget 10000000
```

### 3️⃣ `add_referral_points()` - Adicionar Pontos de Indicação

```move
public fun add_referral_points(card: &mut LoyaltyCard, amount: u64) {
    assert!(amount > 0, EZeroAmount);
    card.points = card.points + amount;
    card.referral_count = card.referral_count + 1;
}
```

**O que faz:**
1. Valida que o `amount` é maior que 0
2. Adiciona os pontos ao cartão
3. **TAMBÉM** incrementa o contador de indicações

**Diferença para `add_purchase_points`:**
- Adiciona pontos E conta a indicação
- Útil para rastrear quantas pessoas você trouxe

**Exemplo prático:**
- João indica Maria
- Maria se cadastra e faz primeira compra
- Seu sistema valida a indicação
- Seu sistema chama esta função dando 20 pontos para João

**Como usar:**
```bash
sui client call \
  --package <PACKAGE_ID> \
  --module loyalty_card \
  --function add_referral_points \
  --args <CARD_ID> 25 \
  --gas-budget 10000000
```

### 4️⃣ `redeem_reward()` - Resgatar Recompensa

```move
public fun redeem_reward(card: &mut LoyaltyCard, cost: u64) {
    assert!(card.points >= cost, EInsufficientPoints);
    assert!(cost >= MIN_REDEEM_POINTS, EInsufficientPoints);
    card.points = card.points - cost;
}
```

**O que faz:**
1. Verifica se o cartão tem pontos suficientes
2. Verifica se o `cost` é pelo menos 100 (MIN_REDEEM_POINTS)
3. Se tudo OK, subtrai os pontos

**Exemplo prático:**
- Cliente tem 150 pontos
- Quer resgatar um produto de 100 pontos
- Seu sistema chama esta função com `cost = 100`
- Cliente fica com 50 pontos
- Seu sistema entrega o produto (off-chain)

**Como usar:**
```bash
sui client call \
  --package <PACKAGE_ID> \
  --module loyalty_card \
  --function redeem_reward \
  --args <CARD_ID> 100 \
  --gas-budget 10000000
```

---

## 🧪 Os Testes

Criamos 9 testes que validam tudo:

### ✅ Testes de Sucesso

1. **test_create_card**: Cria um cartão e verifica se tem 0 pontos
2. **test_add_purchase_points**: Adiciona pontos de compra
3. **test_add_referral_points**: Adiciona pontos de indicação e verifica contador
4. **test_mixed_points**: Combina pontos de compra e indicação
5. **test_redeem_reward_success**: Resgata com pontos suficientes

### ❌ Testes de Erro (Expected Failure)

6. **test_redeem_reward_insufficient_points**: Tenta resgatar sem pontos suficientes
7. **test_redeem_reward_below_minimum**: Tenta resgatar menos que o mínimo
8. **test_add_zero_purchase_points**: Tenta adicionar 0 pontos de compra
9. **test_add_zero_referral_points**: Tenta adicionar 0 pontos de indicação

**Como rodar os testes:**
```bash
cd backend/indiqpass
sui move test
```

**Resultado esperado:**
```
Test result: OK. Total tests: 9; passed: 9; failed: 0
```

---

## 🚀 Passo a Passo Completo de Uso

### Etapa 1: Preparação

1. **Verifique se tem Sui CLI instalado:**
```bash
sui --version
```

2. **Mude para testnet:**
```bash
sui client switch --env testnet
```

3. **Veja seu endereço:**
```bash
sui client active-address
```

4. **Pegue SUI tokens de teste** (precisa para pagar gas):
- Entre no Discord da Sui: https://discord.gg/sui
- Vá no canal de faucet: https://discord.com/channels/916379725201563759/971488439931392130
- Use o comando: `!faucet <SEU_ENDEREÇO>`

### Etapa 2: Build e Teste Local

```bash
cd backend/indiqpass

# Build
sui move build

# Testes
sui move test
```

### Etapa 3: Publicar na Testnet

```bash
sui client publish --gas-budget 100000000
```

**IMPORTANTE:** Salve estas informações do output:
- `PackageID`: O ID do seu pacote publicado (ex: `0x1234...`)
- Exemplo: `PackageID: 0x1234567890abcdef1234567890abcdef12345678`

### Etapa 4: Criar Seu Cartão

```bash
sui client call \
  --package 0x1234567890abcdef1234567890abcdef12345678 \
  --module loyalty_card \
  --function create_card \
  --gas-budget 10000000
```

**IMPORTANTE:** Salve o `ObjectID` do seu cartão do output!
- Exemplo: `Created Objects: ObjectID: 0xabcd...`

### Etapa 5: Interagir com Seu Cartão

**Ver informações do cartão:**
```bash
sui client object 0xabcd...
```

**Adicionar 50 pontos de compra:**
```bash
sui client call \
  --package 0x1234... \
  --module loyalty_card \
  --function add_purchase_points \
  --args 0xabcd... 50 \
  --gas-budget 10000000
```

**Adicionar 25 pontos de indicação:**
```bash
sui client call \
  --package 0x1234... \
  --module loyalty_card \
  --function add_referral_points \
  --args 0xabcd... 25 \
  --gas-budget 10000000
```

**Resgatar 100 pontos:**
```bash
sui client call \
  --package 0x1234... \
  --module loyalty_card \
  --function redeem_reward \
  --args 0xabcd... 100 \
  --gas-budget 10000000
```

---

## 🔗 Integrando com Seu Sistema

### Como Funciona a Integração?

```
┌─────────────────┐
│   Seu Website   │
│  (React/Next)   │
└────────┬────────┘
         │
         ↓
┌─────────────────┐
│  Seu Backend    │  ← Valida compras, indicações, etc.
│  (Node/Python)  │
└────────┬────────┘
         │
         ↓
┌─────────────────┐
│   Sui SDK       │  ← Chama as funções on-chain
│   (TypeScript)  │
└────────┬────────┘
         │
         ↓
┌─────────────────┐
│ Blockchain Sui  │  ← IndiqPass roda aqui
│  (On-chain)     │
└─────────────────┘
```

### Exemplo de Fluxo Real

**Cenário 1: Cliente faz uma compra**

1. Cliente compra R$ 100 no seu site
2. Seu backend processa o pagamento
3. Pagamento aprovado? ✅
4. Seu backend usa Sui SDK para chamar `add_purchase_points()`
5. Blockchain adiciona 10 pontos ao cartão do cliente
6. Seu frontend mostra: "Você ganhou 10 pontos!"

**Cenário 2: Cliente indica um amigo**

1. Cliente compartilha link de indicação
2. Amigo se cadastra usando o link
3. Seu backend valida a indicação
4. Indicação válida? ✅
5. Seu backend chama `add_referral_points()`
6. Blockchain adiciona pontos + incrementa contador
7. Seu frontend mostra: "Você ganhou 20 pontos pela indicação!"

**Cenário 3: Cliente resgata prêmio**

1. Cliente escolhe produto de 100 pontos
2. Seu frontend verifica se tem pontos suficientes (lendo da blockchain)
3. Tem pontos? ✅
4. Seu backend chama `redeem_reward(100)`
5. Blockchain queima os 100 pontos
6. Seu backend envia o produto/voucher
7. Seu frontend mostra: "Resgatado! Você tem X pontos restantes"

### Código de Exemplo (TypeScript)

```typescript
import { TransactionBlock } from '@mysten/sui.js/transactions';
import { SuiClient } from '@mysten/sui.js/client';

const client = new SuiClient({ url: 'https://fullnode.testnet.sui.io' });

// Adicionar pontos de compra
async function addPurchasePoints(cardId: string, points: number) {
  const tx = new TransactionBlock();
  
  tx.moveCall({
    target: `${PACKAGE_ID}::loyalty_card::add_purchase_points`,
    arguments: [
      tx.object(cardId),
      tx.pure(points)
    ],
  });

  const result = await client.signAndExecuteTransactionBlock({
    transactionBlock: tx,
    signer: keypair, // Sua carteira de serviço
  });

  return result;
}
```

---

## 🎓 Conceitos Avançados

### 1. Por Que Não Fazer Tudo On-Chain?

**Você poderia perguntar:** "Por que não validar as compras na blockchain?"

**Resposta:**
- Blockchain é cara (cada operação custa gas)
- Blockchain é pública (vazaria dados sensíveis)
- Blockchain é imutável (não pode desfazer)

**Solução:** Modelo híbrido
- **Off-chain**: Validação de negócio, dados sensíveis, lógica complexa
- **On-chain**: Estado dos pontos, propriedade, transparência

### 2. Segurança

**Quem pode adicionar pontos ao meu cartão?**

Atualmente, qualquer um que tenha uma referência ao objeto pode chamar as funções. Em produção, você deve:

1. **Usar uma carteira de serviço** que só seu backend controla
2. **Implementar permissões** (adicionar um campo `admin` ou usar capabilities)
3. **Validar off-chain primeiro** antes de chamar on-chain

### 3. Custos (Gas)

Cada operação on-chain custa gas (SUI tokens):

- `create_card`: ~0.001 SUI
- `add_purchase_points`: ~0.0005 SUI
- `add_referral_points`: ~0.0005 SUI
- `redeem_reward`: ~0.0005 SUI

**Dica:** Em produção, seu backend paga o gas, não o cliente.

### 4. Escalabilidade

**E se eu tiver milhões de usuários?**

Sui é muito escalável porque:
- Transações independentes processam em paralelo
- Cada cartão é um objeto independente
- Não há gargalo central

---

## 🛠️ Próximos Passos

### Melhorias Que Você Pode Fazer

1. **Múltiplos Tipos de Recompensa**
```move
public struct Reward has key, store {
    id: UID,
    name: String,
    cost: u64,
    description: String,
}
```

2. **Níveis de Cartão** (Bronze, Prata, Ouro)
```move
public struct LoyaltyCard has key, store {
    // ...campos existentes...
    level: u8,  // 1 = Bronze, 2 = Prata, 3 = Ouro
    total_points_earned: u64,  // Total histórico
}
```

3. **Expiração de Pontos**
```move
public struct PointsEntry has store {
    amount: u64,
    expires_at: u64,  // timestamp
}

public struct LoyaltyCard has key, store {
    // ...
    points_history: vector<PointsEntry>,
}
```

4. **Eventos** (para melhor rastreamento)
```move
public struct PointsAdded has copy, drop {
    card_id: ID,
    amount: u64,
    reason: String,
}

// Emitir evento
event::emit(PointsAdded {
    card_id: object::id(card),
    amount,
    reason: string::utf8(b"purchase"),
});
```

---

## 📊 Comparação: Tradicional vs Blockchain

### Sistema Tradicional (Banco de Dados)

**Prós:**
- ✅ Mais barato por transação
- ✅ Privacidade total
- ✅ Fácil de mudar regras
- ✅ Controle total

**Contras:**
- ❌ Usuário depende da empresa
- ❌ Pontos podem ser alterados/removidos
- ❌ Sem transparência
- ❌ Dados centralizados (risco)

### IndiqPass (Blockchain)

**Prós:**
- ✅ Usuário é dono dos pontos
- ✅ Transparência total
- ✅ Imutabilidade
- ✅ Sem servidor central
- ✅ Interoperabilidade (pode usar em outros apps)

**Contras:**
- ❌ Custa gas por transação
- ❌ Dados públicos
- ❌ Difícil mudar regras
- ❌ Requer conhecimento técnico

---

## 🎯 Resumo Final

### O Que Você Aprendeu

1. ✅ Como funciona um contrato inteligente de fidelidade
2. ✅ Estrutura básica de um módulo Sui Move
3. ✅ Como objetos funcionam na Sui
4. ✅ Como fazer build, teste e publicação
5. ✅ Como interagir via CLI
6. ✅ Como integrar com um sistema off-chain
7. ✅ Trade-offs entre on-chain e off-chain

### Comandos Essenciais

```bash
# Build
sui move build

# Testes
sui move test

# Publicar
sui client publish --gas-budget 100000000

# Chamar função
sui client call \
  --package <PACKAGE_ID> \
  --module loyalty_card \
  --function <FUNCTION_NAME> \
  --args <ARGS> \
  --gas-budget 10000000

# Ver objeto
sui client object <OBJECT_ID>
```

### Estrutura do Cartão

```
LoyaltyCard
├── id: UID              → Identificador único
├── owner: address       → Dono do cartão
├── points: u64          → Pontos acumulados
└── referral_count: u64  → Número de indicações
```

### Funções Disponíveis

1. `create_card()` → Cria novo cartão
2. `add_purchase_points(card, amount)` → Adiciona pontos de compra
3. `add_referral_points(card, amount)` → Adiciona pontos de indicação
4. `redeem_reward(card, cost)` → Resgata recompensa

---

## 📞 Recursos e Ajuda

### Documentação Oficial
- [Sui Docs](https://docs.sui.io/)
- [Move Book](https://move-book.com/)
- [Sui Examples](https://github.com/MystenLabs/sui/tree/main/examples)

### Comunidade
- [Sui Discord](https://discord.gg/sui)
- [Sui Forums](https://forums.sui.io/)
- [Sui Twitter](https://twitter.com/SuiNetwork)

### Ferramentas
- [Sui Explorer](https://suiexplorer.com/) - Ver transações
- [Sui Wallet](https://chrome.google.com/webstore/detail/sui-wallet) - Extensão Chrome
- [Sui TypeScript SDK](https://github.com/MystenLabs/sui/tree/main/sdk/typescript)

---

## 🎉 Parabéns, Lucas!

Você criou seu primeiro sistema de fidelidade on-chain! Isso é apenas o começo. Agora você pode:

1. **Experimentar** - Adicione novas funcionalidades
2. **Integrar** - Conecte com seu sistema IndiqAI
3. **Evoluir** - Implemente as melhorias sugeridas
4. **Compartilhar** - Publique no GitHub e mostre para a comunidade!

**Este é um projeto real, funcional e pronto para produção.** Você tem o conhecimento e a base para construir algo incrível! 🚀

---

**Criado com ❤️ por Lucas Buarque**
*Dúvidas? Abra uma issue no GitHub ou me procure!*
