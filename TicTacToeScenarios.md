Escenarios para el proyecto TicTacToe en TDD y en BDD
Basados en las historias de usuario

**TDD**
1. Inicio del juego
    Inicializar el tablero
        Dado un nuevo juego
        Cuando se inicializa la partida
        Entonces el tablero 3x3 debe contener 9 casilla vacias
    Seleccionar jugador inicial
        Dado un nuevo juego
        Cuando el jugador eligue "X"
        Entoces el turno inicial debe ser "X"
    Mostrar turno actual
        Dado un nuevo juego
        Cuando esta en proceso un turno
        Entonces el sistema debe indicar el jugador actual

2. Realizar un movimiento
    Colocar marca en casilla vacía
        Dado un tablero con una casilla vacía
        Cuando el jugador actual selecciona esa casilla
        Entonces la casilla contiene la marca del jugador
    Cambiar turno después de un movimiento válido
        Dado que el jugador "X" realizó un movimiento válido
        Entonces el turno cambia a "O"
    Evitar sobrescribir una casilla ocupada
        Dado una casilla ocupada
        Cuando un jugador intenta seleccionarla
        Entonces el tablero no debe cambiar

3. Determinación de ganador
    Detectar victoria por fila
        Dado un tablero con tres marcas iguales en una fila
        Cuando se evalúa el estado del juego
        Entonces se declara un ganador
    Detectar victoria por columna
        Dado un tablero con tres marcas iguales en una columna
        Cuando se evalúa el estado del juego
        Entonces se declara un ganador
    Detectar victoria por diagonal
        Dado un tablero con tres marcas iguales en una diagonal
        Cuando se evalúa el estado del juego
        Entonces se declara un ganador
    Detectar empate
        Dado un tablero lleno
        Cuando no hay combinaciones ganadoras
        Entonces el resultado es empate
    
4. Reiniciar el juego
    Reiniciar tablero
        Dado un juego en progreso
        Cuando el jugador presiona "Reiniciar"
        Entonces el tablero queda vacío y se inicia un nuevo juego

5. Interfaz de usuario
    Mostrar cuadrícula
        El tablero debe renderizar 9 casillas visibles
    Mostrar estado del juego
        El estado actual (turno, victoria o empate) debe ser visible

6. Modo de juego multijugador local
    Alternar turnos entre jugadores
    Mantener estado correcto del juego para ambos jugadores

7. Modo de juego contra la computadora (IA)
    Movimiento válido de la IA
        La IA solo debe jugar en casillas vacías
    Responder al movimiento del jugador
        Después del turno del jugador, la IA realiza un movimiento


**BDD**
Casos de uso 
1. Inicia del juego
Escenario: Iniciar una nueva partida con tablero vacío
    Dado que el jugador inicia una nueva partida
    Cuando el juego se carga
    Entonces se muestra una cuadrícula vacía de 3x3
Escenario: Seleccionar símbolo inicial
    Dado que el jugador inicia una nueva partida
    Cuando elige jugar como "X"
    Entonces el turno inicial es "X"
    Y el juego muestra que es el turno de "X"


2. Realizar un movimiento
Escenario: Realizar un movimiento válido
    Dado que el turno actual es "X" y la casilla seleccionada está vacía
    Cuando el jugador selecciona la casilla
    Entonces la casilla muestra "X" y el turno cambia a "O"

Escenario: Intentar jugar en una casilla ocupada
    Dado que una casilla ya contiene una marca
    Cuando el jugador intenta seleccionarla
    Entonces el movimiento no es permitido y el turno no cambia


3. Determinación de ganador
Escenario: Ganar por fila
    Dado un tablero con tres "X" en la misma fila
    Cuando el juego verifica el estado
    Entonces el jugador "X" es declarado ganador

Escenario: Empate
    Dado que todas las casillas están llenas
    Y ningún jugador ha ganado
    Cuando el juego verifica el estado
    Entonces el resultado es empate

4. Reiniciar el juego
Escenario: Reiniciar la partida
    Dado que una partida está en curso
    Cuando el jugador presiona el botón de reinicio
    Entonces el tablero se limpia y se inicia un nuevo juego

5. Interfaz de usuario
Escenario: Mostrar información del juego
    Dado que el juego está en ejecución
    Cuando nos disponemos a jugar
    Entonces la cuadrícula es visible y el turno actual se muestra claramente

6. Modo de juego multijugador local
Escenario: Juego entre dos jugadores locales
    Dado que dos jugadores están jugando en el mismo dispositivo
    Cuando un jugador realiza un movimiento
    Entonces el turno pasa al otro jugador

7. Modo de juego contra la computadora (IA)
Escenario: Jugar contra la computadora
    Dado que el jugador selecciona jugar contra la IA
    Cuando el jugador realiza un movimiento
    Entonces la IA realiza un movimiento válido
