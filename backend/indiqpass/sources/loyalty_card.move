/// IndiqPass - On-chain Loyalty & Referral Card Module
/// 
/// Author: Lucas Buarque
/// 
/// This module implements a simple loyalty card system on Sui blockchain.
/// Each user can own a LoyaltyCard object that tracks points and referrals.
/// 
/// This is a GENERIC, minimal implementation for educational and demonstration purposes.
/// It does NOT contain any proprietary IndiqAI platform logic, metrics, or business rules.
module indiqpass::loyalty_card {
    use sui::object::UID;
    use sui::tx_context::TxContext;

    // ====== Error Codes ======
    
    /// Error code when trying to redeem more points than available
    const EInsufficientPoints: u64 = 1;
    
    /// Error code when trying to add zero points
    const EZeroAmount: u64 = 2;

    // ====== Constants ======
    
    /// Minimum points required to redeem a reward (example threshold)
    const MIN_REDEEM_POINTS: u64 = 100;

    // ====== Structs ======

    /// LoyaltyCard - Represents a user's loyalty card on-chain
    /// 
    /// Abilities:
    /// - `key`: Can be owned and transferred as a Sui object
    /// - `store`: Can be stored inside other objects
    public struct LoyaltyCard has key, store {
        /// Unique identifier for this card
        id: UID,
        /// Address of the card owner
        owner: address,
        /// Current points balance
        points: u64,
        /// Number of successful referrals made by this user
        referral_count: u64,
    }

    // ====== Entry Functions ======

    /// Creates a new loyalty card for the transaction sender
    /// 
    /// The card is transferred to the sender's address with:
    /// - 0 initial points
    /// - 0 initial referrals
    /// 
    /// # Arguments
    /// * `ctx` - Transaction context containing sender information
    public fun create_card(ctx: &mut TxContext) {
        let sender = ctx.sender();
        
        let card = LoyaltyCard {
            id: object::new(ctx),
            owner: sender,
            points: 0,
            referral_count: 0,
        };

        // Transfer the card to the sender
        transfer::public_transfer(card, sender);
    }

    /// Adds points to a loyalty card from a purchase
    /// 
    /// This function would typically be called by an off-chain system
    /// after validating a purchase transaction.
    /// 
    /// # Arguments
    /// * `card` - Mutable reference to the loyalty card
    /// * `amount` - Number of points to add (must be > 0)
    /// 
    /// # Aborts
    /// * `EZeroAmount` - If amount is 0
    public fun add_purchase_points(card: &mut LoyaltyCard, amount: u64) {
        assert!(amount > 0, EZeroAmount);
        card.points = card.points + amount;
    }

    /// Adds points to a loyalty card from a successful referral
    /// 
    /// This function would typically be called by an off-chain system
    /// after validating that a referral led to a new user signup or purchase.
    /// Increments both the points balance and the referral count.
    /// 
    /// # Arguments
    /// * `card` - Mutable reference to the loyalty card
    /// * `amount` - Number of points to add (must be > 0)
    /// 
    /// # Aborts
    /// * `EZeroAmount` - If amount is 0
    public fun add_referral_points(card: &mut LoyaltyCard, amount: u64) {
        assert!(amount > 0, EZeroAmount);
        card.points = card.points + amount;
        card.referral_count = card.referral_count + 1;
    }

    /// Redeems a reward by burning points from the loyalty card
    /// 
    /// This function validates that the card has sufficient points
    /// before deducting the cost. The actual reward fulfillment
    /// would be handled off-chain.
    /// 
    /// # Arguments
    /// * `card` - Mutable reference to the loyalty card
    /// * `cost` - Number of points required to redeem (must be >= MIN_REDEEM_POINTS)
    /// 
    /// # Aborts
    /// * `EInsufficientPoints` - If card doesn't have enough points
    public fun redeem_reward(card: &mut LoyaltyCard, cost: u64) {
        assert!(card.points >= cost, EInsufficientPoints);
        assert!(cost >= MIN_REDEEM_POINTS, EInsufficientPoints);
        card.points = card.points - cost;
    }

    // ====== Public View Functions ======

    /// Returns the current points balance of a card
    public fun get_points(card: &LoyaltyCard): u64 {
        card.points
    }

    /// Returns the referral count of a card
    public fun get_referral_count(card: &LoyaltyCard): u64 {
        card.referral_count
    }

    /// Returns the owner address of a card
    public fun get_owner(card: &LoyaltyCard): address {
        card.owner
    }

    /// Returns the minimum points required to redeem
    public fun get_min_redeem_points(): u64 {
        MIN_REDEEM_POINTS
    }

    // ====== Test-Only Functions ======

    #[test_only]
    /// Creates a card for testing purposes
    public fun create_card_for_testing(ctx: &mut TxContext): LoyaltyCard {
        LoyaltyCard {
            id: object::new(ctx),
            owner: ctx.sender(),
            points: 0,
            referral_count: 0,
        }
    }

    #[test_only]
    /// Destroys a card for testing purposes
    public fun destroy_card_for_testing(card: LoyaltyCard) {
        let LoyaltyCard { id, owner: _, points: _, referral_count: _ } = card;
        object::delete(id);
    }
}
