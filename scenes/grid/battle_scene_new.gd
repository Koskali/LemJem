extends Node2D

@onready var bullets: Node2D = $PlayerBullets
@onready var player: Area2D = $PlayerBattle
@onready var enemy: Area2D = $EnemyBattle
@onready var projectile_script = $PlayerBullets

var projectile = preload("res://scenes/grid/projectile.tscn")


func _ready() -> void:
	$TimerPlayer.start()

func _on_timer_player_timeout() -> void:
	$TimerEnemy.start()
	# Tworzenie pocisku
	var new_projectile = projectile.instantiate()
	bullets.add_child(new_projectile)
	
	# Ustawianie początkowej pozycji pocisku na pozycji gracza
	new_projectile.position = player.position


func _on_timer_enemy_timeout() -> void:
	if Global.enemy_dead == false:
		enemy.change_enemy_position()
		enemy.spawn_enemy_projectile()

func spawn_projectile():
	pass
