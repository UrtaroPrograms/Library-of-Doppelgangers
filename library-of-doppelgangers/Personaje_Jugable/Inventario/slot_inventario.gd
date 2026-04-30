extends PanelContainer


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
