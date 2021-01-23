extends CanvasLayer

var coins = 0
var coins_win = 25
var score = 0


func _ready():
	$CoinsCount.text = String(coins)
	$ScoreCount.text = String(score)

func _physics_process(delta):
	if coins == coins_win:
		get_tree().change_scene("res://Assets/Menus/YouWin.tscn")

func _on_coin_collected():
	coins = coins + 1
	_ready()



func _on_Ghost_enemy_killed():
	score = score + 25
	_ready()


func _on_Ghost_enemy_killedd():
	pass # Replace with function body.
