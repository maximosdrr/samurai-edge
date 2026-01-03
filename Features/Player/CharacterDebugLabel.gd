extends Label3D

@onready var player: CharacterBody3D = $"../.."
@onready var camera_pivot: CameraPivot = $".."
@onready var camera: Camera3D = $"../Camera"

func _ready() -> void:
	pass


func _process(_delta: float) -> void:
	var _text = "Pivot Rotation: %s" % [deg_to_rad(camera_pivot.rotation.y)]
	text = _text
