extends Node2D

signal Levantarse
var escenaVictoria
var escenaDerrota
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_levantarse_pressed():	#Al apretar el botón, nos levantamos y volvemos a la escena original.
	emit_signal("Levantarse")

func victoria():
	$TemporizadorPuerta.stop()	#El temporizador de victoria sobreescribe al de la derrota, por ende lo detiene.
	var arbolActual = get_tree()
	var escenaActual = arbolActual.get_current_scene()
	arbolActual.get_root().add_child(escenaVictoria)
	arbolActual.get_root().remove_child(escenaActual)
	arbolActual.set_current_scene(escenaVictoria)

func derrota():
	var arbolActual = get_tree()
	var escenaActual = arbolActual.get_current_scene()
	arbolActual.get_root().add_child(escenaDerrota)
	arbolActual.get_root().remove_child(escenaActual)
	arbolActual.set_current_scene(escenaDerrota)
