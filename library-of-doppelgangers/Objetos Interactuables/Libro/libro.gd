extends Interactable
class_name Libro

#Creamos una clase Libro, la cual hereda de Interactable (Una clase general para todos los objetos con los que el jugador interactua al moverse).

signal Recogido #Envía una señal al ser recogido
@export var nombreDelLibro: String #TODO: Los String de nombre, longitud y temática son para que el NPC pueda pedir un libro de cierto tipo. Por ahora se colocan en el inspector. Pero luego quiero poner distintas variaciones de nombres, longitudes y temáticas en un array y que el juego seleccione al azar.
@export var longitud: String
@export var tematica: String

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func interact():	#La función interact del libro lo hace emitir su señal de recolección y luego borrarse.
	#TODO: En realidad, primero debería chequear con el inventario si hay un espacio disponible, y solo si lo hay entonces debe eliminarse. Esto puede hacerse con una señal que se envíe al inventario, que luego responda con otra señal a un método para eliminar el libro de verdad.
	Recogido.emit(nombreDelLibro,longitud,tematica)
	queue_free()
