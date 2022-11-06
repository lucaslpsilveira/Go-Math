extends Node2D

onready var c = $C
var player_encostando = false

func _ready():
	remove_child(c)
		
	
func _on_Numero_area_exited(area):
		remove_child(c)		
		player_encostando = false

func _on_Numero_area_entered(area):
		add_child(c)
		player_encostando = true
