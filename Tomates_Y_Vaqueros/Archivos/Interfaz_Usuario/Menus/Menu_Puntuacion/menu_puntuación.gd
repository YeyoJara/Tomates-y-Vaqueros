extends CanvasLayer


@onready var puntaje_1 = $puntaje_1
@onready var puntaje_2 = $puntaje_2
@onready var puntaje_3 = $puntaje_3
@onready var puntaje_4 = $puntaje_4
@onready var puntaje_5 = $puntaje_5
@onready var reintentar_salir = $Botones_RS
@onready var regresar = $Regresar

#### Carga los datos correspondientes del script de guardar_puntaje para las letras ###
### para el nombre y posicion de la letra, n1_l1, se refiere a nombre 1, letra 1 ###
var n1_l1 = Guardar_Puntaje.n1_l1
var n1_l2 = Guardar_Puntaje.n1_l2
var n1_l3 = Guardar_Puntaje.n1_l3
var n2_l1 = Guardar_Puntaje.n2_l1
var n2_l2 = Guardar_Puntaje.n2_l2
var n2_l3 = Guardar_Puntaje.n2_l3
var n3_l1 = Guardar_Puntaje.n3_l1
var n3_l2 = Guardar_Puntaje.n3_l2
var n3_l3 = Guardar_Puntaje.n3_l3
var n4_l1 = Guardar_Puntaje.n4_l1
var n4_l2 = Guardar_Puntaje.n4_l2
var n4_l3 = Guardar_Puntaje.n4_l3
var n5_l1 = Guardar_Puntaje.n5_l1
var n5_l2 = Guardar_Puntaje.n5_l2
var n5_l3 = Guardar_Puntaje.n5_l3
### Carga os datos guardados del script de guardar_puntaje para el nivel ####
var n_1 = Guardar_Puntaje.n_1
var n_2 = Guardar_Puntaje.n_2
var n_3 = Guardar_Puntaje.n_3
var n_4 = Guardar_Puntaje.n_4
var n_5 = Guardar_Puntaje.n_5
### Carga los script de guardar_puntaje para el tiempo restante ###
var tiempo = Guardar_Puntaje.tiempo
### Carga los datos guardados del script de guardar_puntaje para la ###
### cantidad de tiempo restante ####
var t_1 = Guardar_Puntaje.t_1
var t_2 = Guardar_Puntaje.t_2
var t_3 = Guardar_Puntaje.t_3
var t_4 = Guardar_Puntaje.t_4
var t_5 = Guardar_Puntaje.t_5
### Toma el numero de niveles completos del actual ###
var niveles_completos = Guardar_Puntaje.niveles_completados
### Carga los datos guardados del script de guardar_puntaje para la ###
### cantidad de niveles completados ####
var n_c1 = Guardar_Puntaje.n_c1
var n_c2 = Guardar_Puntaje.n_c2
var n_c3 = Guardar_Puntaje.n_c3
var n_c4 = Guardar_Puntaje.n_c4
var n_c5 = Guardar_Puntaje.n_c5
#### Toma el valor del script puntaje_guardado para el puntaje actual ###
var puntaje = Guardar_Puntaje.puntaje
#### Carga los datos guardados del script de guardar_puntaje ###
var p_1 = Guardar_Puntaje.p_1
var p_2 = Guardar_Puntaje.p_2
var p_3 = Guardar_Puntaje.p_3
var p_4 = Guardar_Puntaje.p_4
var p_5 = Guardar_Puntaje.p_5

### la escena si instancia desde le meno o no ###
var menu = false


func _ready():
	
	if menu == false:
		regresar.visible = false
		reintentar_salir.visible = true
	else:
		regresar.visible = true
		reintentar_salir.visible = false
	
	######### asigna los valores en la posicion 1 de la tabla  #####
	puntaje_1.nl_1.text = n1_l1
	puntaje_1.nl_2.text = n1_l2
	puntaje_1.nl_3.text = n1_l3
	puntaje_1.nivel = n_1
	puntaje_1.tiempo = t_1
	puntaje_1.niveles_completados = n_c1
	puntaje_1.puntaje = p_1
	
	# emite una señal para asignar los valores  en la posicion 1 de la tabla # 
	puntaje_1.actualizar.emit()
	
	######### asigna los valores en la posicion 2 de la tabla  #####
	puntaje_2.nl_1.text = n2_l1
	puntaje_2.nl_2.text = n2_l2
	puntaje_2.nl_3.text = n2_l3
	puntaje_2.nivel = n_2
	puntaje_2.tiempo = t_2
	puntaje_2.niveles_completados = n_c2
	puntaje_2.puntaje = p_2
	
	# emite una señal para asignar los valores  en la posicion 2 de la tabla # 
	puntaje_2.actualizar.emit()
	
	######### asigna los valores en la posicion 3 de la tabla  #####
	puntaje_3.nl_1.text = n3_l1
	puntaje_3.nl_2.text = n3_l2
	puntaje_3.nl_3.text = n3_l3
	puntaje_3.nivel = n_3
	puntaje_3.tiempo = t_3
	puntaje_3.niveles_completados = n_c3
	puntaje_3.puntaje = p_3
	
	# emite una señal para asignar los valores  en la posicion 3 de la tabla #
	puntaje_3.actualizar.emit()
	
	######### asigna los valores en la posicion 4 de la tabla  #####
	puntaje_4.nl_1.text = n4_l1
	puntaje_4.nl_2.text = n4_l2
	puntaje_4.nl_3.text = n4_l3
	puntaje_4.nivel = n_4
	puntaje_4.tiempo = t_4
	puntaje_4.niveles_completados = n_c4
	puntaje_4.puntaje = p_4
	
	# emite una señal para asignar los valores  en la posicion 4 de la tabla #
	puntaje_4.actualizar.emit()
	
	######### asigna los valores en la posicion 4 de la tabla  #####
	puntaje_5.nl_1.text = n5_l1
	puntaje_5.nl_2.text = n5_l2
	puntaje_5.nl_3.text = n5_l3
	puntaje_5.nivel = n_5
	puntaje_5.tiempo = t_5
	puntaje_5.niveles_completados = n_c5
	puntaje_5.puntaje = p_5
	
	# emite una señal para asignar los valores  en la posicion 4 de la tabla #
	puntaje_5.actualizar.emit()
	
	### Compara el puntaje actual con el guardado y ####
	###Asigna la linea correspondinte de la puntuación ####
	if puntaje >= p_1:
		puntaje_1.activo = true
	elif puntaje <= p_1 && puntaje >= p_2:
		puntaje_2.activo = true
	elif puntaje <= p_2 && puntaje >= p_3:
		puntaje_3.activo = true
	elif puntaje <= p_3 && puntaje >= p_4:
		puntaje_4.activo = true
	elif puntaje <= p_4 && puntaje >= p_5:
		puntaje_5.activo = true
		
		
func _on_reintentar_button_down():
	Guardar_Puntaje.guardar_datos()
	get_tree().change_scene_to_file("res://Archivos/Mundo/Escenario_1/escenario_1.tscn")


func _on_salir_button_down():
	Guardar_Puntaje.guardar_datos()
	get_tree().change_scene_to_file("res://Archivos/Interfaz_Usuario/Menus/Menu_Inicio/menu_inicio.tscn")
	
	

func _on_regresar_button_down():
	get_tree().change_scene_to_file("res://Archivos/Interfaz_Usuario/Menus/Menu_Inicio/menu_inicio.tscn")
	queue_free()
