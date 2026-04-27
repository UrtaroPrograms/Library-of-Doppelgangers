extends State
class_name Idle

@export var character: CharacterBody2D
	
func _enter():
	pass
	
func _exit():
	pass
	
func _update(_delta: float):
	if(character.velocity.y != 0 || character.velocity.x != 0):	#Si no estamos quietos, pasamos a estar caminando.
		Transitioned.emit(self, "Walking")
	
	else:
		character._call_animation("Idle") #Si estamos quietos, pues llamamos a la animación de estar quietos.
	
func _physics_update(_delta: float):
	pass
