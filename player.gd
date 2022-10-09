extends KinematicBody2D

const aceleracao = 5
const velocidade = 175
const gravidade = 20
const pulo = -300
const ceu = Vector2(0, -1)

var encostando_escada := false
var subindo_escada := false

var motion = Vector2();

func _physics_process(delta):
	movimento()
	if !subindo_escada:
			motion.y += gravidade
			pulo() 	
	escalando()
	#motion é igual a função para zerar a gravidade
	motion = move_and_slide(motion,ceu)

func movimento():	
	if Input.is_action_pressed("ui_right"):
		motion.x = velocidade
		$Sprite.play("Run")
		$Sprite.flip_h = false
	elif Input.is_action_pressed("ui_left"):			
		motion.x = -velocidade
		$Sprite.play("Run")
		$Sprite.flip_h = true
	else:
		motion.x = 0
		$Sprite.play("Idle")
func pulo():		
	if is_on_floor():
		if Input.is_action_pressed("x"):			
			motion.y = pulo					
	else:
		if(motion.y < 0):
			$Sprite.play("Jump")
		else:
			$Sprite.play("Fall")
	
func escalando():
	if encostando_escada:
		if Input.is_action_pressed("ui_up"):
			subindo_escada = true			
			motion.y =  max(motion.y - aceleracao, -velocidade)
			$Sprite.play("Climb")
		elif Input.is_action_pressed("ui_down"):
			subindo_escada = true
			motion.y =  max(motion.y + aceleracao, velocidade)
			$Sprite.play("Climb_Down")
		else:
			if subindo_escada:
				motion.y = 0
				
func _on_Area2D_area_exited(area):
	area.get_name()
	if area.is_in_group("escada"):
		encostando_escada = false
		subindo_escada = false

func _on_Area2D_area_entered(area):
	area.get_name()
	if area.is_in_group("escada"):
		encostando_escada = true
