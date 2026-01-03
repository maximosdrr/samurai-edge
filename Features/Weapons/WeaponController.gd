@tool

class_name WeaponController extends Node
var _weapon_resource: Weapon

@export var weapon_resource: Weapon:
	get: return _weapon_resource
	set(value):
		_weapon_resource = value
		if Engine.is_editor_hint():
			call_deferred("spawn_weapon")

@export var model_parent: Node3D
var current_model: Node3D

func _ready():
	if weapon_resource:
		spawn_weapon()

func spawn_weapon():
	if current_model:
		current_model.queue_free()
	
	if weapon_resource.model:
		current_model = weapon_resource.model.instantiate()
		model_parent.add_child(current_model)
		
		if Engine.is_editor_hint():
			current_model.owner = get_tree().edited_scene_root
		#P,S,R
		print(weapon_resource.rotation)
		current_model.position = weapon_resource.position
		current_model.rotation_degrees = weapon_resource.rotation
		current_model.scale = weapon_resource.scale
