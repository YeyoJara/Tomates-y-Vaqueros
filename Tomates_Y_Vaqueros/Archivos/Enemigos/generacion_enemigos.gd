extends Node2D


var enemigos_minimos = 0
var enemigos_maximos = 1
var probabilidades: Array = [1,1]

@export var area_aparicion:Rect2

const  enemigo_1 = preload("res://Archivos/Enemigos/Tomates/Tomate_Regular/tomate.tscn")


func generacion():
	
	# Calcula el número de enemigos en función de probabilidades y enemigos_minimos ####
	var numero_enemigos = asignar_probabilidades(probabilidades)+enemigos_minimos
	### Itera para crear cada enemigo #### 
	for i in range(numero_enemigos):
		############# Instancia los enemigos_1 ##################
		var enemigos_1 = enemigo_1.instantiate()
		call_deferred("add_child", enemigos_1)
		############# Determina el area donde aparecen los enemigos#############
		enemigos_1.position = Vector2(randf_range(area_aparicion.position.x, area_aparicion.position.x + area_aparicion.size.x),
		randf_range(area_aparicion.position.y, area_aparicion.position.y + area_aparicion.size.y))
	
	
func asignar_probabilidades(posibilidades):
	
	#### Inicializar la suma total de posibilidades en 0 #####
	var posibilidad_total = 0
	#### Sumar todas las posibilidades en la lista #####
	for posibilidad in posibilidades:
		posibilidad_total += posibilidad
	#### Generar un valor aleatorio entre 0 y la suma total ####
	var valor_aleatorio = randi_range(0, posibilidad_total)
	# Inicializar la acumulación de probabilidades en 0
	var crear_posibilidad = 0
	#### Itera sobre las posibilidades nuevamente ####
	for i in range(posibilidades.size()):
		#### Acumular la probabilidad actual ####
		crear_posibilidad += posibilidades[i]
		#### Si el valor aleatorio es menor que la acumulación actual de ####
		#### probabilidades, seleccionar esta opción y devolver 1 #####
		if valor_aleatorio < crear_posibilidad:
			return 1
	#### Si no se selecciona ninguna opción en el bucle, ####
	#### devolver el índice de la última opción ####
	return probabilidades.size() - 1
