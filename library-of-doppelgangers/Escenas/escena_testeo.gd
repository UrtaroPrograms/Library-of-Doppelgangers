extends Node2D

var escenaEscritorio = preload("res://Escenas/Escritorio/escritorio_escena.tscn").instantiate()	#Cargamos la escena del escritorio para luego poder cambiar.
var escenaPuerta
var escenaVictoria = preload("res://Escenas/Victoria y Derrota/escena_victoria.tscn").instantiate() #Cargamos la escena de victoria para luego poder pasar a ella.
var escenaDerrota = preload("res://Escenas/Victoria y Derrota/escena_derrota.tscn").instantiate() #Cargamos la escena de derrota para luego poder pasar a ella.

var interfaces	#Definimos a los objetos de interfaz (o más bien al grupo de objetos de interfaz) como una variable para facilitar su traslado de una escena a otra.

# Called when the node enters the scene tree for the first time.
func _ready():
	escenaEscritorio.connect("Levantarse", _volverAEscenaPrincipal)	#Nos connectamos a la señal "levantarse" de la escena escritorio, que nos hace volver
	$Escritorio.connect("Sentarse", _pasarAEscenaEscritorio) #también nos conectamos a la escena "Sentarse" del escritorio objeto, el cual nos hace cambiar de escena.
	interfaces = get_tree().get_nodes_in_group("Interfaz")	#Tomamos a los objetos de interfaz como
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _pasarAEscenaEscritorio():	#Tomamos al árbol de nodos actual, le añadimos la escena nueva y quitamos la actual, también le pasamos al inventario para que se lo quede.
	var arbolActual = get_tree()
	var escenaActual = arbolActual.get_current_scene()
	arbolActual.get_root().add_child(escenaEscritorio)
	escenaEscritorio.add_to_group("Escenas", true) #Añadimos al a escena escritorio al grupo de las escenas para que pueda reaccionar al game over y a la victoria.
	arbolActual.get_root().remove_child(escenaActual)
	arbolActual.set_current_scene(escenaEscritorio)
	for each in interfaces:
		self.remove_child(each)
		arbolActual.get_root().add_child(each)
	escenaEscritorio.chequearCliente()
	
func _volverAEscenaPrincipal():	#Hacemos lo mismo, excepto que ahora quitamos la escena actual y volvemos a la escena original.
	var arbolActual = Engine.get_main_loop()
	var escenaActual = arbolActual.get_current_scene()
	arbolActual.get_root().add_child(self)
	for each in interfaces:
		arbolActual.get_root().remove_child(each)
		self.add_child(each)	
	arbolActual.get_root().remove_child(escenaActual)
	arbolActual.set_current_scene(self)


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("npc"):
		Global.Cliente_en_escritorio = true
		print("true")

func victoria():
	$TemporizadorPuerta.stop()	#El temporizador de victoria sobreescribe al de la derrota, por ende lo detiene.
	var arbolActual = get_tree()
	var escenaActual = arbolActual.get_current_scene()
	arbolActual.get_root().add_child(escenaVictoria)
	arbolActual.get_root().remove_child(escenaActual)
	arbolActual.set_current_scene(escenaVictoria)

func derrota(mensaje: String):
	var arbolActual = get_tree()
	var escenaActual = arbolActual.get_current_scene()
	escenaDerrota.mensaje = mensaje
	arbolActual.get_root().add_child(escenaDerrota)
	arbolActual.get_root().remove_child(escenaActual)
	arbolActual.set_current_scene(escenaDerrota)
