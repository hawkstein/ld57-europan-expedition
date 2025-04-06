extends RigidBody2D

const VERTICAL_THRUST = Vector2(0, 40.0)
const HORIZONTAL_THRUST = Vector2(100, 0)

signal energy_update(energy:float)
var tick_loss := 1
var contact_loss := 10.0
var energy := 40.0
var max_energy := 40

signal deploy_waystation(position)
var can_deploy := true
var deploy_mode := false
@onready var waystation: Sprite2D = $Waystation

func remove_energy(amount:float) -> void:
	energy -= amount
	emit_signal("energy_update", energy)
	if energy <= 0:
		get_tree().change_scene_to_file("res://scenes/interlude.tscn")

func _process(delta: float) -> void:
	remove_energy(tick_loss * delta)
	if can_deploy and Input.is_action_just_pressed("deploy_waystation"):
		deploy_mode = !deploy_mode

func _integrate_forces(state):
	var vertical_direction = Input.get_axis("thrust_up", "thrust_down")
	if vertical_direction:
		state.apply_force(VERTICAL_THRUST * vertical_direction)
	var horizontal_direction = Input.get_axis("thrust_left", "thrust_right")
	if horizontal_direction:
		state.apply_force(HORIZONTAL_THRUST * horizontal_direction)


func _on_body_shape_entered(_body_rid: RID, _body: Node, _body_shape_index: int, _local_shape_index: int) -> void:
	remove_energy(contact_loss)


func _on_area_2d_body_entered(_body: Node2D) -> void:
	if deploy_mode:
		waystation.visible = false
		can_deploy = false
		deploy_mode = false
		GameManager.add_waystation(global_position)
		energise_from_waystation(max_energy)
		sleeping = true
		emit_signal("deploy_waystation", global_position)
		
func energise_from_waystation(amount:float) -> void:
	energy = minf(energy + amount, max_energy)
