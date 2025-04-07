extends Control

@onready var day: Label = $VBoxContainer/Day
@onready var intro: Label = $VBoxContainer/Intro
@onready var message: Label = $VBoxContainer/Message
@onready var button_one: Button = $VBoxContainer/ButtonOne
@onready var button_two: Button = $VBoxContainer/ButtonTwo
const RETURN_TO_EARTH = preload("res://scenes/return_to_earth.tscn")

var buttons

func _ready() -> void:
	day.text = GameManager.get_day()
	intro.text = GameManager.get_intro()
	message.text =GameManager.get_message()
	buttons = GameManager.get_buttons()
	button_one.text = buttons[0].label
	if (buttons[1]):
		button_two.text = buttons[1].label
	else:
		button_two.visible = false

func _on_continue_pressed() -> void:
	if buttons[0].action == "continue":
		GameManager.next_day()
	elif buttons[0].action == "return":
		get_tree().change_scene_to_packed(RETURN_TO_EARTH)
		


func _on_button_two_pressed() -> void:
	if buttons[1].action == "continue":
		GameManager.next_day()
	elif buttons[1].action == "return":
		get_tree().change_scene_to_packed(RETURN_TO_EARTH)
