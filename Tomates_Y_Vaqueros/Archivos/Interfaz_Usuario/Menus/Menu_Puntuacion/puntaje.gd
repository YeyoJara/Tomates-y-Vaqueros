extends Control

var activo = false

var alfabeto = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
var letra = 0
var letra_posicion = 0
var ver = true

@onready var nl_1 = $Nombre/L_1
@onready var visible_1 = $Nombre/Visible
@onready var invisible_1 = $Nombre/Invisible
@onready var nl_2 = $Nombre/L_2
@onready var nl_3 = $Nombre/L_3

var nivel:String = "X"
@onready var n = $Nivel

var tiempo:int = 0
@onready var t = $Tiempo_Restante

var niveles_completados:int = 0
@onready var nc = $Niveles_Completados


var puntaje:int = 0
@onready var p = $Puntaje


signal actualizar


func _ready():
	
	######## actualiza el puntaje segun la señal emitida ######
	actualizar.connect(nuevo_puntaje)
	
	
func _process(_delta):
	
	#####  restringir los valores del nombre ####
	letra_posicion = clampi(letra_posicion, 0, 2)
	if activo == true:
	#### Rota hacia arriba y abajo el abecedario y actualiza el 
	##### registro del scrip Guardar_Puntaje #####
		if Input.is_action_just_pressed("ui_down"):
			letra = (letra + 1) % alfabeto.length()
			if letra_posicion == 0:
				nl_1.text = alfabeto[letra]
				Guardar_Puntaje.nombre_letra1 = nl_1.text
			if letra_posicion == 1:
				nl_2.text = alfabeto[letra]
				Guardar_Puntaje.nombre_letra2 = nl_2.text
			if letra_posicion == 2:
				nl_3.text = alfabeto[letra]
				Guardar_Puntaje.nombre_letra3 = nl_3.text
		elif Input.is_action_just_pressed("ui_up"):
			letra = (letra - 1) % alfabeto.length()
			if letra_posicion == 0:
				nl_1.text = alfabeto[letra]
				Guardar_Puntaje.nombre_letra1 = nl_1.text
			if letra_posicion == 1:
				nl_2.text = alfabeto[letra]
				Guardar_Puntaje.nombre_letra2 = nl_2.text
			if letra_posicion == 2:
				nl_3.text = alfabeto[letra]
				Guardar_Puntaje.nombre_letra3 = nl_3.text
				
		##### Suma o resta letra_posicion para sabe la letra que se modifica ####
		if Input.is_action_just_pressed("ui_left"):
			letra_posicion -= 1
		elif Input.is_action_just_pressed("ui_right"):
			letra_posicion += 1
			
		###### Inicia el parpadeo de la letra seleccionada ######
		if letra_posicion == 0:
			if ver == true:
				visible_1.start()
				ver = false
		elif letra_posicion == 1:
			if ver == true:
				visible_1.start()
				ver = false
		elif letra_posicion == 2:
			if  ver == true:
				visible_1.start()
				ver = false
		else:
			visible_1.stop()
			invisible_1.stop()
			ver = true
		##### Hace la letra visibile si no esta seleccioada #####
		if letra_posicion != 0:
			nl_1.visible = true
		if letra_posicion != 1:
			nl_2.visible = true
		if letra_posicion != 2:
			nl_3.visible = true
		
		
######## Asigna el formato del tiempo en mm:ss ########
func formato_de_tiempo():
	####### Divide el contador(300) en 60 (5 minutos) #######
	var minutos = tiempo / 60
	var segundos = tiempo % 60
	######## asigna al texto del label el formato 
	t.text = str(minutos).pad_zeros(2) + ":" + str(segundos).pad_zeros(2)
	
	
########### Asigna el valor al puntaje obenido #######
func nuevo_puntaje():
	
	#### Actualiza las variables para que sean correspondientes a cada partida ###
	### registra los el nombre del nivel ###
	n.text = nivel
	##### registra el tiempo restante ######
	formato_de_tiempo()
	### registra el numero de niveles completados ###
	nc.text = str(niveles_completados)
	###  registra el puntaje objetido ###
	p.text = str(puntaje).lpad(8,"0")
	
	
	
func _on_visible_timeout():
	
	if letra_posicion == 0:
		nl_1.visible = true
	elif letra_posicion == 1:
		nl_2.visible = true
	elif letra_posicion == 2:
		nl_3.visible = true
	invisible_1.start()
	visible_1.stop()
	
	
func _on_invisible_timeout():
	
	if  letra_posicion == 0:
		nl_1.visible = false
	elif letra_posicion == 1:
		nl_2.visible = false
	elif  letra_posicion == 2:
		nl_3.visible = false
	ver = true
	visible_1.start()
	invisible_1.stop()
