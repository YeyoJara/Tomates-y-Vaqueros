extends CharacterBody2D


var velocidad_bala = Vector2 (0, -100)


func _ready():
	############ Llama la funcion _processs() ########
	set_process(true)
	
	
func _process(delta):
	
	################ Rota la irección de la vala en grados ##########
	var movimiento = velocidad_bala.rotated(deg_to_rad(rotation_degrees)) * delta
	move_and_collide(movimiento)
	
	
	######### Libera la bala al colisionar con el la capa mundo ##########
func _on_desaparecer_body_entered(_body):
	
	queue_free()
