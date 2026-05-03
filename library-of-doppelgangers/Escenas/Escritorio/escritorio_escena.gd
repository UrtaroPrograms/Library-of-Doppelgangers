extends Node2D

signal Levantarse
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_levantarse_pressed():	#Al apretar el botón, nos levantamos y volvemos a la escena original.
	emit_signal("Levantarse")
