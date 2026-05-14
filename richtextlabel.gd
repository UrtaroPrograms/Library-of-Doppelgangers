extends RichTextLabel

var velocidad = 0.03

func _ready():

	text = "una noche mas, para [wave]MORIR[/wave] otro dia."

	visible_characters = 0

	mostrar_texto()

func mostrar_texto():

	for i in text.length():

		visible_characters += 1

		await get_tree().create_timer(velocidad).timeout
