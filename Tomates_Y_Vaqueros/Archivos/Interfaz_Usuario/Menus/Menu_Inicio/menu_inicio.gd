extends Control


@onready var titulo = $Titulo
@onready var cronometro = $Titulo/Cronometro
@onready var botones = $Botones

### Asigna los colores del diccionario a un diccionario ###
var colores = [
	Color(1,0,0),
	Color(1,0.5,0),
	Color(1,1,0),
	Color(0,1,0),
	Color(0,0,1),
	Color(0.3,0,0.5),
	Color(0.5,0,0.5)
]
### Slecciona un color de los contenidos en el diccionario ###
var color_actual = 0

const  menu_puntuacion = preload("res://Archivos/Interfaz_Usuario/Menus/Menu_Puntuacion/menu_puntuación.tscn")


func _ready():
	
	### inicia el cambio de color dle titulo ###
	cronometro.start()
	
	### reinicia la puntuación ###
	Guardar_Puntaje.puntaje = 0
	
	
func _on_inicio_button_down():
	get_tree().change_scene_to_file("res://Archivos/Mundo/Escenario_1/escenario_1.tscn")
	queue_free()
	
	
func _on_historicos_button_down():
	var puntaje = menu_puntuacion.instantiate()
	puntaje.menu = true
	get_parent().call_deferred("add_child", puntaje)
	queue_free()
	
	
func _on_salir_button_down():
	get_tree().quit()


func _on_cronometro_timeout():
	
	titulo.modulate = colores[color_actual]
	
	color_actual += 1
	if color_actual >= colores.size():
		color_actual = 0
		
