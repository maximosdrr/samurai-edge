extends Label3D

@onready var player: CharacterBody3D = $"../.."
@onready var camera_pivot: CameraPivot = $".."
@onready var camera: Camera3D = $"../Camera"

func _ready() -> void:
	pass


func _process(_delta: float) -> void:
	var _text = "Current State: %s\nPrevious State: %s" % [
		player.state_machine.current.name,
		player.state_machine.previous.name,
	]
	text = _text
