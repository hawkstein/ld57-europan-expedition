extends Control

@onready var intro: Label = $VBoxContainer/Intro
const FORGE = preload("res://scenes/forge.tscn")

func _ready() -> void:
	intro.text = GameManager.get_intro()


func _on_continue_pressed() -> void:
	get_tree().change_scene_to_packed(FORGE)
