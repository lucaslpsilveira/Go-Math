extends Node

onready var player = get_node("Player")
onready var numero3 = get_node("Numero3")
onready var numero4 = get_node("Numero4")
onready var numero8 = get_node("Numero8")
onready var numero9 = get_node("Numero9")
onready var resultado = get_node("HUD/Resultado")
onready var resultado2 = get_node("HUD/Resultado2")
onready var textoTopo = get_node("HUD/topo/textoTopo")
onready var proximaFase = "res://Fases/Fase_5/Fase_5.tscn"

func _ready():
	textoTopo.text = "nível 4"
	get_tree().paused = false
	$Musica.play()

func _physics_process(delta):
	if Input.is_action_pressed("c"):
		if(numero4.player_encostando):
			player.arrayNumeros.append(4)
			remove_child(numero4)	
		elif(numero3.player_encostando):
			player.arrayNumeros.append(3)
			remove_child(numero3)
		elif(numero8.player_encostando):
			remove_child(numero8)
			player.arrayNumeros.append(8)			
		elif(numero9.player_encostando):
			player.arrayNumeros.append(9)			
			remove_child(numero9)
		atribuiNumero()
			
	if(player.arrayNumeros.size() > 0):
		if(player.arrayNumeros[0] == 9):
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
