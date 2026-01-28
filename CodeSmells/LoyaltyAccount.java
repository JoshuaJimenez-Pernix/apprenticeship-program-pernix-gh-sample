package CodeSmells;

public class LoyaltyAccount {

    private int loyaltyPoints;
    private double accountBalance;

    public LoyaltyAccount(int loyaltyPoints, double accountBalance) {
        this.loyaltyPoints = loyaltyPoints;
        this.accountBalance = accountBalance;
    }

    public double calculateDiscount() {
        if (loyaltyPoints > 200) {
            return accountBalance * 0.2;
        }
        if (loyaltyPoints > 100) {
            return accountBalance * 0.1;
        }
        return accountBalance * 0.05;
    }
}
