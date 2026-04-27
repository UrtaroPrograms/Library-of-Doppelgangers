extends State
class_name Walking

@export var character: CharacterBody2D
	
func _enter():
	pass
	
func _exit():
	pass
	
func _update(_delta: float):
	
	
	if(character.velocity.y > 0):	#Si la velocidad en Y es mayor a 0, estamos bajando. Flippeamos el vertical. Si hubiese animaciones acá llamaríamos la de caminar hacia abajo.
		character._call_animation("Walk")  #Si tuviesesmos animaciones para arriba, abajo, izquierda y derecha, acá llamaríamos la de "abajo"
		character._flip_vertical_appearance(true)
		
	else: if(character.velocity.y < 0): #Si la velocidad en Y es menor a 0, estamos subiendo, el sprite vertical vuelve a la normalidad. Otra vez si hubiese animación la llamaríamos pero no hay.
		character._call_animation("Walk")
		character._flip_vertical_appearance(false)
	#Ponemos los else if del movimento horizontal por debajo de los verticales ya que el movimiento vertical toma prioridad por sobre el horizontal (no debería pasar nada raro, pero nos ahorraría chequear infinitas veces)
	else: if(character.velocity.x > 0): #Velocidad X mayor a cero por ende vamos a la derecha y no lo flippeamos al sprite. Aquí es donde pondría mis animaciones si las tuviera.
		character._call_animation("Walk")
		character._flip_horizontal_appearance(false)
	else:   #Si nada de esto se cumple, pues se estará moviendo hacia la izquierda.
		character._call_animation("Walk")
		character._flip_horizontal_appearance(true)
	
func _physics_update(_delta: float):
	
	if(character.velocity.y == 0 && character.velocity.x == 0):  #Si no hay velocidad en Y ni en X pues pasamos al estado de quietud.
		Transitioned.emit(self, "Idle")
