extends State

class_name PlayerAttackState

@export var animation_player: AnimationPlayer
@export var player: CharacterBody3D
@export var attack_duration = 1.0

var attack_timer = 0.0

func _init() -> void:
	self.type = State.Type.ATTACK

func physics_process(delta: float) -> void:
	attack_timer -= delta
	
	if attack_timer > 0:
		return
	
	var previous_state = _get_previous_state()
	state_machine.change_state(previous_state, {})
	
func enter(_metadata: Dictionary[Variant, Variant]):
	var animation = _get_animation_by_previous_state()
	animation_player.play(animation, 0.2)
	attack_timer = attack_duration

func _get_previous_state():
	match state_machine.previous.type:
		State.Type.IDLE:
			return State.Type.IDLE
		State.Type.RUN:
			return State.Type.RUN
		_:
			return State.Type.IDLE

func _get_animation_by_previous_state():
	match state_machine.previous.type:
		State.Type.IDLE:
			return "Attack_Idle_01"
		State.Type.RUN:
			return "Attack_Run_01"
		_:
			return "Attack_Idle_01"
