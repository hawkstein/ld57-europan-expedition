extends Area2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer

@export var ore_id := 0

func _ready() -> void:
	var id = ore_id
	if id == 0:
		var path = get_parent().get_path_to(self)
		var index = str(path).substr(3)
		ore_id = int(index)

func _on_body_entered(_body: Node2D) -> void:
	GameManager.collect_ore(ore_id)
	animation_player.play("pickup")
