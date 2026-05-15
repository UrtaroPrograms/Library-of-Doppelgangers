extends Node2D

var escenaPrincipal = preload("res://Escenas/escena_testeo.tscn").instantiate()	#Cargamos la escena del escritorio para luego poder cambiar.

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float):
	if Input.is_action_just_pressed("Interact"):
		var arbolActual = get_tree()
		arbolActual.get_root().add_child(escenaPrincipal)
		arbolActual.set_current_scene(escenaPrincipal)
		arbolActual.get_root().remove_child(self)
