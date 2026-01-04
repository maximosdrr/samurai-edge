class_name __DevChangeWeapon extends Node


const BLACK_KATANA = preload("uid://bic0nfh58qobo")
const FIRE_KATANA = preload("uid://cnef1thnt341o")

@onready var weapon_controller: WeaponController = $"../WeaponController"


func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("change_weapon_1"):
		weapon_controller.swap_weapon(BLACK_KATANA)
	if Input.is_action_just_pressed("chande_weapon_2"):
		weapon_controller.swap_weapon(FIRE_KATANA)
