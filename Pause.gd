extends Control
var next = 'res://Menu.tscn'
onready var label = $menuPause/TextureRect/MarginContainer/VBoxContainer/label
onready var btnProximaFase = $menuPause/TextureRect/MarginContainer/VBoxContainer/ProximaFase
onready var btnContinuar = $menuPause/TextureRect/MarginContainer/VBoxContainer/Continuar
onready var btnReiniciar = $menuPause/TextureRect/MarginContainer/VBoxContainer/Reiniciar

func _ready():	
	$menuPause.visible = false
	label.text = 'pausado'
	btnContinuar.visible = true
	btnProximaFase.visible = false
			
func _process(delta):
	if Input.is_action_just_pressed("pause"):
		if get_tree().paused == false:
			_pausa()
			btnContinuar.grab_focus()
		elif get_tree().paused && !Input.is_action_just_pressed("Enter"):
			_despausa()
			
func _acertou():
	label.text = 'acertou'
	btnContinuar.visible = false	
	btnProximaFase.visible = true
	_pausa()		
	btnProximaFase.grab_focus()
		
func _errou():
	label.text = 'errou'
	btnContinuar.visible = false		
	_pausa()
	btnReiniciar.grab_focus()
	
func _pausa():
	get_tree().paused = true
	$menuPause.visible = true

func _despausa():
	print('roda despausa')
	get_tree().paused = false
	$menuPause.visible = false

func _on_Continuar_pressed():
	_despausa()

func _on_Reiniciar_pressed():
	_despausa()
	get_tree().reload_current_scene()

func _on_Sair_pressed():
	_despausa()
	get_tree().change_scene('res://Menu.tscn')

func _on_ProximaFase_pressed():
	print('roda next fase')
	_despausa()
	get_tree().change_scene('res://Menu.tscn')
