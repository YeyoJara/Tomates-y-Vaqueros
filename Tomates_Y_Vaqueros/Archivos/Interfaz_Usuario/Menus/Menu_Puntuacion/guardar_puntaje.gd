extends Node

########## Asigna el valor fijo cuando va a actualizarse el puntaje #####
var nombre_letra1:String = "Y"
var nombre_letra2:String = "J"
var nombre_letra3:String = "O"
### Crea espacio en el registro de guardado con los datos ###
### de n = nombre y l = letra y el numero correspondiente a su ### 
### posición en la tabla o dentro del nombre, por ejemplo ###
### n1_l1, correspponde al nombre 1, letra 1. n1_l2, nombre 1, letra 2, etc ###
var n1_l1 = "Y"
var n1_l2 = "J"
var n1_l3 = "O"
var n2_l1 = "S"
var n2_l2 = "E"
var n2_l3 = "E"
var n3_l1 = "C"
var n3_l2 = "A"
var n3_l3 = "E"
var n4_l1 = "K"
var n4_l2 = "G"
var n4_l3 = "O"
var n5_l1 = "C"
var n5_l2 = "G"
var n5_l3 = "O"
### Asigna el valor correspondiente al nivel ###
var nivel:String = "1"
#### Crea el espacio correspondoente en la posición de la tabla #####
### por ejemplo n_1 corresponde al nivel en la posicion 1 ####
var n_1:String = "1"
var n_2:String = "1"
var n_3:String = "1"
var n_4:String = "1"
var n_5:String = "1"
### Asigna el valor corresponditne al tiempo ###
var tiempo:int = 15
### Crea el espacio correspondiente la posiciond e la tabala ###
###por ejemplo t_1 corresponde al tiempo restante en la posición 1 ###
var t_1:int = 15
var t_2:int = 60
var t_3:int = 120
var t_4:int = 200
var t_5:int = 250
### Asigna el valor correspondiente al numero de niveles completados ###
var niveles_completados = 0
### Crea el espacio correspondoente en la posición de la tabla #####
### por ejemplo nc_1 corresponde a los niveles completados en la posicion 1 ####
var n_c1:int = 0
var n_c2:int = 0
var n_c3:int = 0
var n_c4:int = 0
var n_c5:int = 0
### Asigna el valor correspondiente para verificar si se puede guardad o no ###
var puntaje = 0
### Crea el  espacio correspondiente a la posicion del puntaje la tabla, ###
### por ejemplo p_1, corresponde a puntaje de la posicion 1 #####
var p_1:int = 8000
var p_2:int = 4000
var p_3:int = 2000
var p_4:int = 1000
var p_5:int = 500

var registro = {}
const  ruta = "savefile.json"


func _ready():

	if not FileAccess.file_exists(ruta):
		guardar_datos()
	else:
		cargar_datos()
		
		
###### Crea y guarda los datos de la puntuación #######
func guardar_datos():
	
	### ordena el registro del puntaje si el archivo existe ###
	if FileAccess.file_exists(ruta):
		ordenar_registro()
	### actualiza el registro si el puntaje esta entre los primeros 5 ###
	actualizar_registro()
	
	######### crea el diccionario de los mejores puntajes #####
	registro = {
		"nombre1_letra1": n1_l1,
		"nombre1_letra2": n1_l2,
		"nombre1_letra3": n1_l3,
		"nivel_1": n_1,
		"tiempo_1": t_1,
		"niveles_completados_1": n_c1,
		"puntaje_1": p_1,
		"nombre2_letra1": n2_l1,
		"nombre2_letra2": n2_l2,
		"nombre2_letra3": n2_l3,
		"nivel_2": n_2,
		"tiempo_2": t_2,
		"niveles_completados_2": n_c2,
		"puntaje_2": p_2,
		"nombre3_letra1": n3_l1,
		"nombre3_letra2": n3_l2,
		"nombre3_letra3": n3_l3,
		"nivel_3": n_3,
		"tiempo_3": t_3,
		"niveles_completados_3": n_c3,
		"puntaje_3": p_3,
		"nombre4_letra1": n4_l1,
		"nombre4_letra2": n4_l2,
		"nombre4_letra3": n4_l3,
		"nivel_4": n_4,
		"tiempo_4": t_4,
		"niveles_completados_4": n_c4,
		"puntaje_4": p_4,
		"nombre5_letra1": n5_l1,
		"nombre5_letra2": n5_l2,
		'nombre5_letra3': n5_l3,
		"nivel_5": n_5,
		"tiempo_5": t_5,
		"niveles_completados_5": n_c5,
		"puntaje_5": p_5,
	}
	
	########## Guarda el archivo de la puntuación ###########
	var json_string = JSON.stringify(registro)
	var archivo= FileAccess.open_compressed(ruta, FileAccess.WRITE)
	archivo.store_string(json_string)
	archivo.close()
	
	
