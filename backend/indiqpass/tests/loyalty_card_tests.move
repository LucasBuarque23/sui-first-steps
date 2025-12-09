/// Unit tests for the IndiqPass loyalty card module
/// 
/// These tests cover:
/// - Card creation
/// - Adding purchase points
/// - Adding referral points
/// - Successful redemption
/// - Failed redemption (insufficient points)
#[test_only]
module indiqpass::loyalty_card_tests {
    use indiqpass::loyalty_card::{Self, LoyaltyCard};
    use sui::test_scenario;

    // ====== Test Constants ======
    
    const USER_ADDRESS: address = @0xA;
    const MIN_REDEEM: u64 = 100;

    // ====== Test: Card Creation ======

    #[test]
    fun test_create_card() {
        let mut scenario = test_scenario::begin(USER_ADDRESS);
        
        // User creates a loyalty card
        {
            loyalty_card::create_card(test_scenario::ctx(&mut scenario));
        };

        // Check that the card was created and transferred to the user
        test_scenario::next_tx(&mut scenario, USER_ADDRESS);
        {
            let card = test_scenario::take_from_sender<LoyaltyCard>(&scenario);
            
            // Verify initial state
            assert!(loyalty_card::get_points(&card) == 0, 0);
            assert!(loyalty_card::get_referral_count(&card) == 0, 1);
            assert!(loyalty_card::get_owner(&card) == USER_ADDRESS, 2);
            
            test_scenario::return_to_sender(&scenario, card);
        };

        test_scenario::end(scenario);
    }

    // ====== Test: Add Purchase Points ======

    #[test]
    fun test_add_purchase_points() {
        let mut scenario = test_scenario::begin(USER_ADDRESS);
        
        // Create card
        {
            loyalty_card::create_card(test_scenario::ctx(&mut scenario));
        };

        // Add purchase points
        test_scenario::next_tx(&mut scenario, USER_ADDRESS);
        {
            let mut card = test_scenario::take_from_sender<LoyaltyCard>(&scenario);
            
            // Add 50 points from a purchase
            loyalty_card::add_purchase_points(&mut card, 50);
            assert!(loyalty_card::get_points(&card) == 50, 0);
            
            // Add another 30 points
            loyalty_card::add_purchase_points(&mut card, 30);
            assert!(loyalty_card::get_points(&card) == 80, 1);
            
            // Referral count should remain 0
            assert!(loyalty_card::get_referral_count(&card) == 0, 2);
            
            test_scenario::return_to_sender(&scenario, card);
        };

        test_scenario::end(scenario);
    }

    // ====== Test: Add Referral Points ======

    #[test]
    fun test_add_referral_points() {
        let mut scenario = test_scenario::begin(USER_ADDRESS);
        
        // Create card
        {
            loyalty_card::create_card(test_scenario::ctx(&mut scenario));
        };

        // Add referral points
        test_scenario::next_tx(&mut scenario, USER_ADDRESS);
        {
            let mut card = test_scenario::take_from_sender<LoyaltyCard>(&scenario);
            
            // Add 20 points from first referral
            loyalty_card::add_referral_points(&mut card, 20);
            assert!(loyalty_card::get_points(&card) == 20, 0);
            assert!(loyalty_card::get_referral_count(&card) == 1, 1);
            
            // Add 25 points from second referral
            loyalty_card::add_referral_points(&mut card, 25);
            assert!(loyalty_card::get_points(&card) == 45, 2);
            assert!(loyalty_card::get_referral_count(&card) == 2, 3);
            
            test_scenario::return_to_sender(&scenario, card);
        };

        test_scenario::end(scenario);
    }

    // ====== Test: Mixed Points (Purchase + Referral) ======

    #[test]
    fun test_mixed_points() {
        let mut scenario = test_scenario::begin(USER_ADDRESS);
        
        // Create card
        {
            loyalty_card::create_card(test_scenario::ctx(&mut scenario));
        };

        // Add both types of points
        test_scenario::next_tx(&mut scenario, USER_ADDRESS);
        {
            let mut card = test_scenario::take_from_sender<LoyaltyCard>(&scenario);
            
            // Add purchase points
            loyalty_card::add_purchase_points(&mut card, 60);
            // Add referral points
            loyalty_card::add_referral_points(&mut card, 50);
            // Add more purchase points
            loyalty_card::add_purchase_points(&mut card, 40);
            
            assert!(loyalty_card::get_points(&card) == 150, 0);
            assert!(loyalty_card::get_referral_count(&card) == 1, 1);
            
            test_scenario::return_to_sender(&scenario, card);
        };

        test_scenario::end(scenario);
    }

