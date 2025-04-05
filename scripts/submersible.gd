extends RigidBody2D

const VERTICAL_THRUST = Vector2(0, -80.0)
const HORIZONTAL_THRUST = Vector2(160, 0)

signal energy_update(energy:float)
var contact_loss := 20.0
var energy := 100.0

func _integrate_forces(state):
	if Input.is_action_pressed("thrust_up"):
		state.apply_force(VERTICAL_THRUST)
	var horizontal_direction = Input.get_axis("thrust_left", "thrust_right")
	if (horizontal_direction):
		state.apply_force(HORIZONTAL_THRUST * horizontal_direction)


func _on_body_shape_entered(body_rid: RID, body: Node, body_shape_index: int, local_shape_index: int) -> void:
	energy -= contact_loss
	print(energy)
	emit_signal("energy_update", energy)
	if energy <= 0:
		print("Back to the mothership!")
