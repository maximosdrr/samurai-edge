@tool

class_name WeaponController extends Node

@export var weapon_resource: Weapon:
	get: return _weapon_resource
	set(value):
		_weapon_resource = value
		if Engine.is_editor_hint():
			call_deferred("spawn_weapon")
@export var model_parent: Node3D
@export var state_machine: StateMachine

var _weapon_resource: Weapon
var current_model: Node3D
var current_weapon_hitbox: Area3D

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
		
		#P, R, S
		current_model.position = weapon_resource.position
		current_model.rotation_degrees = weapon_resource.rotation
		current_model.scale = weapon_resource.scale
		
		#Connect new signal
		_load_hitbox()

func swap_weapon(new_weapon_resource: Weapon):
	weapon_resource = new_weapon_resource
	spawn_weapon()
	
func _load_hitbox():
	for child in current_model.get_children():
		if child is Area3D and child.name == "Hitbox":
			current_weapon_hitbox = child
	
	if current_weapon_hitbox == null:
		push_error("This weapon has no hitbox!")
		return
	
	if not current_weapon_hitbox.body_entered.is_connected(_detect_hit):
		current_weapon_hitbox.body_entered.connect(_detect_hit)

func _process(_delta: float) -> void:
	if state_machine.current.type == State.Type.ATTACK:
		current_weapon_hitbox.monitoring = true
	else:
		current_weapon_hitbox.monitoring = false

func _detect_hit(body: Node3D):
	print(body)
