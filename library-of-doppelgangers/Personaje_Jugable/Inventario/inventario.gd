extends Control
	
var slot1Ocupado = false
var slot2Ocupado = false

var itemSlot1: Object
var itemSlot2: Object

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var Libros = get_tree().get_nodes_in_group("Libros")	#Creamos un array llamado "Libros", el cual contiene todos los miembros del grupo Libros en la escena
	for iteration in Libros:		#Para cada libro, conectamos su señal "Recogido" con el método "_recogerLibro"
		iteration.connect("Recogido",_acquireItem)
	
	$Slot1._emptySlot()		#Vaciamos los slots para iniciar(solo para asegurarnos, ya están vacíos). Les asignamos su numero y nos conectamos a su señal.
	$Slot1.slotNumber = 1
	$Slot1.connect("ObjetoSoltado", _dropItem)
	
	$Slot2._emptySlot()
	$Slot2.slotNumber = 2
	$Slot2.connect("ObjetoSoltado", _dropItem)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _acquireItem(item: Object):	#El método acquireItem chequea si hay un espacio vacío en el inventario. Si lo hay, añade el objeto al slot y le pide al item que se elimine. Si no lo hay, printea un mensaje en la consola.
	if !slot1Ocupado:
		$Slot1._addItem(item)
		itemSlot1 = item.duplicate()	#Duplicamos el objeto antes de borrar el original.
		slot1Ocupado = true
		item.call("_eliminar")
	else: if !slot2Ocupado:
		$Slot2._addItem(item)
		itemSlot2 = item.duplicate()	#Lo mismo.
		item.call("_eliminar")
		slot2Ocupado = true
	else:
		print("El inventario está lleno!")

func _dropItem(slot: int):	#El método _dropItem recibe un slot (determinado por un int) y lo vacía.
	#var escenaActual = get_tree().get_current_scene() Nota: El chequeo de si la escena actual es la del escritorio actualmente no funciona. Ha quedado obsoleto.
	#if(escenaActual.get_name() == "escritorio_escena"):
	if(slot==1):
		itemSlot1 = null
		slot1Ocupado = false
		$Slot1._emptySlot()
	if(slot==2):
		itemSlot2 = null
		slot2Ocupado = false
		$Slot2._emptySlot()
	
func _depositItem(depositSlot):	#Tomamos como argumento un slot ("destino") donde dejar nuestro objeto
	if slot1Ocupado:	#Primero chequeamos si el slot 1 tiene un objeto.
		if(itemSlot1):	#Si lo tiene, le decimos al slot destino que tome el objeto y lo quitamos del inventario
			depositSlot._addItem(itemSlot1)
			_dropItem(1)
	else: if slot2Ocupado:	#Si no hay nada en el slot 1, probamos con el 2
		if(itemSlot2):
			depositSlot._addItem(itemSlot2)
			_dropItem(2)
	else:
		print ("¡No hay objetos que soltar!") #Si no hay nada en ninguno de los slots, nos quejamos.
	
func _pickupFromDesk(item, depositSlot):	#Recibimos como argumento un objeto a depositar y un slot donde depositarlo.
	if(!slot1Ocupado || !slot2Ocupado):	#Si hay un slot desocupado, pasamos al método para recoger objetos
		_acquireItem(item)
		depositSlot._emptySlot()	#Y le decimos al slot que se vacíe ya que el objeto ahora le pertenece al inventario
	else:	#Si ambos slots están llenos, entonces printeamos una queja.
		print("El inventario está lleno!")
