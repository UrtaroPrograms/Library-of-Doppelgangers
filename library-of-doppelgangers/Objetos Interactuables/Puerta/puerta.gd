extends Interactable
class_name Puerta

#Creamos una clase Puerta, la cual hereda de Interactable (Una clase general para todos los objetos con los que el jugador interactua al moverse).

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func interact():	#La función interact de la puerta hace que se retrase el temporizador de game over de la puerta. Si el jugador tiene un cerrojo en su inventario, entonces la puerta se queda cerrada más tiempo.
	get_tree().call_group("Inventario","_usarCerrojo")
