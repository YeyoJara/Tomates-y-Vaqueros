extends Area2D


var cuerpo = null


func puede_ver_vaquero():
	
	return cuerpo != null
	
	
func _on_body_entered(body):
	cuerpo = body
	
	
func _on_body_exited(_body):
	cuerpo = null
