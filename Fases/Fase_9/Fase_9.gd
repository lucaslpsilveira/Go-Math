extends Node

onready var player = get_node("Player")
onready var numero1 = get_node("Numero1")
onready var numero5 = get_node("Numero5")
onready var numero6 = get_node("Numero6")
onready var numero7 = get_node("Numero7")
onready var resultado = get_node("HUD/Resultado")
onready var resultado2 = get_node("HUD/Resultado2")
onready var textoTopo = get_node("HUD/topo/textoTopo")
onready var proximaFase = "res://Fases/Fase_10/Fase_10.tscn"

func _ready():
	textoTopo.text = "nível 9"
	get_tree().paused = false
	$Musica.play()

func _physics_process(delta):
	if Input.is_action_pressed("c"):
		if(numero1.player_encostando):
			player.arrayNumeros.append(1)
			remove_child(numero1)	
		elif(numero5.player_encostando):
			player.arrayNumeros.append(5)
			remove_child(numero5)
		elif(numero6.player_encostando):
			remove_child(numero6)
			player.arrayNumeros.append(6)
		elif(numero7.player_encostando):
			player.arrayNumeros.append(7)
			remove_child(numero7)
		atribuiNumero()
			
	if(player.arrayNumeros.size() > 1):
		if(player.arrayNumeros[0]*10 + player.arrayNumeros[1] == 16):
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
