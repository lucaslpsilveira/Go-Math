extends Node

onready var player = get_node("Player")
onready var numero5 = get_node("Numero5")
onready var numero7 = get_node("Numero7")
onready var numero8 = get_node("Numero8")
onready var numero9 = get_node("Numero9")
onready var numero = get_node("HUD/Resultado")

func _ready():
	get_tree().paused = false
	$Musica.play()

func _physics_process(delta):
	if Input.is_action_pressed("c"):
		if(numero5.player_encostando):
			player.arrayNumeros.append(5)
			numero.text = "5"
			remove_child(numero5)	
		elif(numero7.player_encostando):
			player.arrayNumeros.append(7)
			numero.text = "7"
			remove_child(numero7)
		elif(numero8.player_encostando):
			player.arrayNumeros.append(8)
			numero.text = "8"
			remove_child(numero8)
		elif(numero9.player_encostando):
			player.arrayNumeros.append(9)
			numero.text = "9"
			remove_child(numero9)
			
	if(player.arrayNumeros.size() > 0):
		if(player.arrayNumeros[0] == 8):
			$Acertou.play()
			$Acertou.pause_mode = Node.PAUSE_MODE_PROCESS
			$menu._acertou()			
		else:
			$Errou.play()
			$Errou.pause_mode = Node.PAUSE_MODE_PROCESS
			$menu._errou()
			
