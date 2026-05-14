extends PanelContainer
	
var inventario
var heldItem
# Called when the node enters the scene tree for the first time.
func _ready():
	$MenuButton.get_popup().id_pressed.connect(_on_menu_button_pressed)	#Con esto nos conectamos al botón menú que lleva cada slot.
	inventario = get_tree().get_nodes_in_group("Inventario").get(0)	#Usamos el grupo "Inventario" como etiqueta para poder localizar al inventario real, y poner usarlo de variable. Ponemos el get(0) al final porque get_nodes_in_group() nos retorna un array.
	heldItem = null
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _addItem(item):	#Función para añadir un objeto al inventario. Es solo la parte visual.
	$TextureRect.texture = item._giveAppearance()
	$TextureRect/RichTextLabel.text = item._describe()
	heldItem = item
	
func _emptySlot():	#Borra la imagen y el texto en el slot. Es solo visual, el inventario mismo se encarga de la lógica.
	$TextureRect.texture = null
	$TextureRect/RichTextLabel.text = ""
	heldItem = null

func _on_menu_button_pressed(id : int):	#Al apretar uno de los botones del menú, se ejecuta una lógica distinta, dependiendo del botón.
	match id:
		0: 	#Dejar Libro
			if heldItem:
				print("Ya hay un objeto en este slot!")
			else:
				inventario._depositItem(self)
				
		1: #Entregar Libro. Todavía no hay clientes así que no se implementa.
			print("segunda opcion") 
		2: #Recoger
			if heldItem:
				inventario._pickupFromDesk(heldItem,self)
			else:
				print("No hay objeto que recoger")
