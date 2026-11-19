# Ficha del dispositivo: Teclado

## Tecnología de captura
El teclado tiene debajo de las teclas una matriz de contactos (filas y columnas). Al presionar una tecla se cierra un circuito en un cruce de la matriz; el microcontrolador del teclado recorre la matriz muchas veces por segundo, detecta qué cruce está cerrado y envía al computador un código de tecla (scancode) por USB. Puede ser de membrana (dos láminas que se tocan) o mecánico (un interruptor por tecla).

## Tipo de señal: Digital
Cada tecla solo tiene dos estados, pulsada o no pulsada, sin valores intermedios; por eso en Godot `get_action_strength` de una tecla siempre vale 0.00 o 1.00 y el HUD muestra "Digital".

## Ventaja
Es preciso y rápido: muchas teclas disponibles a la vez, ideal para asignar muchas acciones distintas sin ambigüedad.

## Limitación
Al ser digital no permite control gradual (por ejemplo, caminar despacio o rápido según cuánto se presione), y algunos teclados baratos sufren *ghosting* al pulsar varias teclas a la vez.

## Juego ejemplo
*Celeste* (2018): se juega con teclas para moverse, saltar y hacer el dash.

## Fuente
- Godot Engine — Using InputEvent: https://docs.godotengine.org/en/stable/tutorials/inputs/inputevent.html
- Wikipedia — Keyboard technology: https://en.wikipedia.org/wiki/Keyboard_technology
