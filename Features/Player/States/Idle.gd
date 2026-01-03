extends State

class_name PlayerIdleState
@export var animation_player: AnimationPlayer

func _init() -> void:
	self.type = State.Type.IDLE

func physics_process(delta: float) -> void:
	pass
	
func enter(metadata: Dictionary[Variant, Variant]):
	animation_player.play("Idle")
