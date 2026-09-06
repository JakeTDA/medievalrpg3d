class_name Limb
extends Node

signal limb_crippled(limb_id)
signal limb_loss(limb_id)

@export var limbs_maxhp = {
	"head": 50.0,
	"torso": 100.0,
	"left_arm": 50.0,
	"right_arm": 50.0,
	"left_leg": 60.0,
	"right_leg": 60.0
}

var limbs_currenthp = {}

func _ready():
	for id in limbs_maxhp:
		limbs_currenthp[id] = limbs_maxhp[id]
	
func damage_limb(damage,limb_id):
	if limb_id in limbs_currenthp:	
		limbs_currenthp[limb_id] -= damage
	else:
		print("L")
	check_limb(limb_id)

func check_limb(limb_id):
	if limbs_currenthp[limb_id] <= 20:
		limb_crippled.emit(limb_id)
	elif limbs_currenthp[limb_id] <= 0:
		limb_loss.emit(limb_id)
