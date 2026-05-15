extends Node2D

@onready var Cliente = preload("res://Escenas/NPCs/npc_cliente.tscn").instantiate()
@onready var PuntoA = $"../PuntoA"
@onready var PuntoB = $"../PuntoB"
@onready var PuntoC = $"../PuntoC"
@onready var PuntoD = $"../PuntoD"

func _ready():
	Global.Generador = self
func _on_timer_timeout() -> void:
	add_child(Cliente)
	Cliente.global_position = PuntoA.global_position
	Cliente.Objetivo = PuntoB.global_position

func Salir_de_biblioteca():
	if Global.Cliente_Atendido:
		Cliente.global_position = PuntoC.global_position
		Cliente.Objetivo = PuntoD.global_position
		Cliente.caminar()
	Global.Cliente_Atendido = false
