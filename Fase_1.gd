extends Node

onready var player = get_node("Player")
onready var numero3 = get_node("Numero3")
onready var numero5 = get_node("Numero5")
onready var numero = get_node("HUD/Numero")
onready var mensagem = get_node("HUD/Mensagem")

func _physics_process(delta):
	if Input.is_action_pressed("c"):
		if(numero3.player_encostando):
			player.arrayNumeros.append(3)
			numero.text = "3"
			remove_child(numero3)	
		elif(numero5.player_encostando):
			player.arrayNumeros.append(5)
			numero.text = "5"
			remove_child(numero5)
			
	if(player.arrayNumeros.size() > 0):
		if(player.arrayNumeros[0] + 5 == 8):
			mensagem.text = "Acertou"
		else:
			mensagem.text = "Errou"
