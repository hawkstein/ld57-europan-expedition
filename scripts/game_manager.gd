extends Node2D

var waystations := Array([], TYPE_VECTOR2, "", null)
	
func get_intro() -> String:
	return "Here's your interlude intro!"
	
func add_waystation(position:Vector2) -> void:
	waystations.append(position)
	
func get_waystations():
	return waystations
