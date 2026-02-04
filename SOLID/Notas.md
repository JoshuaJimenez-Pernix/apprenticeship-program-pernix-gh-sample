La clase Order tiene demasiadas responsabilidades:
- Cálculo del total
- Envío de emails
- Impresión de la orden
👉 Violación clara de Single Responsibility Principle (SRP)

Order depende directamente de:
- La forma de enviar emails
- La forma de imprimir
No depende de abstracciones.
👉 Violación de Dependency Inversion Principle (DIP)

