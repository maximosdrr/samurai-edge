extends CharacterBody3D

var status = PlayerStatus.new()

@export var camera_pivot: CameraPivot
@export var model: Node3D

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y -= Constants.GRAVITY * delta
	else:
		velocity.y = 0

	var input_dir := Input.get_vector("move_right", "move_left", "move_backward", "move_forward")

	var _basis := camera_pivot.basis.orthonormalized()
	var direction := (_basis * Vector3(-input_dir.x, 0, -input_dir.y)).normalized()
	
	if direction != Vector3.ZERO:
		velocity.x = direction.x * status.speed
		velocity.z = direction.z * status.speed
	else:
		velocity.x = move_toward(velocity.x, 0, status.speed * delta)
		velocity.z = move_toward(velocity.z, 0, status.speed * delta)

	move_and_slide()

func _process(_delta: float) -> void:
	model.global_rotation.y = camera_pivot.global_rotation.y + camera_pivot.BASE_YAW
