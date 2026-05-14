extends CanvasLayer

var dialog_lines = []
var current_line = 0

@onready var panel = $Panel
@onready var label = $Panel/Label

func _ready():
	panel.visible = false

func start_dialog(lines):

	dialog_lines = lines
	current_line = 0

	panel.visible = true
	label.text = dialog_lines[current_line]

func _process(delta):

	if panel.visible and Input.is_action_just_pressed("ui_accept"):

		current_line += 1

		if current_line >= dialog_lines.size():
			panel.visible = false
		else:
			label.text = dialog_lines[current_line]
