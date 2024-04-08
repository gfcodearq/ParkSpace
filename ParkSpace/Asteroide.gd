extends KinematicBody2D

const GRAVEDAD_MARTE = 3.71
onready var Asteroid = $Asteroid
var masa = 20
var movimientos = Vector2()


func _physics_process(delta):
	movimientos.y += GRAVEDAD_MARTE * delta * masa
	movimientos.x = 50
	Asteroid.play("Rotate")
	
	move_and_slide(movimientos,Vector2(0,-1))


#Si toca el asteroide el piso se borra
func _on_Ground_body_entered(body):
	queue_free()

	
#Si cliqueo con el mouse destruyo el asteroide
func _on_Area2D_mouse_entered():
	queue_free()
	

#Si colisiona el asteroide con la estacion espacial
func _on_Area2D_area_entered(area):
	if area.is_in_group("ColisionAsteroide"):
		get_tree().change_scene("res://GameOver.tscn")
