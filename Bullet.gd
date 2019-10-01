extends Area2D

var speed = 100
var damage = 1

var velocity = Vector2()

func start(_position, _direction):
	position = _position
	rotation = _direction.angle()
	velocity = _direction * speed
	
func _process(delta):
	position += velocity * delta

func _on_Bullet_body_entered(body):
	if body.has_method('hit'):
		#queue_free()
		body.hit(damage)

#	elif body.has_method('bullet_collide'):
#		queue_free()

	queue_free()

func _on_LifeTime_timeout():
	queue_free()

