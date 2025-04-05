extends Node2D

var waystations := Array([], TYPE_VECTOR2, "", null)
var player_ore := 50
	
func get_intro() -> String:
	return "Here's your interlude intro!"
	
func add_waystation(station_position:Vector2) -> void:
	waystations.append(station_position)
	
func get_waystations():
	return waystations

func collect_ore():
	player_ore += 10
