extends Node2D

const WAYSTATION = preload("res://scenes/waystation.tscn")
@onready var submersible: RigidBody2D = $Submersible

func _ready() -> void:
	for position in GameManager.get_waystations():
		var station = init_waystation(position)
		station.connect("waystation_transfer", energise_submersible)

func _on_submersible_deploy_waystation(position: Vector2) -> void:
	init_waystation(position)
	submersible.sleeping = false
	
func init_waystation(position:Vector2) -> Area2D:
	var station = WAYSTATION.instantiate()
	add_child(station)
	station.global_position = position
	return station

func energise_submersible(energy:float):
	submersible.energise_from_waystation(energy)
