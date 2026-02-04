# SOLID

El SOLID es un acrónimo que representa cinco principios fundamentales en la programación orientada a objetos, destinados a mejorar la calidad y mantenibilidad del software. Aquí tienes una breve descripción de cada principio:

### 1. Single Responsibility Principle (SRP)

Cada clase o módulo debe tener una única responsabilidad o propósito. En otras palabras, una clase debe hacer una sola cosa y hacerlo bien, lo que facilita el mantenimiento y la evolución del código.

Por ejemplo, si tienes una clase `User` que maneja la lógica de autenticación y el manejo de datos de usuario, deberías separar estas responsabilidades.

**Incorrecto:**

```ruby
class User
  def initialize(name, email)
    @name = name
    @email = email
  end

  def authenticate(password)
    # lógica de autenticación
  end

  def update_profile(name, email)
    @name = name
    @email = email
  end
end

```

**Correcto:**

```ruby
class User
  attr_accessor :name, :email

  def initialize(name, email)
    @name = name
    @email = email
  end
end

class AuthenticationService
  def authenticate(user, password)
    # lógica de autenticación
  end
end

```

### 2. Open/Closed Principle (OCP)

Las clases, módulos y funciones deben estar abiertos para su extensión, pero cerrados para la modificación. Esto significa que se debe poder agregar nuevas funcionalidades sin cambiar el código existente, lo que se puede lograr mediante el polimorfismo y la composición.

**Incorrecto:**

```ruby
class Report
  def generate(type)
    if type == :pdf
      # generar reporte PDF
    elsif type == :csv
      # generar reporte CSV
    end
  end
end

```

**Correcto:**

```ruby
class Report
  def generate(formatter)
    formatter.format(self)
  end
end

class PDFFormatter
  def format(report)
    # lógica para formatear en PDF
  end
end

class CSVFormatter
  def format(report)
    # lógica para formatear en CSV
  end
end

```

### 3. Liskov Substitution Principle (LSP)

Los objetos de una clase derivada deben poder reemplazar a los objetos de una clase base sin alterar el funcionamiento del programa. Esto implica que las clases derivadas deben ser sustituibles por sus clases base y seguir comportándose de la misma manera.

**Incorrecto:**

```ruby
class Bird
  def fly
    # lógica para volar
  end
end

class Penguin < Bird
  def fly
    raise "Penguins can't fly!"
  end
end

```

**Correcto:**

```ruby
class Bird
  def move
    # lógica para moverse
  end
end

class FlyingBird < Bird
  def fly
    # lógica para volar
  end
end

class Penguin < Bird
  def move
    # lógica para nadar
  end
end

```

### 4. Interface Segregation Principle (ISP)

Es mejor tener muchas interfaces específicas y pequeñas que tener una interfaz grande y general. Las clases no deben estar obligadas a implementar interfaces que no utilizan. Esto ayuda a reducir el acoplamiento y hace que el código sea más fácil de entender y mantener.

**Incorrecto:**

```ruby
class Worker
  def work
    # lógica para trabajar
  end

  def eat
    # lógica para comer
  end
end

```

**Correcto:**

```ruby
class Worker
  def work
    # lógica para trabajar
  end
end

class Eater
  def eat
    # lógica para comer
  end
end

class Employee < Worker
  include Eater
end

```

### 5. Dependency Inversion Principle (DIP)

Los módulos/clases de alto nivel no deben depender de los módulos de bajo nivel, ambos deben depender de abstracciones. Además, las abstracciones no deben depender de detalles, sino que los detalles deben depender de abstracciones. Esto promueve un diseño de software más flexible y reutilizable.

**Incorrecto:**

```ruby
class BackendDeveloper
  def develop
    puts "Writing Ruby code"
  end
end

class FrontendDeveloper
  def develop
    puts "Writing JavaScript code"
  end
end

class Project
  def initialize
    @backend = BackendDeveloper.new
    @frontend = FrontendDeveloper.new
  end

  def develop
    @backend.develop
    @frontend.develop
  end
end

```

**Correcto:**