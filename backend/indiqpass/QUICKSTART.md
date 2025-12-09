# IndiqPass - Quick Start Guide

**By Lucas Buarque**

## ⚡ 5-Minute Setup

### 1️⃣ Build the Project

```bash
cd backend/indiqpass
sui move build
```

**Expected Output**: `BUILDING IndiqPass` (with some warnings - ignore them)

### 2️⃣ Run Tests

```bash
sui move test
```

**Expected Output**: 
```
Test result: OK. Total tests: 9; passed: 9; failed: 0
```

### 3️⃣ Publish to Testnet

```bash
# Switch to testnet
sui client switch --env testnet

# Check your address
sui client active-address

# Get testnet SUI (if needed)
# Visit: https://discord.com/channels/916379725201563759/971488439931392130
# Or use: sui client faucet

# Publish
sui client publish --gas-budget 100000000
```

**Save the Package ID from the output!**

### 4️⃣ Create Your First Loyalty Card

```bash
sui client call \
  --package <YOUR_PACKAGE_ID> \
  --module loyalty_card \
  --function create_card \
  --gas-budget 10000000
```

**Save the Card Object ID from the output!**

### 5️⃣ Try It Out

Add 100 purchase points:
```bash
sui client call \
  --package <YOUR_PACKAGE_ID> \
  --module loyalty_card \
  --function add_purchase_points \
  --args <YOUR_CARD_ID> 100 \
  --gas-budget 10000000
```

Add 50 referral points:
```bash
sui client call \
  --package <YOUR_PACKAGE_ID> \
  --module loyalty_card \
  --function add_referral_points \
  --args <YOUR_CARD_ID> 50 \
  --gas-budget 10000000
```

Redeem 100 points:
```bash
sui client call \
  --package <YOUR_PACKAGE_ID> \
  --module loyalty_card \
  --function redeem_reward \
  --args <YOUR_CARD_ID> 100 \
  --gas-budget 10000000
```

Check your card status:
```bash
sui client object <YOUR_CARD_ID>
```

## 📖 Full Documentation

For complete documentation, see [README.md](./README.md)

## 🆘 Troubleshooting

**Problem**: "sui: command not found"  
**Solution**: Install Sui CLI: https://docs.sui.io/build/install

**Problem**: "Insufficient gas"  
**Solution**: Get testnet SUI from Discord faucet

**Problem**: "Package address mismatch"  
**Solution**: Update `Move.toml` with your published package ID

**Problem**: "Object not found"  
**Solution**: Make sure you're using the correct Card Object ID

## ✅ You're All Set!

Your IndiqPass loyalty card system is now running on Sui testnet! 🎉
