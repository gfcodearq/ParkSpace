extends KinematicBody2D


const GRAVEDAD_MARTE = 3.71

var velocidad = 50
var movimientos = Vector2()
var masa = 50
	
func _physics_process(delta):

	if Input.is_action_pressed("Izquierda"):
		movimientos.x = -velocidad
	if Input.is_action_pressed("Derecha"):
		movimientos.x = velocidad
	
	move_and_slide(movimientos,Vector2(0,-1))
