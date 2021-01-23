extends Area2D

signal coin_collected
	

func _ready():
	pass

func _on_Coin_body_entered(body):
	set_collision_mask_bit(0,false)
	emit_signal("coin_collected")
	$AnimationPlayer.play("Bounce")
	$SoundCoin.play()
	

func _on_AnimationPlayer_animation_finished(anim_name):
	queue_free()


func _on_coin_collected():
	pass # Replace with function body.
