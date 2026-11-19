# Respuestas

## 1. Mantén D dos segundos y suéltala: ¿qué contador subió más y por qué?
Subió mucho más el contador de **cuadros con la acción pulsada** (unos 120 a 60 FPS), mientras que el de **eventos recibidos** solo subió 2. El de cuadros usa sondeo: en cada `_process` se pregunta `Input.is_action_pressed("move_right")`, así que suma 1 por cada cuadro que la tecla sigue abajo. El de eventos cuenta llamadas a `_input`, y el teclado solo genera un evento al pulsar y otro al soltar (los eventos de eco por mantener la tecla se ignoran).

## 2. Mantén A: ¿qué valor muestran get_axis y get_action_strength("move_right"), y por qué difieren?
`get_axis` muestra **-1.00** y `get_action_strength("move_right")` muestra **0.00**. Difieren porque `get_axis("move_left", "move_right")` combina dos acciones (fuerza de la positiva menos la de la negativa) y da un valor entre -1 y 1, mientras que `get_action_strength` solo mide una acción, entre 0 y 1; como D no está pulsada, su fuerza es 0.

## 3. Gira la rueda del ratón: ¿qué clase de evento aparece y por qué su rama va antes que la del clic?
Aparece **InputEventMouseButton**, con `button_index` igual a `MOUSE_BUTTON_WHEEL_UP` o `MOUSE_BUTTON_WHEEL_DOWN`. La rama de la rueda va antes porque Godot trata cada paso de la rueda como un botón del ratón; si la rama general `event is InputEventMouseButton` (clic) estuviera primero, también atraparía la rueda y nunca se distinguiría de un clic.
