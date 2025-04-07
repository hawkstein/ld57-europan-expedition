extends Node2D

var waystations := Array([], TYPE_VECTOR2, "", null)
var player_ore := 50
var day := 1
var day_limit = 5
var encountered_aliens : = false
var connection_collapsed : = false
var ruins_discovered := false

#const FORGE = preload("res://scenes/forge.tscn")
const GAME = preload("res://scenes/game.tscn")

func get_day() -> String:
	if not connection_collapsed:
		return "Day {0} of {1}".format([day, day_limit])
	return "Day {0} of ?".format([day])

func get_intro() -> String:
	if connection_collapsed:
		return "The connection to the surface has collapsed."
	match day:
		1:
			return "The connection to the surface remains stable. We estimate 4 days until collapse."
		5:
			if not encountered_aliens:
				return "The connection to the surface will collapse within hours. We must escape."
			return "The connection to the surface will collapse within hours. We are faced with a choice. Any discoveries can be transmitted even if we can no longer return."
		_:
			return "The structural integrity of the surface connection continues to fail. We estimate {0} days until collapse.".format([day_limit - day])

func get_message() -> String:
	const alien_msg = "We have encountered alien life! It is does not seem intelligent or hostile."
	if ruins_discovered:
		"These alien ruins... the life we've encountered so far has not seemed intelligent."
	if connection_collapsed:
		return "The exploration continues."
	match day:
		1:
			if encountered_aliens:
				return alien_msg
			return "The tunnel seems to have been connected to Europa's inner ocean but there are no clues to why it is not frozen."
		5:
			if not encountered_aliens:
				return "There are deeper mysteries here but others will have to solve them."
			return "Shall we escape or is solving this puzzle worth our lives?"
		_:
			if not encountered_aliens:
				return "This tunnel's origin remains a mystery. We must explore the depths."
			return alien_msg
	
func get_buttons() -> Array:
	if day < 5:
		return ["Continue exploring", null]
	if not encountered_aliens:
		return ["Return to Earth", null]
	if not connection_collapsed:
		return ["There's no turning back", "Return to Earth"]
	return ["Continue exploring", null]

func add_waystation(station_position:Vector2) -> void:
	waystations.append(station_position)
	
func get_waystations():
	return waystations

func collect_ore():
	player_ore += 10
	
func next_day():
	day += 1
	if (day > 5):
		connection_collapsed = true
	get_tree().change_scene_to_packed(GAME)