###### asigna los valores de los datos del archivo guardado #####
func cargar_datos():
	######### verifica si existe el archivo de guardado #####
	if FileAccess.file_exists(ruta):
		var archivo = FileAccess.open_compressed(ruta, FileAccess.READ)
		var json_string = archivo.get_as_text()
		archivo.close()
		registro = JSON.parse_string(json_string)
		### Carga el diccionario con los datos guardados ###
		n1_l1 = registro ["nombre1_letra1"]
		n1_l2 = registro ["nombre1_letra2"]
		n1_l3 = registro ["nombre1_letra3"]
		n_1 = registro ["nivel_1"]
		t_1 = registro ["tiempo_1"]
		n_c1 = registro ["niveles_completados_1"]
		p_1 = registro ["puntaje_1"]
		n2_l1 = registro ["nombre2_letra1"]
		n2_l2 = registro ["nombre2_letra2"]
		n2_l3 = registro ["nombre2_letra3"]
		n_2 = registro ["nivel_2"]
		t_2 = registro ["tiempo_2"]
		n_c2 = registro ["niveles_completados_2"]
		p_2 = registro ["puntaje_2"]
		n3_l1 = registro ["nombre3_letra1"]
		n3_l2 = registro ["nombre3_letra2"]
		n3_l3 = registro ["nombre3_letra3"]
		n_3 = registro ["nivel_3"]
		t_3 = registro ["tiempo_3"]
		n_c3 = registro ["niveles_completados_3"]
		p_3 = registro ["puntaje_3"]
		n4_l1 = registro ["nombre4_letra1"]
		n4_l2 = registro ["nombre4_letra2"]
		n4_l3 = registro ["nombre4_letra3"]
		n_4 = registro ["nivel_4"]
		t_4 = registro ["tiempo_4"]
		n_c4 = registro ["niveles_completados_4"]
		p_4 = registro ["puntaje_4"]
		n5_l1 = registro ["nombre5_letra1"]
		n5_l2 = registro ["nombre5_letra2"]
		n5_l3 = registro ["nombre5_letra3"]
		n_5 = registro ["nivel_5"]
		t_5 = registro ["tiempo_5"]
		n_c5 = registro ["niveles_completados_5"]
		p_5 = registro ["puntaje_5"]
		
		
func actualizar_registro():
	
	#### Compara los puntajes y asigna un espacio de guardado ####
	#### para cada registro: nombre, nivel, etc ####
	if puntaje >= p_1:
		
		n1_l1 = nombre_letra1
		n1_l2 = nombre_letra2
		n1_l3 = nombre_letra3
		t_1 = tiempo
		n_1 = nivel
		n_c1 = niveles_completados
		p_1 = puntaje
	elif puntaje <= p_1 && puntaje >= p_2:
		n2_l1 = nombre_letra1
		n2_l2 = nombre_letra2
		n3_l3 = nombre_letra3
		t_2 = tiempo
		n_2 = nivel
		n_c2 = niveles_completados
		p_2 = puntaje
	elif puntaje <= p_2 && puntaje >= p_3:
		n3_l1 = nombre_letra1
		n3_l2 = nombre_letra2
		n3_l3 = nombre_letra3
		t_3 = tiempo
		n_3 = nivel
		n_c3 = niveles_completados
		p_3 = puntaje
	elif puntaje <= p_3 && puntaje >= p_4:
		n4_l1 = nombre_letra1
		n4_l2 = nombre_letra2
		n4_l3 = nombre_letra3
		t_4 = tiempo
		n_4 = nivel
		n_c4 = niveles_completados
		p_4 = puntaje
	elif puntaje <= p_4 && puntaje >= p_5:
		n5_l1 = nombre_letra1
		n5_l2 = nombre_letra2
		n5_l3 = nombre_letra3
		t_5 = tiempo
		n_5 = nivel
		n_c5 = niveles_completados
		p_5 = puntaje
		
		
