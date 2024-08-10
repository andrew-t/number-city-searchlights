extends Node3D
class_name Puzzle

@export var min_n := 4
@export var max_n := 120
@export var min_p := 2
@export var camera_look_height := 1.0

@export_range(0.0, PI / 2.0) var min_light_pitch := 0.1
@export_range(0.0, PI / 2.0) var min_camera_pitch := 0.1

@onready var camera: Node3D = $CameraMount
@onready var light: Node3D = $SearchlightMount

var n: int
var p: int
var light_yaw: float
var light_pitch: float
var light_r := 11.0
var camera_yaw: float
var camera_pitch: float
var camera_y: float
var camera_r: float

func update():
	print("n = ", n)
	print("p = ", p)
	camera.position = Vector3(n as float, camera_look_height, p as float)
	light.position = Vector3(n as float, camera_y, p as float)
	# $Floor.position = Vector3(n as float, 0.0, p as float)
	print("light = ", light_yaw * 180 / PI, "°, ", light_pitch * 180 / PI, "°")
	print("camera = ", camera_yaw * 180 / PI, "°, ", camera_pitch * 180 / PI, "°")
	camera.rotation = Vector3(camera_pitch, camera_yaw, 0.0)
	light.rotation = Vector3(light_pitch, light_yaw, 0.0)
	$CameraMount/Camera.position.y = camera_r
	$SearchlightMount/Searchlight.position.y = light_r
	#camera.look_at(light.position, Vector3.UP)

func randomise():
	n = randi() % (max_n - min_n) + min_n
	p = max(randi() % (sqrt(n) as int), min_p)
	light_yaw = randf() * TAU
	light_pitch = randf() * (PI / 2.0 - min_light_pitch) + min_light_pitch
	camera_yaw = randf() * TAU
	camera_pitch = randf() * (PI / 2.0 - min_camera_pitch) + min_camera_pitch
	camera_y = 1.0
	camera_r = 16.0
	update()

func _ready():
	randomise()

func _process(delta):
	if Input.is_action_just_pressed("Randomise"):
		randomise()
	if Input.is_action_just_pressed("Increase N"):
		n += 1
		update()
	if Input.is_action_just_pressed("Decrease N"):
		n -= 1
		update()
	if Input.is_action_just_pressed("Increase P"):
		p += 1
		update()
	if Input.is_action_just_pressed("Decrease P"):
		p -= 1
		update()
	var cy := Input.get_axis("Camera down", "Camera up")
	if cy:
		camera_pitch += cy * 1.0 * delta
		if camera_pitch > PI / 2: camera_pitch = PI / 2
		if camera_pitch < 0.0: camera_pitch = 0.0
		update()
	var ly := Input.get_axis("Light down", "Light up")
	if ly:
		light_pitch += ly * 1.0 * delta
		if light_pitch > PI / 2: light_pitch = PI / 2
		if light_pitch < 0.0: light_pitch = 0.0
		update()
	var cx := Input.get_axis("Camera left", "Camera right")
	if cx:
		camera_yaw += cx * 1.0 * delta
		update()
	var lx := Input.get_axis("Light left", "Light right")
	if lx:
		light_yaw += lx * 1.0 * delta
		update()
	var cmy := Input.get_axis("Camera mount down", "Camera mount up")
	if cmy:
		camera_y += cmy * 1.0 * delta
		if camera_y < 0.0: camera_y = 0.0
		update()
	var z := Input.get_axis("Zoom out", "Zoom in")
	if z:
		camera_r += z * 5.0 * delta
		if camera_r < 0.0: camera_r = 0.0
		update()
	var lz := Input.get_axis("Less light", "More light")
	if lz:
		light_r -= lz * 3.0 * delta
		if light_r < 0.0: light_r = 0.0
		update()
	$"Darkroom Light".visible = Input.is_action_pressed("Darkroom light")
