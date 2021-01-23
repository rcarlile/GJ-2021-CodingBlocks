extends Timer


func _ready():
	pass


func _on_Timer_timeout():
	get_tree().change_scene("res://Assets/Menus/MainMenu.tscn")
