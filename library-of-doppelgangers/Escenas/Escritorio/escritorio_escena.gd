extends Node2D
var Cliente
var Nombres = ["Jhonn", "Jhonny", "Jhonna", "Julia"]
var Libros = ["La Historia del Universo enterita", "El Percebe Feo", "La Librería de los Doppelgangers","Las Aventuras de Pepe"]
var escenaDerrota = preload("res://Escenas/Victoria y Derrota/escena_derrota.tscn").instantiate() #Cargamos la escena de derrota para luego poder pasar a ella.
var slots
var clienteEsperando = false

signal Levantarse
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	slots = get_tree().get_nodes_in_group("Slots Escritorio")
	if Global.Cliente_en_escritorio && !clienteEsperando:
		Cliente = preload("res://Escenas/NPCs/npc_cliente.tscn").instantiate()
		add_child(Cliente)
		Cliente.generador = Global.Generador
		Cliente.Nombre_Cliente = Nombres.pick_random()
		Cliente.Libro_Pedido = Libros.pick_random()
		for each in slots:
			each.entregar_libro.connect(Cliente.recibir_libro)
		clienteEsperando = true
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if is_instance_valid(Cliente):
		Cliente.global_position = Vector2(570.0, 290.0)
	hablar()

func _on_levantarse_pressed():	#Al apretar el botón, nos levantamos y volvemos a la escena original.
	emit_signal("Levantarse")

func hablar():
	if Input.is_action_just_pressed("Interact") && clienteEsperando:
		Cliente.Pedir_Libro()
		

func chequearCliente():
	if Global.Cliente_en_escritorio && !clienteEsperando:
		Cliente = preload("res://Escenas/NPCs/npc_cliente.tscn").instantiate()
		add_child(Cliente)
		Cliente.generador = Global.Generador
		Cliente.Nombre_Cliente = Nombres.pick_random()
		Cliente.Libro_Pedido = Libros.pick_random()
		for each in slots:
			each.entregar_libro.connect(Cliente.recibir_libro)
		clienteEsperando = true


func derrota(mensaje: String):
	var arbolActual = get_tree()
	var escenaActual = arbolActual.get_current_scene()
	escenaDerrota.mensaje = mensaje
	arbolActual.get_root().add_child(escenaDerrota)
	arbolActual.get_root().remove_child(escenaActual)
	arbolActual.set_current_scene(escenaDerrota)
