extends Control
@onready var ore_total: Label = $OreTotal

const GAME = preload("res://scenes/game.tscn")

func _ready() -> void:
	ore_total.text = str("Refined Ore: ", GameManager.player_ore)

func _on_dive_button_pressed() -> void:
	get_tree().change_scene_to_packed(GAME)
