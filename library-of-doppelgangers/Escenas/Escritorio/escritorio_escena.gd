extends Node2D
var Cliente = preload("res://Escenas/NPCs/npc_cliente.tscn").instantiate()
@onready var inventario = $"Slot Escritorio/Slot"
var Nombres = ["Jhonn", "Jhonny", "Jhonna", "Julia"]
var Libros = ["La Historia del Universo enterita", "El Percebe Feo"]

signal Levantarse
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Global.Cliente_en_escritorio:
		add_child(Cliente)
		Cliente.generador = Global.Generador
		Cliente.Nombre_Cliente = Nombres.pick_random()
		Cliente.Libro_Pedido = Libros.pick_random()
	inventario.entregar_libro.connect(Cliente.recibir_libro)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if is_instance_valid(Cliente):
		Cliente.global_position = Vector2(570.0, 290.0)
	hablar()

func _on_levantarse_pressed():	#Al apretar el botón, nos levantamos y volvemos a la escena original.
	emit_signal("Levantarse")

func hablar():
	if Input.is_action_just_pressed("Interact"):
		Cliente.Pedir_Libro()
