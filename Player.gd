extends KinematicBody2D

var speed = 200
var key = false
var life = 6

var velocity = Vector2()

func get_input():
	velocity = Vector2.ZERO
	
	if Input.is_action_pressed('ui_right'):
		velocity.x += 1
		$AnimatedSprite.flip_h = false
		
	if Input.is_action_pressed('ui_left'):
		velocity.x -= 1
		$AnimatedSprite.flip_h = true
		
	if Input.is_action_pressed('ui_down'):
		velocity.y += 1
		
	if Input.is_action_pressed('ui_up'):
		velocity.y -= 1
		

	velocity = velocity.normalized() * speed


func _physics_process(delta):

	get_input()
	

	if velocity.y == -200:
		if $AnimatedSprite.animation != 'verticalWalk':
			$AnimatedSprite.animation = 'verticalWalk' 
	
	elif velocity.x != 0 or velocity.y != 0:
		if $AnimatedSprite.animation != 'horizontalWalk':
			$AnimatedSprite.animation = 'horizontalWalk'
	
	else:
		if $AnimatedSprite.animation != 'idle':
			$AnimatedSprite.animation = 'idle'
	
	velocity = move_and_slide(velocity)
	

func hit(damage):
	life -= damage
	
	if life == 0:
		end()

func end():
	get_tree().reload_current_scene()
	
func get_key():
	pass
	
	
	
	
	
	
	
	
	
	
	
	