extends KinematicBody2D

signal enemy_killed

var velocity = Vector2()
var move_speed = 50

export var direction = -1
export var detects_clifs = true

func _ready():
	if direction == 1:
		$AnimatedSprite.flip_h = false
	$FloorChecker.position.x = ($CollisionShape2D.shape.get_extents().x + 1) * direction
	$FloorChecker.enabled = detects_clifs

func _physics_process(delta):

	if is_on_wall() or not $FloorChecker.is_colliding() and detects_clifs and is_on_floor():
		direction = direction * -1
		$AnimatedSprite.flip_h = not $AnimatedSprite.flip_h
		$FloorChecker.position.x = ($CollisionShape2D.shape.get_extents().x + 1) * direction
		
	velocity.y = velocity.y + move_speed
	velocity.x = move_speed * direction
	
	velocity = move_and_slide(velocity,Vector2.UP)

func _on_TopCheck_body_entered(body):
	emit_signal("enemy_killed")
	$SoundStomp.play()
	$AnimatedSprite.play("Killed")
	move_speed = 0
	set_collision_layer_bit(4,false)
	set_collision_mask_bit(0,false)
	$TopCheck.set_collision_layer_bit(4,false)
	$TopCheck.set_collision_mask_bit(0,false)
	$SideChecker.set_collision_mask_bit(0,false)
	$SideChecker.set_collision_layer_bit(4,false)
	$Timer.start()
	body.bounce()

func _on_Side_Checker_body_entered(body):
	print($name)
	body.ouch(position.x)

func _on_Timer_timeout():
	queue_free()
