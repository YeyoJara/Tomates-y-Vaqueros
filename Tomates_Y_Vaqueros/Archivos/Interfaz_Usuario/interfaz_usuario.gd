extends Control

var temporizador = true
var contador = 300
var puntuación = 0
var nivel = true

@onready var vida = $Sombrero_Vida
@onready var poder = $Arma_Poder
@onready var vaciar = $Arma_Poder/Vaciar
@onready var tiempo = $Tiempo
@onready var cronometro = $Tiempo/Cronometro
@onready var puntaje = $Puntaje


func _ready():
	
	set_process(true)
	cronometro.start()
	
	
func _process(_delta):
	
	######## Iguala los valores de vida y poder de acuerdo a los globales ####
	vida.value = Estadisticas_Vaquero.vida
	poder.value = Estadisticas_Vaquero.poder
	
	####### Cuando la barra d epdoer se llena empiza a rotar #####
	if Estadisticas_Vaquero.poder >= 10:
		if temporizador==true:
			vaciar.start()
			temporizador = false
	if Estadisticas_Vaquero.poder <=0:
		vaciar.stop()
		temporizador = true
		
	########## Sobrevivir todo el tiempo, detiene el contador ######
	########## y suma uno a niveles totales ######
	if contador <=0:
		Estadisticas_Vaquero.enemigos_pantalla = false
		cronometro.stop()
		if nivel == true:
			Guardar_Puntaje.niveles_completados += 1
			nivel = false
	else:
		nivel = true
	######### detiene el tiempo si el vaquero muere ######
	if Estadisticas_Vaquero.estado_vivo == false:
		cronometro.stop()
		
		
	puntuacion_total()
		
		
####### Asigna el formato del temporizador en mm:ss #########
func formato_de_tiempo():
	####### Divide el contador(300) en 60 (5 minutos) #######
	var minutos = contador / 60
	var segundos = contador % 60
	######## asigna al texto del label el formato 
	tiempo.text = str(minutos).pad_zeros(2) + ":" + str(segundos).pad_zeros(2)
	
	
####### asigna el puntaje y los ceros de la puntuacuón #####
func puntuacion_total():
	
	puntuación = Guardar_Puntaje.puntaje
	puntaje.text = str(puntuación).lpad(8, "0")
	
	
	########## Vacia 2 de poder cada segundo ########
func _on_vaciar_timeout():
	
	Estadisticas_Vaquero.poder -= 2
	
	
	####### Descuenta 1 segundo y asigna el formato al cronometro ######
func _on_cronometro_timeout():
	
	contador -= 1
	Guardar_Puntaje.tiempo = contador
	formato_de_tiempo()
