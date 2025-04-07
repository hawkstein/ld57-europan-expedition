extends Control

@onready var day: Label = $VBoxContainer/Day
@onready var intro: Label = $VBoxContainer/Intro
@onready var message: Label = $VBoxContainer/Message
@onready var button_one: Button = $VBoxContainer/ButtonOne
@onready var button_two: Button = $VBoxContainer/ButtonTwo

func _ready() -> void:
	day.text = GameManager.get_day()
	intro.text = GameManager.get_intro()
	message.text =GameManager.get_message()
	var buttons = GameManager.get_buttons()
	button_one.text = buttons[0]
	if (buttons[1]):
		button_two.text = buttons[1]
	else:
		button_two.visible = false

func _on_continue_pressed() -> void:
	GameManager.next_day()
