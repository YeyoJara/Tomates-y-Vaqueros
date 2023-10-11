extends TextureRect

@onready var volver_inicio = $Volver_Inicio


func _ready():
	
	## inicia el cronometro para regrear al menu de inicio ###
	volver_inicio.start()
		
		
func _on_volver_inicio_timeout():
	get_tree().change_scene_to_file("res://Archivos/Interfaz_Usuario/Menus/Menu_Inicio/menu_inicio.tscn")
