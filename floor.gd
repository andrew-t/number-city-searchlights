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

var _from_z := -5
@export var from_z := -5:
	set(value):
		_from_z = value
		rebuild()
	get:
		return _from_z

var _to_z := 135
@export var to_z := 135:
	set(value):
		_to_z = value
		rebuild()
	get:
		return _to_z

var _odd_material: Material
@export var odd_material: Material:
	set(value):
		_odd_material = value
		rebuild()
	get:
		return _odd_material
		
var _even_material: Material
@export var even_material: Material:
	set(value):
		_even_material = value
		rebuild()
	get:
		return _even_material

func _ready():
	rebuild()

func rebuild():
	print("reubilding floor")
	for node in get_children(true):
		remove_child(node)
	for x in range(from_x, to_x): for z in range(from_z, to_z):
		var parity := ((x^z)&1) > 0
		var block := MeshInstance3D.new()
		block.mesh = BoxMesh.new()
		block.position = Vector3(x as float, -0.1, z as float)
		block.scale = Vector3(1.0, 0.2, 1.0)
		block.material_override = odd_material if parity else even_material
		add_child(block, false, Node.INTERNAL_MODE_BACK)
