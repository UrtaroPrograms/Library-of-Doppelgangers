extends PanelContainer
	
var slotNumber
signal ObjetoSoltado
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _addItem(item):	#Función para añadir un objeto al inventario. Es solo la parte visual.
	$TextureRect.texture = item._giveAppearance()
	$TextureRect/RichTextLabel.text = item._describe()

func _emptySlot():	#Borra la imagen y el texto en el slot. Es solo visual, el inventario mismo se encarga de la lógica.
	$TextureRect.texture = null
	$TextureRect/RichTextLabel.text = ""



func _on_button_pressed():		#Al presionar el botón, chequeamos si estamos en la escena escritorio, y de ser así, dejamos el libro en el escritorio.
	#if get_tree().get_current_scene().get_name() == "escritorio_escena":  Actualmente no funciona el chequeo de si la escena es la del escritorio.
		emit_signal("ObjetoSoltado", slotNumber)

		
