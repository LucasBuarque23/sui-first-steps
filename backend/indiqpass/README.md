# IndiqPass - On-Chain Loyalty & Referral Card on Sui

![Sui Move](https://img.shields.io/badge/Sui-Move-blue)
![License](https://img.shields.io/badge/license-Source%20Available-green)

**Created by Lucas Buarque** | [GitHub](https://github.com/lucasbuarque)

## 📋 Overview

**IndiqPass** is a simple, production-quality example of an on-chain loyalty and referral card system built with Sui Move. This project demonstrates how to implement basic loyalty program mechanics directly on the Sui blockchain.

### ⚠️ Important Disclaimer

This is a **generic, minimal implementation** created for educational and demonstration purposes. It is a spin-off concept inspired by the IndiqAI platform but:

- **Does NOT contain** any proprietary IndiqAI platform logic, algorithms, or business rules
- **Does NOT include** internal metrics, scoring formulas, or segmentation logic
- **Does NOT expose** any sensitive information or trade secrets
- Implements only **basic, obvious loyalty mechanics** that are common in the industry

The IndiqAI and IndiqPass names and branding are proprietary and may not be used commercially without permission.

## 🎯 What Does IndiqPass Do?

IndiqPass implements a simple on-chain loyalty card system with the following features:

1. **Loyalty Card Creation**: Users can create their own loyalty card (a Sui object)
2. **Purchase Points**: Add points to a card when a purchase is made
3. **Referral Points**: Add points to a card when a successful referral occurs (and increment referral count)
4. **Reward Redemption**: Burn points from a card to redeem rewards (with a minimum threshold)

## 🏗️ On-Chain Architecture

### Core Struct: `LoyaltyCard`

```move
struct LoyaltyCard has key, store {
    id: UID,                    // Unique identifier
    owner: address,             // Card owner's address
    points: u64,                // Current points balance
    referral_count: u64,        // Number of successful referrals
}
```

### Entry Functions

| Function | Description |
|----------|-------------|
| `create_card()` | Creates a new loyalty card for the transaction sender |
| `add_purchase_points(card, amount)` | Adds points from a purchase |
| `add_referral_points(card, amount)` | Adds points from a referral and increments referral count |
| `redeem_reward(card, cost)` | Burns points to redeem a reward (minimum 100 points) |

### Constants

- `MIN_REDEEM_POINTS = 100`: Minimum points required to redeem any reward

## 🚀 Getting Started

### Prerequisites

- [Sui CLI](https://docs.sui.io/build/install) installed and configured
- A Sui wallet with testnet/devnet SUI tokens for gas fees
- Basic understanding of Sui Move

### Installation

1. **Clone this repository** (if you haven't already):
```bash
git clone <your-repo-url>
cd sui-first-steps/backend/indiqpass
```

2. **Build the Move package**:
```bash
sui move build
```

3. **Run tests** to ensure everything works:
```bash
sui move test
```

You should see output showing all tests passing:
```
Running Move unit tests
[ PASS    ] indiqpass::loyalty_card_tests::test_create_card
[ PASS    ] indiqpass::loyalty_card_tests::test_add_purchase_points
[ PASS    ] indiqpass::loyalty_card_tests::test_add_referral_points
[ PASS    ] indiqpass::loyalty_card_tests::test_mixed_points
[ PASS    ] indiqpass::loyalty_card_tests::test_redeem_reward_success
[ PASS    ] indiqpass::loyalty_card_tests::test_redeem_reward_insufficient_points
[ PASS    ] indiqpass::loyalty_card_tests::test_redeem_reward_below_minimum
[ PASS    ] indiqpass::loyalty_card_tests::test_add_zero_purchase_points
[ PASS    ] indiqpass::loyalty_card_tests::test_add_zero_referral_points
Test result: OK. Total tests: 9; passed: 9; failed: 0
```

## 📦 Publishing to Sui Network

### Publish to Testnet

1. **Configure your Sui client** for testnet:
```bash
sui client switch --env testnet
```

2. **Get testnet SUI tokens** from the [Sui Testnet Faucet](https://discord.com/channels/916379725201563759/971488439931392130)

3. **Publish the package**:
```bash
sui client publish --gas-budget 100000000
```

4. **Save the output**: The publish command will output important information:
   - `Package ID`: The unique identifier for your published package
   - `LoyaltyCard` type: The full type path for the loyalty card object

Example output:
```
╭──────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                        │
├──────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                      │
│  ┌──                                                                  │
│  │ ObjectID: 0x1234...                                               │
│  │ Sender: 0xabcd...                                                 │
│  │ Owner: Immutable                                                   │
│  │ ObjectType: 0x2::package::UpgradeCap                              │
│  └──                                                                  │
╰──────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────────────────────────────────────────────╮
│ Published Objects:                                                   │
│  ┌──                                                                 │
│  │ PackageID: 0x5678...                                             │
│  │ Version: 1                                                        │
│  │ Digest: ...                                                       │
│  └──                                                                 │
╰─────────────────────────────────────────────────────────────────────╯
```

**Important**: Replace `0x0` in `Move.toml` with your actual package ID after publishing, or use `--with-unpublished-dependencies` flag.

## 🎮 Using the CLI

Once published, you can interact with IndiqPass using the Sui CLI:

### 1. Create a Loyalty Card

```bash
sui client call \
  --package <PACKAGE_ID> \
  --module loyalty_card \
  --function create_card \
  --gas-budget 10000000
```

After creation, note the **Object ID** of your new `LoyaltyCard` from the output.

### 2. Add Purchase Points

Add 50 points from a purchase:

```bash
sui client call \
  --package <PACKAGE_ID> \
  --module loyalty_card \
  --function add_purchase_points \
  --args <CARD_OBJECT_ID> 50 \
  --gas-budget 10000000
```

### 3. Add Referral Points

Add 25 points from a successful referral:

```bash
sui client call \
  --package <PACKAGE_ID> \
  --module loyalty_card \
  --function add_referral_points \
  --args <CARD_OBJECT_ID> 25 \
  --gas-budget 10000000
```

This will add 25 points AND increment the referral counter by 1.

### 4. Redeem a Reward

Redeem a reward costing 100 points (minimum threshold):

```bash
sui client call \
  --package <PACKAGE_ID> \
  --module loyalty_card \
  --function redeem_reward \
  --args <CARD_OBJECT_ID> 100 \
  --gas-budget 10000000
```

**Note**: This will fail if the card has less than 100 points.

### 5. Check Your Card

View your loyalty card details:

```bash
sui client object <CARD_OBJECT_ID>
```

## 🔗 Off-Chain Integration

In a real-world scenario, you would have an **off-chain backend system** (like a web application or SaaS platform) that:

1. **Authenticates users** and tracks their activities (purchases, referrals, etc.)
2. **Validates transactions** off-chain (e.g., verifying a purchase was completed, a referral was genuine)
3. **Calls the Sui blockchain** to update on-chain loyalty cards using a service wallet
4. **Listens to blockchain events** to sync on-chain state with your database

### Example Integration Flow

```
User makes purchase → Your API validates → API calls add_purchase_points() → Points added on-chain
User refers friend → Friend signs up → API validates → API calls add_referral_points() → Points + count updated
User redeems reward → API calls redeem_reward() → Points burned → API fulfills reward off-chain
```

### Security Considerations

- The on-chain module only handles the **state** (points, referrals)
- All **business logic validation** (e.g., is this purchase real? is this referral legitimate?) must happen off-chain
- Your backend should use a **service wallet** with appropriate gas management
- Consider implementing **access control** if you want to restrict who can call certain functions

## 🧪 Testing

Run the comprehensive test suite:

```bash
sui move test
```

Tests cover:
- ✅ Card creation
- ✅ Adding purchase points
- ✅ Adding referral points
- ✅ Mixed points (purchase + referral)
- ✅ Successful redemption
- ✅ Failed redemption (insufficient points)
- ✅ Failed redemption (below minimum threshold)
- ✅ Failed operations with zero amounts

## 📁 Project Structure

```
backend/indiqpass/
├── Move.toml                          # Package manifest
├── sources/
│   └── loyalty_card.move              # Core loyalty card module
├── tests/
│   └── loyalty_card_tests.move        # Comprehensive unit tests
├── README.md                          # This file
└── LICENSE                            # License file
```

## 🤝 Contributing

This is an educational/demonstration project. If you find bugs or have suggestions:

1. Open an issue describing the problem or improvement
2. Submit a pull request with clear descriptions of changes
3. Ensure all tests pass before submitting

## 📄 License

See [LICENSE](./LICENSE) file for details.

**Summary**:
- Source code is available for viewing and learning
- Non-commercial use is permitted
- Commercial use requires permission
- IndiqAI and IndiqPass names/branding are proprietary

## 🔮 Future Enhancements

Possible extensions for learning purposes (not currently implemented):

- Multiple reward tiers with different point costs
- Time-based point expiration
- Card levels/tiers based on total points earned
- Transfer restrictions or soulbound tokens
- Admin capabilities for emergency actions
- Events emission for better off-chain tracking

## 📚 Resources

- [Sui Documentation](https://docs.sui.io/)
- [Sui Move Book](https://move-book.com/)
- [Sui Examples](https://github.com/MystenLabs/sui/tree/main/examples)
- [Sui Developer Portal](https://sui.io/developers)

## 💬 Questions?

For questions about:
- **Sui Move**: Check the [Sui Discord](https://discord.gg/sui) or [Sui Forums](https://forums.sui.io/)
- **This specific implementation**: Open an issue in this repository

---

**Built with ❤️ by Lucas Buarque on Sui Blockchain**

*IndiqPass is created and maintained by Lucas Buarque as part of the IndiqAI ecosystem. This project demonstrates best practices for building on-chain loyalty systems using Sui Move.*
