extends Node2D


var area_disponible = []

@onready var ge_abajo = $"Generación_Enemigos/GE_Abajo"
@onready var ge_arriba = $"Generación_Enemigos/GE_Arriba"
@onready var ge_derecha = $"Generación_Enemigos/GE_Derecha"
@onready var ge_izquierda = $"Generación_Enemigos/GE_Izquierda"
@onready var ge_reinicio = $"Generación_Enemigos/GE_Reinicio"
@onready var et_abajo = $Enrredaderas/E_Abajo/E_Abajo_M
@onready var cs_abajo = $Enrredaderas/E_Abajo/E_Abajo_M/Area_EA/CollisionShape2D
@onready var et_arriba = $Enrredaderas/E_Arriba/E_Arriba_M
@onready var cs_arriba = $Enrredaderas/E_Arriba/E_Arriba_M/Area_EA/CollisionShape2D
@onready var et_derecha = $Enrredaderas/E_Derecha/E_Derecha_M
@onready var cs_derecha = $Enrredaderas/E_Derecha/E_Derecha_M/Area_EA/CollisionShape2D
@onready var et_izquierda = $Enrredaderas/E_Izquierda/E_Izquierda_M
@onready var cs_izquierda = $Enrredaderas/E_Izquierda/E_Izquierda_M/Area_EA/CollisionShape2D


func _ready():
	
	######## Nombre del nivel #######
	Guardar_Puntaje.nivel = "1"
	######## Activa la apareicion de enemigos ######
	Estadisticas_Vaquero.enemigos_pantalla = true
	######## Inicia la generación de enemigos en el area de arriba #####
	ge_arriba.generacion()
	######## Inicia la aparicion aleatoria de los enemigos ######
	ge_reinicio.start()
	
	### reinicia la las estadisticas del vaquero y la puntuación ###
	Estadisticas_Vaquero.vida = 5
	Estadisticas_Vaquero.poder = 0
	Guardar_Puntaje.tiempo = 0
	Guardar_Puntaje.niveles_completados = 0
	Guardar_Puntaje.puntaje = 0
	
	
func  _process(_delta):
	
	########## Detiene la aparicion de enemigos #############
	if Estadisticas_Vaquero.enemigos_pantalla == false:
		ge_reinicio.stop()
		##### Hace invisible la textura de las puertas #####
		et_abajo.visible = false
		et_arriba.visible = false
		et_derecha.visible = false
		et_izquierda.visible = false
		##### desactiva las colisiones de las puertas #####
		cs_abajo.disabled = true
		cs_arriba.disabled = true
		cs_derecha.disabled = true
		cs_izquierda.disabled = true
		
		
##### Función para elegir un número aleatorio sin repetición ######
func revolver():
	
	#### Comprobar si quedan números disponibles #####
	if area_disponible.size() == 0:
		##### Si no quedan números disponibles, reiniciar la lista ####
		area_disponible = [0,1,2,3]
		
	#### Elegir un índice aleatorio dentro del rango de la lista ####
	var indice = randi()%area_disponible.size()
	########### Obtener el número aleatorio #############
	var area_elegida = area_disponible[indice]
	######### Eliminar el número elegido de la lista #######
	area_disponible.remove_at(indice)
	
	return area_elegida
	
	
##### Genera enemigos, suma 1 a las variables enemigos minimos y maximos ######
######################## de lainstancia #####################
func area_abajo():
	
	ge_abajo.generacion()
	ge_abajo.enemigos_minimos += 1
	ge_abajo.enemigos_maximos += 1
	
	
##### Genera enemigos, suma 1 a las variables enemigos minimos y maximos ######
######################## de lainstancia #####################
func area_arriba():
	
	ge_arriba.generacion()
	ge_arriba.enemigos_minimos += 1
	ge_arriba.enemigos_maximos += 1
	
	
##### Genera enemigos, suma 1 a las variables enemigos minimos y maximos ######
######################## de lainstancia #####################
func area_derecha():
	
	ge_derecha.generacion()
	ge_derecha.enemigos_minimos += 1
	ge_derecha.enemigos_maximos += 1
	
	
##### Genera enemigos, suma 1 a las variables enemigos minimos y maximos ######
######################## de lainstancia #####################
func area_izquierda():
	
	ge_izquierda.generacion()
	ge_izquierda.enemigos_minimos += 1
	ge_izquierda.enemigos_maximos += 1
	
	
######### Cada 3 sefundos, segun el numero elegido, activa una funcion ########
func _on_ge_reinicio_timeout():
	
	if revolver() == 0:
		area_abajo()
	elif revolver() == 1:
		area_arriba()
	elif revolver() == 2:
		area_derecha()
	elif  revolver() == 3:
		area_izquierda()
		
		
func _on_abajo_body_entered(body):
	get_tree().change_scene_to_file("res://Archivos/Interfaz_Usuario/pantalla_final.tscn")


func _on_arriba_body_entered(body):
	get_tree().change_scene_to_file("res://Archivos/Interfaz_Usuario/pantalla_final.tscn")


func _on_derecha_body_entered(body):
	get_tree().change_scene_to_file("res://Archivos/Interfaz_Usuario/pantalla_final.tscn")


func _on_izquierda_body_entered(body):
	get_tree().change_scene_to_file("res://Archivos/Interfaz_Usuario/pantalla_final.tscn")
