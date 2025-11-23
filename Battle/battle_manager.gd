extends Node

var aira: CharacterBattle
var isi: CharacterBattle

@onready var enemy_hp_label: Label = $"../ColorRect/MarginContainer/BattleDisplay/EnemyInfo/EnemyHPLabel"
@onready var battle_log_label: Label = $"../ColorRect/MarginContainer/BattleDisplay/ActionZone/BattleArea/ActionInfo/AttackHistory1"
@onready var active_char_position: Marker2D = $"../ActiveCharPosition"
@onready var enemy_char_position: Marker2D = $"../EnemyCharPosition"


func _ready():
	# Create characters
	aira = CharacterBattle.new("Aira", 100, 10)
	isi = CharacterBattle.new("Isi", 100, 20)
	
	update_ui()
	
		# Print to check
	print("%s has %d HP and %d Attack" % [aira.name, aira.hp, aira.attack])
	print("%s has %d HP and %d Attack" % [isi.name, isi.hp, isi.attack])
	
func update_ui():
		enemy_hp_label.text = "HP: %d" % isi.hp


func _on_normal_attack_pressed():
	aira.deal_damage(isi)
	battle_log_label.text = "Aira used Dinner Knife for %d damage!" % aira.attack
	update_ui()
	play_normal_attack_animation()
	
func play_normal_attack_animation():
	var normal_attack_scene = preload("res://Battle/normal_attack.tscn")
	var normal_attack = normal_attack_scene.instantiate()
	add_child(normal_attack)
	normal_attack.throw(active_char_position.global_position, enemy_char_position.global_position)
