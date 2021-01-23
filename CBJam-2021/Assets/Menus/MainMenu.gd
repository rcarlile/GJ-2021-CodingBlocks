extends Control


func _ready():
	$MusicMain.play()


func _on_PlayButton_pressed():
	get_tree().change_scene("res://Assets/Levels/Level1/Level1.tscn")


func _on_ExitButton_pressed():
	get_tree().quit()


func _on_Credits_pressed():
	get_tree().change_scene("res://Assets/Menus/Credits.tscn")
