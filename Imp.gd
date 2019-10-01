extends StaticBody2D

signal shoot

export (PackedScene) var Bullet

var can_shoot = true

func _ready():
	add_to_group("turrets")

func shoot():
	var dir = Vector2(1, 0).rotated(global_rotation)
	emit_signal("shoot", Bullet, $Position2D.global_position, dir)
		

func _on_AnimatedSprite_frame_changed():
	if $AnimatedSprite.animation == "attack" and $AnimatedSprite.frame == 3:
		shoot()		
