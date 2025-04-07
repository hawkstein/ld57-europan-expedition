extends Node2D

const WAYSTATION = preload("res://scenes/waystation.tscn")
@onready var submersible: RigidBody2D = $Submersible

func _ready() -> void:
	for station_position in GameManager.get_waystations():
		var station = init_waystation(station_position)
		station.connect("waystation_transfer", energise_submersible)
	if GameManager.player_ore >= 50:
		GameManager.purchase_station()
		submersible.enable_waystation()

func _on_submersible_deploy_waystation(station_position: Vector2) -> void:
	init_waystation(station_position)
	submersible.sleeping = false
	
func init_waystation(station_position:Vector2) -> Area2D:
	var station = WAYSTATION.instantiate()
	add_child(station)
	station.global_position = snapped(station_position, Vector2(1,1))
	return station

func energise_submersible(energy:float):
	submersible.energise_from_waystation(energy)


func _on_alien_encounter_area_body_entered(_body: Node2D) -> void:
	GameManager.encountered_aliens = true

@onready var final_timer: Timer = $FinalEncounterArea/FinalTimer
@onready var scene_change_timer: Timer = $FinalEncounterArea/SceneChangeTimer

func _on_final_encounter_body_entered(_body: Node2D) -> void:
	print("final encounter started")
	final_timer.start()
	submersible.make_uncontrollable()

const FINAL = preload("res://scenes/final.tscn")

func _on_final_timer_timeout() -> void:
	print("scene encounter started")
	submersible.keep_asleep = true
	submersible.sleeping = true
	scene_change_timer.start()

func _on_scene_change_timer_timeout() -> void:
	get_tree().change_scene_to_packed(FINAL)