### Ordena los registro antes de actualizar el puntaje para que ###
### nuevos puntajes desplacen los viejos ###
func ordenar_registro():
	
	### Desplaza los puntajes si el nuevo registro es superior al ###
	### registro del puntaje 1 de la tabla ###
	if puntaje >= p_1:
		n2_l1 = registro ["nombre1_letra1"]
		n2_l2 = registro ["nombre1_letra2"]
		n2_l3 = registro ["nombre1_letra3"]
		n_2 = registro ["nivel_1"]
		t_2 = registro ["tiempo_1"]
		n_c2 = registro ["niveles_completados_1"]
		p_2 = registro ["puntaje_1"]
		
		n3_l1 = registro ["nombre2_letra1"]
		n3_l2 = registro ["nombre2_letra2"]
		n3_l3 = registro ["nombre2_letra3"]
		n_3 = registro ["nivel_2"]
		t_3 = registro ["tiempo_2"]
		n_c3 = registro ["niveles_completados_2"]
		p_3 = registro ["puntaje_2"]
		
		n4_l1 = registro ["nombre3_letra1"]
		n4_l2 = registro ["nombre3_letra2"]
		n4_l3 = registro ["nombre3_letra3"]
		n_4 = registro ["nivel_3"]
		t_4 = registro ["tiempo_3"]
		n_c4 = registro ["niveles_completados_3"]
		p_4 = registro ["puntaje_3"]
		
		n5_l1 = registro ["nombre4_letra1"]
		n5_l2 = registro ["nombre4_letra2"]
		n5_l3 = registro ["nombre4_letra3"]
		n_5 = registro ["nivel_4"]
		t_5 = registro ["tiempo_4"]
		n_c5 = registro ["niveles_completados_4"]
		p_5 = registro ["puntaje_4"]
		
		### Desplaza los puntajes si el nuevo registro es superior al ###
	### registro del puntaje 2 de la tabla ###
	elif puntaje <= p_1 && puntaje >= p_2:
		n3_l1 = registro ["nombre2_letra1"]
		n3_l2 = registro ["nombre2_letra2"]
		n3_l3 = registro ["nombre2_letra3"]
		n_3 = registro ["nivel_2"]
		t_3 = registro ["tiempo_2"]
		n_c3 = registro ["niveles_completados_2"]
		p_3 = registro ["puntaje_2"]
		
		n4_l1 = registro ["nombre3_letra1"]
		n4_l2 = registro ["nombre3_letra2"]
		n4_l3 = registro ["nombre3_letra3"]
		n_4 = registro ["nivel_3"]
		t_4 = registro ["tiempo_3"]
		n_c4 = registro ["niveles_completados_3"]
		p_4 = registro ["puntaje_3"]
		
		n5_l1 = registro ["nombre4_letra1"]
		n5_l2 = registro ["nombre4_letra2"]
		n5_l3 = registro ["nombre4_letra3"]
		n_5 = registro ["nivel_4"]
		t_5 = registro ["tiempo_4"]
		n_c5 = registro ["niveles_completados_4"]
		p_5 = registro ["puntaje_4"]
		
		### Desplaza los puntajes si el nuevo registro es superior al ###
	### registro del puntaje 3 de la tabla ###
	elif puntaje <= p_2 && puntaje >= p_3:
		n4_l1 = registro ["nombre3_letra1"]
		n4_l2 = registro ["nombre3_letra2"]
		n4_l3 = registro ["nombre3_letra3"]
		n_4 = registro ["nivel_3"]
		t_4 = registro ["tiempo_3"]
		n_c4 = registro ["niveles_completados_3"]
		p_4 = registro ["puntaje_3"]
		
		n5_l1 = registro ["nombre4_letra1"]
		n5_l2 = registro ["nombre4_letra2"]
		n5_l3 = registro ["nombre4_letra3"]
		n_5 = registro ["nivel_4"]
		t_5 = registro ["tiempo_4"]
		n_c5 = registro ["niveles_completados_4"]
		p_5 = registro ["puntaje_4"]
		
		
		### Desplaza los puntajes si el nuevo registro es superior al ###
	### registro del puntaje 4 de la tabla ###
	elif puntaje <= p_3 && puntaje >= p_4:
		n5_l1 = registro ["nombre4_letra1"]
		n5_l2 = registro ["nombre4_letra2"]
		n5_l3 = registro ["nombre4_letra3"]
		n_5 = registro ["nivel_4"]
		t_5 = registro ["tiempo_4"]
		n_c5 = registro ["niveles_completados_4"]
		p_5 = registro ["puntaje_4"]
