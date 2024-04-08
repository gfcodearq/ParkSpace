extends KinematicBody2D

const GRAVEDAD_MARTE = 3.71

var velocidad = 50
var propulsion = -50
var movimientos = Vector2()
var masa = 30
onready var navy = $Navy

func _ready():
	$SonidoFondo.play()

func _physics_process(delta):
	movimientos.y += GRAVEDAD_MARTE * delta * masa
	
	if Input.is_action_pressed("ui_select"):
		navy.play("Fire")
		movimientos.y = propulsion
	if Input.is_action_pressed("ui_left"):
		movimientos.x = -velocidad
	if Input.is_action_pressed("ui_right"):
		movimientos.x = velocidad
	
	move_and_slide(movimientos,Vector2(0,-1))

#Colisiones de la nave
func _on_Area2D_area_entered(area):
	#Si la nave colisiona con el asteroide
	if area.is_in_group("Asteroid"):
		navy.play("Damage")
		get_tree().change_scene("res://GameOver.tscn")
	#Si la nave colisiona con el suelo
	if area.is_in_group("Ground"):
		get_tree().change_scene("res://GameOver.tscn")
	#Si aterrizo la nave en la estacion espacial gano el juego
	if area.is_in_group("Estacion"):
		get_tree().change_scene("res://YouWin.tscn")
		


