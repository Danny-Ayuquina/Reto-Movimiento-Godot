extends Node2D
## Script del panel (HUD): muestra en tiempo real la señal que llega del dispositivo.

# R4: contadores para move_right.
var frames_pressed: int = 0 # Sondeo: cuadros con la acción pulsada.
var events_received: int = 0 # Eventos: eventos de move_right recibidos.

# R3: datos del último evento.
var last_event_class: String = "-"
var last_device: String = "-"
var last_signal: String = "-"

@onready var hud: Label = $Hud


func _input(event: InputEvent) -> void:
	# El eco del teclado (repetición al mantener la tecla) se ignora.
	if event is InputEventKey and event.echo:
		return

	if event.is_action("move_right"):
		events_received += 1

	last_event_class = event.get_class()

	if event is InputEventKey:
		last_device = "Teclado"
		last_signal = "Digital"
	elif event is InputEventMouseButton and (
			event.button_index == MOUSE_BUTTON_WHEEL_UP
			or event.button_index == MOUSE_BUTTON_WHEEL_DOWN
			or event.button_index == MOUSE_BUTTON_WHEEL_LEFT
			or event.button_index == MOUSE_BUTTON_WHEEL_RIGHT):
		# La rueda va antes que el clic porque también es InputEventMouseButton.
		last_device = "Ratón (rueda)"
		last_signal = "Digital (pasos)"
	elif event is InputEventMouseButton:
		last_device = "Ratón (clic)"
		last_signal = "Digital"
	elif event is InputEventMouseMotion:
		last_device = "Ratón (movimiento)"
		last_signal = "Posición"
	elif event is InputEventJoypadButton:
		last_device = "Mando (botón)"
		last_signal = "Digital"
	elif event is InputEventJoypadMotion:
		last_device = "Mando (stick/gatillo)"
		last_signal = "Analógica"
	elif event is InputEventScreenTouch or event is InputEventScreenDrag:
		last_device = "Pantalla táctil"
		last_signal = "Posición"
	else:
		last_device = "Otro"
		last_signal = "-"


func _process(_delta: float) -> void:
	# Sondeo: se pregunta cada cuadro si la acción está pulsada.
	if Input.is_action_pressed("move_right"):
		frames_pressed += 1

	var jump_pressed := Input.is_action_pressed("jump")
	var axis := Input.get_axis("move_left", "move_right")
	var strength := Input.get_action_strength("move_right")

	hud.text = "jump: %s\n" % str(jump_pressed)
	hud.text += "get_axis: %.2f\n" % axis
	hud.text += "get_action_strength(\"move_right\"): %.2f\n" % strength
	hud.text += "\n"
	hud.text += "Clase del evento: %s\n" % last_event_class
	hud.text += "Dispositivo: %s\n" % last_device
	hud.text += "Tipo de señal: %s\n" % last_signal
	hud.text += "\n"
	hud.text += "move_right - cuadros pulsada: %d\n" % frames_pressed
	hud.text += "move_right - eventos recibidos: %d" % events_received
