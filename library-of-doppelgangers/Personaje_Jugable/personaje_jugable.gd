extends CharacterBody2D


const SPEED = 200.0


func _ready():
	pass
	
func _physics_process(delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	
	var direction = Input.get_vector("move_left","move_right","move_up","move_down")  #La dirección se toma como un vector en base a los inputs de movimiento.
	if(direction.y != 0): #Si el jugador se está moviendo verticalmente, entonces ponemos en 0 la velocidad horizontal. Esto evita que se mueva diagonalmente.
		direction.x = 0
	
	direction = direction.normalized()
	
	velocity = direction * SPEED
	
	if Input.is_action_just_pressed("Interact"):	#Al apretar la Z, se realiza el input de interactuar. El juego chequea si el raycast ha tocado algo y si es un Interactable. De ser así, se ejecuta su método de interacción.
		var object = $RayCast2D.get_collider()
		if  object is Interactable:
			object.interact()
	
	move_and_slide()
	
func _call_animation(anim: String):  #Este método llama al AnimatedSprite2D y lo hace ejecutar una animación.
	$AnimatedSprite2D.play(anim)

func _flip_horizontal_appearance(flip: bool):
	if (flip):
		$AnimatedSprite2D.flip_h = true
	else:
		$AnimatedSprite2D.flip_h = false

func _flip_vertical_appearance(flip: bool):
	if (flip):
		$AnimatedSprite2D.flip_v = true
	else:
		$AnimatedSprite2D.flip_v = false
	
func _turnRaycast(angle: int):
	$RayCast2D.rotation_degrees = angle


	#var horizontalDirection := Input.get_axis("move_left", "move_right")
	#if horizontalDirection:
		#velocity.x = horizontalDirection * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)
	#
	#var verticalDirection := Input.get_axis("move_up", "move_down")
	#if verticalDirection:
		#velocity.y = verticalDirection * SPEED
	#else:
		#velocity.y = move_toward(velocity.y, 0, SPEED)
#
	#move_and_slide()
