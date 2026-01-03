extends State

class_name PlayerRunState
@export var animation_player: AnimationPlayer
@export var player: CharacterBody3D

func _init() -> void:
	self.type = State.Type.RUN

func physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("parry"):
		state_machine.change_state(State.Type.PARRY, {})
		
	if Input.is_action_just_pressed("attack"):
		state_machine.change_state(State.Type.ATTACK, {})
	if is_zero_approx(player.velocity.length()):
		state_machine.change_state(State.Type.IDLE, {})
	
func enter(metadata: Dictionary[Variant, Variant]):
	animation_player.play("Run", 0.2)
