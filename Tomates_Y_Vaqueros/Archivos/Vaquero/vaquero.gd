extends CharacterBody2D

var velocidad = 40
var muerto = true
@onready var vaquero_S = $Vaquero_S
@onready var  vaquero_AP = $Vaquero_AP
@onready var vaquero_VA = $Velocidad/Acelerada
@onready var vaquero_VN = $Velocidad/Normal
@onready var vaquero_muerto = $Vaquero_Muerto

const  bala = preload("res://Archivos/Proyectiles/Bala/bala.tscn")
const menu_puntuacion = preload("res://Archivos/Interfaz_Usuario/Menus/Menu_Puntuacion/menu_puntuación.tscn")

const p = preload("res://Archivos/Interfaz_Usuario/Menus/Menu_Puntuacion/menu_puntuación.tscn")


func _ready():
	
	######## da vida al vaquero ########
	Estadisticas_Vaquero.estado_vivo = true
	######## inicia la animación normal ###########
#	vaquero_AP.play("Disparar_Regular")
	######## Inicia el emporizador de acelerar velocidad ######
	vaquero_VA.start()
	
	
func _physics_process(_delta):
	
	if Estadisticas_Vaquero.vida > 0:
			################## Movimiento del Personaje ###############
		velocity.x = Input.get_axis("ui_left", "ui_right")
		velocity.y = Input.get_axis("ui_up", "ui_down")
		velocity = velocity.normalized() * velocidad
	
		move_and_slide()
	############ Rotación del Characterbody (Rota toda la escena) #############
		if Input.is_action_just_pressed("ui_down"):
			self.rotation_degrees = 180
		elif Input.is_action_just_pressed("ui_left"):
			self.rotation_degrees = -90
		elif  Input.is_action_just_pressed("ui_right"):
			self.rotation_degrees = 90
		elif Input.is_action_just_pressed("ui_up"):
			self.rotation_degrees = 0
		
	######### Activar disparar rotatorio ##########
		if Estadisticas_Vaquero.poder >= 10:
			vaquero_AP.play("Disparar_Rotar")
			Estadisticas_Vaquero.estado_especial = true
		elif Estadisticas_Vaquero.poder <= 0:
			vaquero_AP.play("Disparar_Regular")
			Estadisticas_Vaquero.estado_especial = false
	############ Muere vaquero ###############
	else:
		### bloquea el movimiento ###
		velocity.x = 0
		velocity.y = 0
		### reproduce la animación de morir ###
		vaquero_AP.play("Morir")
		Estadisticas_Vaquero.estado_vivo = false
		##### Guarda los datos al morir y los carga parra ######
		##### actualizar la tabla de puntuación anrtes de ######
		##### instanciarla #####
		Guardar_Puntaje.guardar_datos()
		Guardar_Puntaje.cargar_datos()
		if muerto == true:
			vaquero_muerto.play()
			muerto = false
		
		
####### Función para instanciar la bala de la pistola derecha #######
func disparar_derecha():
	
	############## Instanciar bala ####################
	var disparar = bala.instantiate()
	get_parent().add_child(disparar)
	############### Aparecer bala en las posiciones (4,-13)################
	disparar.position = vaquero_S.to_global(Vector2i(4, - 13))
	######## Rota la dirección de la bala hacia donde mira el vaquero #######
	disparar.rotation_degrees = self.rotation_degrees
	
	
####### Función para instanciar la bala de la pistola izquierda #######
func disparar_izquierda():
	
	############## Instanciar bala ####################
	var disparar = bala.instantiate()
	get_parent().add_child(disparar)
	############### Aparecer bala en las posiciones (-4,-13) ##############
	disparar.position = vaquero_S.to_global(Vector2i(-4, - 13))
	######## Rota la dirección de la bala hacia donde mira el vaquero #######
	disparar.rotation_degrees = self.rotation_degrees
	
	
