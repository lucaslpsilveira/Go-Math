extends Node

onready var player = get_node("Player")
onready var numero1 = get_node("Numero1")
onready var numero3 = get_node("Numero3")
onready var numero4 = get_node("Numero4")
onready var numero5 = get_node("Numero5")
onready var resultado = get_node("HUD/Resultado")
onready var resultado2 = get_node("HUD/Resultado2")
onready var textoTopo = get_node("HUD/topo/textoTopo")
onready var proximaFase = "res://Fases/Fase_3/Fase_3.tscn"

func _ready():
	textoTopo.text = "nível 2"
	get_tree().paused = false
	$Musica.play()

func _physics_process(delta):
	if Input.is_action_pressed("c"):
		if(numero1.player_encostando):
			player.arrayNumeros.append(1)
			remove_child(numero1)	
		elif(numero3.player_encostando):
			player.arrayNumeros.append(3)
			remove_child(numero3)
		elif(numero4.player_encostando):
			player.arrayNumeros.append(4)
			remove_child(numero4)
		elif(numero5.player_encostando):
			player.arrayNumeros.append(5)			
			remove_child(numero5)
		atribuiNumero()
			
	if(player.arrayNumeros.size() > 1):
		if(player.arrayNumeros[0]*10 + player.arrayNumeros[1] == 13):
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
