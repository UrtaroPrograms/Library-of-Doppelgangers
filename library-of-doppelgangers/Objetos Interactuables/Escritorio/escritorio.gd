extends Interactable
class_name Escritorio

#Creamos una clase Escritorio, la cual hereda de Interactable (Una clase general para todos los objetos con los que el jugador interactua al moverse).

signal Sentarse #Envía una señal al ser usado.

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func interact():	#La función interact del escritorio lo hace cambiar a la escena del escritorio en 1ra persona. Hace esto a través de una llamada a la función principal.
	emit_signal("Sentarse")	
	
