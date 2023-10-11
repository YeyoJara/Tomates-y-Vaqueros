extends Area2D



func _on_body_entered(_body):
	#### Suma 1 a la barra de poder y libera la escena ####
	if Estadisticas_Vaquero.estado_especial == false:
		Estadisticas_Vaquero.poder += 1
		queue_free()
	else:
		queue_free()
