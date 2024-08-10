@tool
extends Node3D
class_name Floor

var _from_x := -32
@export var from_x := -32:
	set(value):
		_from_x = value
		rebuild()
	get:
		return _from_x

var _to_x := 128
@export var to_x := 128:
	set(value):
		_to_x = value
		rebuild()
	get:
		return _to_x

var _from_z := -4
@export var from_z := -4:
	set(value):
		_from_z = value
		rebuild()
	get:
		return _from_z

var _to_z := 132
@export var to_z := 132:
	set(value):
		_to_z = value
		rebuild()
	get:
		return _to_z

var _tape_material: Material
@export var tape_material: Material:
	set(value):
		_tape_material = value
		rebuild()
	get:
		return _tape_material

var grass_model: Resource

func _ready():
	grass_model = preload("res://grass_block.tscn")
	rebuild()

func rebuild():
	if not grass_model: return
	print("reubilding floor")
	for node in get_children(true):
		remove_child(node)
	for x in range(from_x, to_x, 4): for z in range(from_z, to_z, 4):
		print("building floor at ", x, ", ", z)
		var grass_block: Node3D = grass_model.instantiate()
		grass_block.position = Vector3(x, 0.0, z)
		add_child(grass_block, false, Node.INTERNAL_MODE_BACK)
