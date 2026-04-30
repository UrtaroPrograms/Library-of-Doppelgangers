extends Interactable
class_name Libro

#TODO: Al añadir otros objetos, podríamos crear una clase de objetos recogibles, que todos compartan los métodos para entregar su apariencia y descripción, ya que el inventario las usa.
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
	Recogido.emit(self)
	
	
func _describe(): #El método Describe hace que el libro retorne su descripción en forma de un String. Lo llama el inventario para dar la descripción del libro.
	return ("Nombre del Libro : \n" + nombreDelLibro + "\n\nLongitud: " + longitud + "\n\nTemática: " + tematica)

func _giveAppearance():	#Retornamos el sprite2D del libro.
	return $Sprite2D.texture

func _eliminar():	#Este método elimina el libro.
	queue_free()
