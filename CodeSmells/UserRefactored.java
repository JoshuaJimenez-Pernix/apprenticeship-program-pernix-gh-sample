package CodeSmells;

import java.util.List;

public class UserRefactored {

    private ContactInfo contactInfo;
    private LoyaltyAccount loyaltyAccount;
    private List<String> orders;
    private List<String> coupons;

    public UserRefactored(ContactInfo contactInfo, LoyaltyAccount loyaltyAccount, List<String> orders, List<String> coupons) {
        this.contactInfo = contactInfo;
        this.loyaltyAccount = loyaltyAccount;
        this.orders = orders;
        this.coupons = coupons;
    }

    public void updateContactInfo(ContactInfo newContactInfo) {
        this.contactInfo = newContactInfo;
    }

    public double calculateDiscount() {
        return loyaltyAccount.calculateDiscount();
    }

    public void printOrders() {
        orders.forEach(order -> System.out.println("Order: " + order));
    }

    public void applyCoupons() {
        coupons.forEach(coupon -> System.out.println("Applying coupon: " + coupon));
    }
}


