extends Node

onready var player = get_node("Player")
onready var numero0 = get_node("Numero0")
onready var numero2 = get_node("Numero2")
onready var numero4 = get_node("Numero4")
onready var numero8 = get_node("Numero8")
onready var resultado = get_node("HUD/Resultado")
onready var resultado2 = get_node("HUD/Resultado2")
onready var textoTopo = get_node("HUD/topo/textoTopo")
onready var proximaFase = "res://Fases/Fase_9/Fase_9.tscn"

func _ready():
	textoTopo.text = "nível 8"
	get_tree().paused = false
	$Musica.play()

func _physics_process(delta):
	if Input.is_action_pressed("c"):
		if(numero0.player_encostando):
			player.arrayNumeros.append(0)
			remove_child(numero0)	
		elif(numero2.player_encostando):
			player.arrayNumeros.append(2)
			remove_child(numero2)
		elif(numero4.player_encostando):
			remove_child(numero4)
			player.arrayNumeros.append(4)
		elif(numero8.player_encostando):
			player.arrayNumeros.append(8)			
			remove_child(numero8)
		atribuiNumero()
			
	if(player.arrayNumeros.size() > 1):
		if(100 + player.arrayNumeros[0]*10 + player.arrayNumeros[1] == 128):
			$Acertou.play()
			$Acertou.pause_mode = Node.PAUSE_MODE_PROCESS
			$menuPausa/menu._acertou(proximaFase)			
		else:
			$Errou.play()
			$Errou.pause_mode = Node.PAUSE_MODE_PROCESS
			$menuPausa/menu._errou()
			
func atribuiNumero():
	var posicao = player.arrayNumeros.size() - 1
	if(posicao == 0):
		resultado.text = String(player.arrayNumeros[posicao])
	elif(posicao == 1):
		resultado2.text = String(player.arrayNumeros[posicao])
