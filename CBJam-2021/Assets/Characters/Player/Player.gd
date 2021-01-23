extends KinematicBody2D

const walk_speed = 180
const gravity = 30
const jump = -900

var velocity = Vector2(0,0)

func _physics_process(delta):
	if Input.is_action_pressed("player_right"):
		velocity.x = walk_speed
		$Sprite.play("Walking")
		$Sprite.flip_h = false
	elif Input.is_action_pressed("player_left"):
		velocity.x = -walk_speed
		$Sprite.play("Walking")
		$Sprite.flip_h = true
	else:
		$Sprite.play("Standing")
	
	if not is_on_floor():
		$Sprite.play("Jumping")
	
	velocity.y = velocity.y + gravity
	
	if Input.is_action_just_pressed("player_jump") and is_on_floor():
		velocity.y = jump
		$SoundJump.play()	
	
	velocity = move_and_slide(velocity,Vector2.UP)
	velocity.x = lerp(velocity.x,0,0.2)


func _on_FallZone_body_entered(body):
	get_tree().change_scene("res://Assets/Menus/YouLooseScreen.tscn")

func bounce():
	velocity.y = jump * .5

func ouch(var posx):
	$SoundDie.play()
	set_modulate(Color(1,.3,.3,.5))
	if position.x < posx:
		velocity.x = -800
		velocity.y = jump * .25
	else:
		velocity.x = 800
		velocity.y = jump * .25
		
	Input.action_release("player_left")
	Input.action_release("player_right")
	$Timer.start(2)
	

func _on_Timer_timeout():
	
	get_tree().change_scene("res://Assets/Menus/YouLooseScreen.tscn")	
