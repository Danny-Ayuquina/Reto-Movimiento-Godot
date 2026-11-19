extends CharacterBody2D
## Script de movimiento del Player (R5).

## Velocidad horizontal en píxeles por segundo. Se cambia desde el Inspector.
@export var speed: float = 300.0


func _physics_process(_delta: float) -> void:
	# -1 con move_left, 1 con move_right, 0 si no hay ninguna (o ambas).
	var direction := Input.get_axis("move_left", "move_right")
	velocity.x = direction * speed
	move_and_slide()
