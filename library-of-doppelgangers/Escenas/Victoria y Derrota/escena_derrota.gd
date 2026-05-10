extends Node2D

var mensaje

# Called when the node enters the scene tree for the first time.
func _ready():
	$"Consejo Game Over".text = mensaje

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_restart_pressed() -> void:		#Al presionar el botón de reiniciar, vuelve a cargar la escena original del juego. No funciona por ahora.
	#get_tree().reload_current_scene()
	#get_tree().change_scene_to_file("res://Escenas/escena_testeo.tscn")
	pass
	
func _on_salir_pressed() -> void:
	get_tree().quit()	#Sale del juego al apretar el botón de salir.
