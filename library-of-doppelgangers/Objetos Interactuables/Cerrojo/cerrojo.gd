extends Interactable
class_name cerrojo


signal Recogido #Envía una señal al ser recogido
@export var valorReparacion: int
@export var nombre: String
@export var descripcion: String

func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func interact():	#La función interact del libro lo hace emitir su señal de recolección y luego borrarse.
	Recogido.emit(self)
	
	
func _describe(): #El método Describe hace que el libro retorne su descripción en forma de un String. Lo llama el inventario para dar la descripción del libro.
	return (nombre + "\n\n" + descripcion)

func _giveAppearance():	#Retornamos el sprite2D del libro.
	return $Sprite2D.texture

func _eliminar():	#Este método elimina el libro.
	queue_free()
