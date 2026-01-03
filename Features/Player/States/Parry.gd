extends State

class_name PlayerParryState

@export var animation_player: AnimationPlayer
@export var player: CharacterBody3D
@export var parry_duration = 0.8

var parry_timer = 0.0

func _init() -> void:
	self.type = State.Type.PARRY

func physics_process(delta: float) -> void:
	parry_timer -= delta
	
	if parry_timer > 0:
		return
	
	var previous_state = _get_previous_state()
	state_machine.change_state(previous_state, {})
	
func enter(_metadata: Dictionary[Variant, Variant]):
	animation_player.play("Parry_01", 0.2)
	parry_timer = parry_duration

func _get_previous_state():
	match state_machine.previous.type:
		State.Type.IDLE:
			return State.Type.IDLE
		State.Type.RUN:
			return State.Type.RUN
		_:
			return State.Type.IDLE
