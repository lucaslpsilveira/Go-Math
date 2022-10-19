extends Node

onready var numero = get_node("Numero")

func _physics_process(delta):
	if(numero.player_encostando):
		if Input.is_action_pressed("c"):
			remove_child(numero)
