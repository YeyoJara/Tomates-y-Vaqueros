extends CharacterBody2D


@onready var detectar = $Areas/Detectar

var velocidad = 15


const ketchup = preload("res://Archivos/Recogibles/Ketchup/ketchup.tscn")


func _physics_process(_delta):
	
	######### Detecta el vaquero y se mueve hacia él ###############
	var vaquero = detectar.cuerpo
	if vaquero != null:
		var direccion = (vaquero.global_position - global_position).normalized()
		velocity = velocity.move_toward(direccion * velocidad * 1.2, velocidad * 1.2)
		
	move_and_slide()
	
	########## Limpiar enemigos en pantalla ######
	if Estadisticas_Vaquero.enemigos_pantalla == false:
		queue_free()
	
	
func _on_lesion_area_entered(_area):
	############# Instancia el ketchup ############
	var sachet = ketchup.instantiate()
	get_parent().call_deferred("add_child", sachet)
	sachet.position = position
	Guardar_Puntaje.puntaje += 20
	queue_free()