func disparar_0d():
	
	self.rotation_degrees = 90
	var disparar = bala.instantiate()
	get_parent().add_child(disparar)
	############### Aparecer bala en las posiciones (0,-14) ##############
	disparar.position = vaquero_S.to_global(Vector2i(0, -14))
	######## Rota la dirección de la bala hacia donde mira el vaquero #######
	disparar.rotation_degrees = self.rotation_degrees
	
	
func disparar_i0():
	
	self.rotation_degrees = -90
	var disparar = bala.instantiate()
	get_parent().add_child(disparar)
	############### Aparecer bala en las posiciones (0,-14) ##############
	disparar.position = vaquero_S.to_global(Vector2i(0, -14))
	######## Rota la dirección de la bala hacia donde mira el vaquero #######
	disparar.rotation_degrees = self.rotation_degrees
	
	
func disparar_d45():
	
	self.rotation_degrees = 135
	var disparar = bala.instantiate()
	get_parent().add_child(disparar)
	############### Aparecer bala en las posiciones (-13,-13) ##############
	disparar.position = vaquero_S.to_global(Vector2i(-13, -13))
	######## Rota la dirección de la bala hacia donde mira el vaquero #######
	disparar.rotation_degrees = self.rotation_degrees
	
	
func disparar_i45():
	
	self.rotation_degrees = -45
	var disparar = bala.instantiate()
	get_parent().add_child(disparar)
	############### Aparecer bala en las posiciones (-4,-13) ##############
	disparar.position = vaquero_S.to_global(Vector2i(-13, -13))
	######## Rota la dirección de la bala hacia donde mira el vaquero #######
	disparar.rotation_degrees = self.rotation_degrees
	
	
func disparar_90d():
	
	self.rotation_degrees = 180
	var disparar = bala.instantiate()
	get_parent().add_child(disparar)
	############### Aparecer bala en las posiciones (1,-14) ##############
	disparar.position = vaquero_S.to_global(Vector2i(1, -14))
	######## Rota la dirección de la bala hacia donde mira el vaquero #######
	disparar.rotation_degrees = self.rotation_degrees
	
	
func disparar_90i():
	
	self.rotation_degrees = 0
	var disparar = bala.instantiate()
	get_parent().add_child(disparar)
	############### Aparecer bala en las posiciones (1,-14) ##############
	disparar.position = vaquero_S.to_global(Vector2i(1, -14))
	######## Rota la dirección de la bala hacia donde mira el vaquero #######
	disparar.rotation_degrees = self.rotation_degrees
	
	
func disparar_135d():
	
	self.rotation_degrees = 225
	var disparar = bala.instantiate()
	get_parent().add_child(disparar)
	############### Aparecer bala en las posiciones (-4,-13) ##############
	disparar.position = vaquero_S.to_global(Vector2i(13, -13))
	######## Rota la dirección de la bala hacia donde mira el vaquero #######
	disparar.rotation_degrees = self.rotation_degrees
	
	
func disparar_135i():
	
	self.rotation_degrees = 45
	var disparar = bala.instantiate()
	get_parent().add_child(disparar)
	############### Aparecer bala en las posiciones (-4,-13) ##############
	disparar.position = vaquero_S.to_global(Vector2i(4, -13))
	######## Rota la dirección de la bala hacia donde mira el vaquero #######
	disparar.rotation_degrees = self.rotation_degrees
	
	
func _on_lesion_area_entered(_area):
	###### Le resta vida al vaquero ########
	Estadisticas_Vaquero.vida -= 1
	
	
func _on_acelerada_timeout():
	##### Aumenta la velocidad del vaquero ######
	velocidad = 60
	vaquero_VN.start()
	
	
func _on_normal_timeout():
	##### Regresa la velocidad a el valor notmal ####
	velocidad = 40
	vaquero_VA.start()


func _on_vaquero_muerto_finished():
	
	##### Instancia el menu de puntuación #####
	var tabla_puntuacion = menu_puntuacion.instantiate()
	get_parent().call_deferred("add_child", tabla_puntuacion)
	####### Libera la escena al morir ########
	queue_free()
