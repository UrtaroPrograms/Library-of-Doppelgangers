extends Control

@onready var barra = $VBoxContainer/ProgressBar
@onready var timer = $TemporizadorPuerta
var duracion = 30	#Esta es la variable para cambiar el tiempo que toma la barra en vaciarse, es una variable para mantener el porcentaje de la barra consistente al reparar la puerta. Default = 30

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	barra.value = 100
	timer.wait_time = duracion
	timer.start()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float):
	var integridadRestante = ((timer.time_left) * 100)/duracion  	#Aplicamos la regla de 3 simple para conseguir un porcentaje que usar para la integridad de la puerta. Lo bueno de esto es que no hay que cambiar el código si cambiamos el valor de la puerta.
	barra.value = integridadRestante
	
func reparar(valor: int):
	if(timer.time_left > duracion):	#Si el valor de durabilidad de la puerta es mayor al que viene por defecto, lo ignoramos.
		return
	var nuevaDuracion = timer.time_left + valor
	if(nuevaDuracion > duracion):	#Si la nueva duracion es mayor a la original, reducimos su valor, de este modo no se puede "sobrecargar" el timer.
		nuevaDuracion = duracion
	timer.start(nuevaDuracion) #Al "reparar" la puerta, reiniciamos el timer, añadiendo el tiempo restante al valor de "reparación"

func reparacion_avanzada(valor: int):	#Lo mismo que la función de reparar, tan solo que en vez de limitar la reparación al valor original, ahora lo sobreescribe.
	var nuevaDuracion = timer.time_left + valor
	timer.start(nuevaDuracion) #Al "reparar" la puerta, reiniciamos el timer, añadiendo el tiempo restante al valor de "reparación"


func _on_temporizador_puerta_timeout():
	get_tree().call_group("Escenas","derrota", "Asegurate de mantener en buen estado la puerta trasera.")	#Al acabarse el temporizador, enviamos un mensaje al grupo de "Escenas" para que ejecuten el método de derrota. Esto permitirá que cada una ejecute su lógica de distinto modo. (por ejemplo, con una animación distinta)
	
