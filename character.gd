# Character.gd
extends Node2D
class_name Character

signal died(character)

@export var sprite_texture: Texture2D
@export var display_name: String = "Actor"
@export var max_hp: int = 100
@export var max_mp: int = 10
@export var strength: int = 10
@export var defense: int = 5
@export var speed: int = 10 # optional for future ordering

var hp: int
var mp: int
var is_player: bool = true

func _ready():
	if $Sprite2D:
		$Sprite2D.texture = sprite_texture
	hp = max_hp
	mp = max_mp

func is_alive() -> bool:
	return hp > 0

func take_damage(amount: int) -> int:
	var dmg = max(1, amount - defense) # at least 1
	hp = max(0, hp - dmg)
	if hp == 0:
		emit_signal("died", self)
	return dmg

func heal(amount: int) -> int:
	var before = hp
	hp = min(max_hp, hp + amount)
	return hp - before

# Simple ability: attack target
func attack(target: Character) -> Dictionary:
	if not is_alive():
		return {"success": false, "reason": "dead"}
	var dmg = strength
	var done = target.take_damage(dmg)
	return {"success": true, "type": "attack", "damage": done, "target": target}
