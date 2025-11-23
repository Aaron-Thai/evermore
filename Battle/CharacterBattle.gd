# CharacterBattle.gd
extends RefCounted
class_name CharacterBattle

var name: String
var max_hp: int
var hp: int
var attack: int

func _init(_name: String = "Unnamed", _max_hp: int = 100, _attack: int = 10):
	name = _name
	max_hp = _max_hp
	hp = max_hp
	attack = _attack

func take_damage(amount: int):
	hp = clamp(hp - amount, 0, max_hp)

func deal_damage(target: CharacterBattle):
	target.take_damage(attack)

func is_dead() -> bool:
	return hp <= 0
