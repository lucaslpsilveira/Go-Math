extends KinematicBody2D

var velocidade = Vector2.ZERO
const velocidade_movimento = 125
const gravidade = 1200
const pulo = -300
var esta_no_chao
onready var raycasts = $raycasts

func _physics_process(delta):
	velocidade.y += gravidade * delta
	
	_get_input()
		
	velocidade = move_and_slide(velocidade)
	
	esta_no_chao = _verifica_esta_no_chao()
	
	_set_animacao()
	
func _get_input():
	velocidade.x = 0
	var direcao_movimento = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	velocidade.x = velocidade_movimento * direcao_movimento
	
	if direcao_movimento !=0:
		$Sprite.scale.x = direcao_movimento

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("x") and esta_no_chao:
			velocidade.y = pulo

func _verifica_esta_no_chao():
	for raycast in raycasts.get_children():
		if raycast.is_colliding():
			return true
		return false
		
func _set_animacao():
	var animacao = "Idle"
	
	if(!esta_no_chao):
		animacao = "Jump"
	elif(!velocidade.x != 0):
		animacao = "Run"
	
	if $AnimationPlayer.assigned_animation != animacao:
		$AnimationPlayer.play(animacao)
		
		$AnimationPlayer.