    // ====== Test: Successful Redemption ======

    #[test]
    fun test_redeem_reward_success() {
        let mut scenario = test_scenario::begin(USER_ADDRESS);
        
        // Create card
        {
            loyalty_card::create_card(test_scenario::ctx(&mut scenario));
        };

        // Add points and redeem
        test_scenario::next_tx(&mut scenario, USER_ADDRESS);
        {
            let mut card = test_scenario::take_from_sender<LoyaltyCard>(&scenario);
            
            // Add enough points
            loyalty_card::add_purchase_points(&mut card, 200);
            assert!(loyalty_card::get_points(&card) == 200, 0);
            
            // Redeem 100 points
            loyalty_card::redeem_reward(&mut card, 100);
            assert!(loyalty_card::get_points(&card) == 100, 1);
            
            // Redeem another 100 points
            loyalty_card::redeem_reward(&mut card, 100);
            assert!(loyalty_card::get_points(&card) == 0, 2);
            
            test_scenario::return_to_sender(&scenario, card);
        };

        test_scenario::end(scenario);
    }

    // ====== Test: Failed Redemption - Insufficient Points ======

    #[test]
    #[expected_failure(abort_code = indiqpass::loyalty_card::EInsufficientPoints)]
    fun test_redeem_reward_insufficient_points() {
        let mut scenario = test_scenario::begin(USER_ADDRESS);
        
        // Create card
        {
            loyalty_card::create_card(test_scenario::ctx(&mut scenario));
        };

        // Try to redeem without enough points
        test_scenario::next_tx(&mut scenario, USER_ADDRESS);
        {
            let mut card = test_scenario::take_from_sender<LoyaltyCard>(&scenario);
            
            // Add only 50 points
            loyalty_card::add_purchase_points(&mut card, 50);
            
            // Try to redeem 100 points - should fail
            loyalty_card::redeem_reward(&mut card, 100);
            
            test_scenario::return_to_sender(&scenario, card);
        };

        test_scenario::end(scenario);
    }

    // ====== Test: Failed Redemption - Below Minimum ======

    #[test]
    #[expected_failure(abort_code = indiqpass::loyalty_card::EInsufficientPoints)]
    fun test_redeem_reward_below_minimum() {
        let mut scenario = test_scenario::begin(USER_ADDRESS);
        
        // Create card
        {
            loyalty_card::create_card(test_scenario::ctx(&mut scenario));
        };

        // Try to redeem below minimum threshold
        test_scenario::next_tx(&mut scenario, USER_ADDRESS);
        {
            let mut card = test_scenario::take_from_sender<LoyaltyCard>(&scenario);
            
            // Add 200 points
            loyalty_card::add_purchase_points(&mut card, 200);
            
            // Try to redeem 50 points (below MIN_REDEEM_POINTS) - should fail
            loyalty_card::redeem_reward(&mut card, 50);
            
            test_scenario::return_to_sender(&scenario, card);
        };

        test_scenario::end(scenario);
    }

    // ====== Test: Failed Add - Zero Amount ======

    #[test]
    #[expected_failure(abort_code = indiqpass::loyalty_card::EZeroAmount)]
    fun test_add_zero_purchase_points() {
        let mut scenario = test_scenario::begin(USER_ADDRESS);
        
        // Create card
        {
            loyalty_card::create_card(test_scenario::ctx(&mut scenario));
        };

        // Try to add zero points
        test_scenario::next_tx(&mut scenario, USER_ADDRESS);
        {
            let mut card = test_scenario::take_from_sender<LoyaltyCard>(&scenario);
            
            // Try to add 0 points - should fail
            loyalty_card::add_purchase_points(&mut card, 0);
            
            test_scenario::return_to_sender(&scenario, card);
        };

        test_scenario::end(scenario);
    }

    #[test]
    #[expected_failure(abort_code = indiqpass::loyalty_card::EZeroAmount)]
    fun test_add_zero_referral_points() {
        let mut scenario = test_scenario::begin(USER_ADDRESS);
        
        // Create card
        {
            loyalty_card::create_card(test_scenario::ctx(&mut scenario));
        };

        // Try to add zero referral points
        test_scenario::next_tx(&mut scenario, USER_ADDRESS);
        {
            let mut card = test_scenario::take_from_sender<LoyaltyCard>(&scenario);
            
            // Try to add 0 referral points - should fail
            loyalty_card::add_referral_points(&mut card, 0);
            
            test_scenario::return_to_sender(&scenario, card);
        };

        test_scenario::end(scenario);
    }
}
