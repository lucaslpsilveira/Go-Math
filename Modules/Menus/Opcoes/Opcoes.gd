extends Control


func _ready():
	get_tree().paused = false
	$Sair.grab_focus()
	$Musica.play()


func _on_Sair_pressed():
	get_tree().change_scene("res://Modules/Menus/MenuPrincipal/Menu.tscn")
