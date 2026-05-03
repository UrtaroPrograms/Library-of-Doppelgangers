extends Node2D

var escenaEscritorio = preload("res://Escenas/escritorio_escena.tscn").instantiate()	#Cargamos la escena del escritorio para luego poder cambiar.

var inventario	#Tomamos al inventario como variable, de tal modo que podamos pasarselo a la escena escritorio

# Called when the node enters the scene tree for the first time.
func _ready():
	escenaEscritorio.connect("Levantarse", _volverAEscenaPrincipal)	#Nos connectamos a la señal "levantarse" de la escena escritorio, que nos hace volver
	$Escritorio.connect("Sentarse", _pasarAEscenaEscritorio) #también nos conectamos a la escena "Sentarse" del escritorio objeto, el cual nos hace cambiar de escena.
	inventario = $Inventario

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _pasarAEscenaEscritorio():	#Tomamos al árbol de nodos actual, le añadimos la escena nueva y quitamos la actual, también le pasamos al inventario para que se lo quede.
	var arbolActual = get_tree()
	var escenaActual = arbolActual.get_current_scene()
	arbolActual.get_root().add_child(escenaEscritorio)
	arbolActual.get_root().remove_child(escenaActual)
	arbolActual.set_current_scene(escenaEscritorio)
	self.remove_child(inventario)
	arbolActual.get_root().add_child(inventario)

func _volverAEscenaPrincipal():	#Hacemos lo mismo, excepto que ahora quitamos la escena actual y volvemos a la escena original.
	var arbolActual = Engine.get_main_loop()
	var escenaActual = arbolActual.get_current_scene()
	arbolActual.get_root().add_child(self)
	arbolActual.get_root().remove_child(inventario)
	arbolActual.get_root().remove_child(escenaActual)
	arbolActual.set_current_scene(self)
	self.add_child(inventario)
