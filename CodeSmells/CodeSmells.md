# Code Smells

Los "code smells" son indicadores en el código que sugieren posibles problemas o áreas de mejora. Aunque no necesariamente significan que el código esté roto o incorrecto, pueden llevar a problemas en el futuro si no se abordan. Los code smells a menudo hacen que el código sea más difícil de entender, mantener o ampliar. Aquí hay algunos ejemplos comunes de code smells:

### **Código duplicado**

El código idéntico o similar aparece en varios lugares, lo que hace que el mantenimiento sea más difícil porque los cambios deben hacerse en varios lugares.

```java
// Code duplication
public class Order {
    public void calculateTotal() {
        double total = 0;
        for (Item item : items) {
            total += item.getPrice();
        }
        System.out.println("Total: " + total);
    }

    public void printOrder() {
        double total = 0;
        for (Item item : items) {
            total += item.getPrice();
        }
        System.out.println("Order details: " + details);
        System.out.println("Total: " + total);
    }
}

```

### **Método largo**

Los métodos que son demasiado largos pueden ser difíciles de entender y mantener. A menudo hacen demasiado y podrían beneficiarse de ser divididos en métodos más pequeños y enfocados.

```java
public void processOrder(Order order) {
    // Multiple steps in one method
    validateOrder(order);
    calculateTotals(order);
    applyDiscounts(order);
    processPayment(order);
    shipOrder(order);
}

```

### **Clase grande**

Similar a los métodos largos, las clases grandes que contienen demasiada funcionalidad pueden ser difíciles de gestionar. Pueden violar el Principio de Responsabilidad Única, que establece que una clase debe tener una sola razón para cambiar.

```java
public class Customer {
    private String name;
    private String address;
    private List<Order> orders;
    private List<Payment> payments;
    private double creditScore;

    public void placeOrder(Order order) {
        // Place order logic
    }

    public void makePayment(Payment payment) {
        // Payment logic
    }

    public double calculateDiscount() {
        // Discount logic
    }
}

```

### **Lista larga de parámetros**

Los métodos que requieren muchos parámetros pueden ser confusos y difíciles de usar correctamente. Esto podría indicar que algunos parámetros pueden ser encapsulados en un solo objeto o que el método está haciendo demasiado.

```java
public void createAccount(String name, String address, String phone, String email, String username, String password) {
    // Account creation logic
}

```

### **Instrucciones switch**

El uso frecuente de instrucciones switch, especialmente con muchos casos, puede hacer que el código sea rígido y difícil de ampliar. Esto a menudo indica la necesidad de polimorfismo o un patrón de diseño como Strategy.

```java
public double calculateDiscount(String customerType) {
    switch (customerType) {
        case "REGULAR":
            return 0.1;
        case "PREMIUM":
            return 0.2;
        case "VIP":
            return 0.3;
        default:
            return 0.0;
    }
}

```

### Comentarios

Aunque los comentarios pueden ser útiles, una dependencia excesiva en ellos puede indicar que el código en sí no es autoexplicativo. El código debe ser escrito de manera lo suficientemente clara como para minimizar la necesidad de comentarios.

```java
// This method checks if the order is valid
public boolean isValidOrder(Order order) {
    // Check if the order has items
    if (order.items.isEmpty()) {
        return false;
    }
    // Check if the customer is active
    if (!order.customer.isActive()) {
        return false;
    }
    return true;
}

```

### Nombres inconsistentes

El uso de convenciones de nombres inconsistentes o nombres vagos puede llevar a confusión y errores. Los nombres consistentes y significativos ayudan a que el código sea más legible.

```java
public class User {
    private String usrName;
    private String userAddr;

    public void setName(String name) {
        this.usrName = name;
    }

    public void setAddress(String addr) {
        this.userAddr = addr;
    }
}

```

### Código muerto

El código no utilizado que permanece en la base de código puede saturarla y hacer que sea más difícil de entender y mantener.

```java
public class Product {
    private String name;
    private double price;

    // Deprecated
    private void calculateShipping() {
        // Empty method, not used anymore
    }
}

```

### Generalidad especulativa

Esto ocurre cuando el código se escribe para manejar casos que aún no existen y pueden nunca existir, lo que a menudo lleva a una complejidad innecesaria.

```java
public class Shape {
    public void drawShape() {
        // Implementation pending, in case we need it later
    }
}

```

### Agrupación de datos

Cuando el mismo grupo de elementos de datos aparece junto en varios lugares, puede indicar que deben ser encapsulados dentro de un objeto.

```java
public void displayCustomerInfo(String name, String address, String phone, String email) {
    // Display info
}

```

### Obsesión por los primitivos

El uso excesivo de primitivos para la representación de datos, en lugar de crear clases específicas del dominio, puede hacer que el código sea menos expresivo y más difícil de mantener.

```java
public class User {
    private String firstName;
    private String lastName;
    private String email;

    public String getFullName() {
        return firstName + " " + lastName;
    }
}

```

### Clase perezosa

Una clase que hace muy poco y que podría no justificar su existencia. Esto podría ser el resultado de una optimización prematura o un exceso de ingeniería.

```java
public class ReportGenerator {
    public void generate() {
        // Calls other classes to do the work
    }
}

```

### Envidia de características

Cuando un método en una clase está más interesado en los datos y métodos de otra clase que en los suyos propios, puede indicar que la funcionalidad debería trasladarse a la otra clase.

```java
public class Order {
    private Customer customer;

    public String getCustomerAddress() {
        return customer.getAddress();
    }
}

```

Abordar los code smells a menudo implica refactorización, que es el proceso de reestructurar el código existente sin cambiar su comportamiento externo. El objetivo es mejorar la estructura interna del código, haciéndolo más limpio, eficiente y fácil de trabajar.