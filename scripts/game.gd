extends Node2D

const WAYSTATION = preload("res://scenes/waystation.tscn")
@onready var submersible: RigidBody2D = $Submersible

func _ready() -> void:
	for station_position in GameManager.get_waystations():
		var station = init_waystation(station_position)
		station.connect("waystation_transfer", energise_submersible)

func _on_submersible_deploy_waystation(station_position: Vector2) -> void:
	init_waystation(station_position)
	submersible.sleeping = false
	
func init_waystation(station_position:Vector2) -> Area2D:
	var station = WAYSTATION.instantiate()
	add_child(station)
	station.global_position = station_position
	return station

func energise_submersible(energy:float):
	submersible.energise_from_waystation(energy)


func _on_alien_encounter_area_body_entered(_body: Node2D) -> void:
	GameManager.encountered_aliens = true
