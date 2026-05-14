extends CharacterBody2D
var Nombre_Cliente = ""
var Libro_Pedido = ""
@onready var UI = $"Cuadro de dialogo"
@onready var Nombre_Texto = $"Cuadro de dialogo/BoxContainer/Imagen_dialogo/Nombre"
@onready var Dialogo = $"Cuadro de dialogo/BoxContainer/Imagen_dialogo/Dialogo"
var Velocidad_Movimiento = 200.0
var Objetivo = Vector2.ZERO
var generador

func _ready():
	UI.visible = false
	
func _physics_process(delta: float) -> void:
	var direccion = (Objetivo - global_position).normalized()
	velocity = direccion * Velocidad_Movimiento
	move_and_slide()


func Pedir_Libro():
	if UI != null:
		UI.visible = true
		Nombre_Texto.text = Nombre_Cliente
		Dialogo.text = "Hola, quisiera " + Libro_Pedido
	
func recibir_libro(libro):
	print("Libro entregado")
	if libro.nombreDelLibro == Libro_Pedido:
		Global.Cliente_Atendido = true
		Global.Cliente_en_escritorio = false
		generador.Salir_de_biblioteca()
		queue_free()
	else:
		get_tree().call_group("Escenas","derrota", "Los clientes tienen poca paciencia para el mal servicio.")
	
