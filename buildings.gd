@tool
extends Node3D
class_name Buildings

var _columns := 128
@export var columns := 128:
	set(value):
		_columns = value
		rebuild()
	get:
		return _columns

var _inner_size := 0.9
@export_range(0.1, 1.0) var inner_size := 0.9:
	set(value):
		_inner_size = value
		rebuild()
	get:
		return _inner_size

var _material: Material
@export var material: Material:
	set(value):
		_material = value
		rebuild()
	get:
		return _material
		
func _ready():
	rebuild()

func rebuild():
	print("reubilding")
	for node in get_children(true):
		remove_child(node)
	var p := primes(columns)
	print(p)
	for i in range(1, columns + 1):
		print("col ", i)
		var f := prime_factors(i, p)
		for j in range(f.size()):
			if f[j] == 0: continue
			print(" => ", p[j], " ^ ", f[j])
			var block := MeshInstance3D.new()
			block.mesh = BoxMesh.new()
			block.position = Vector3(i as float, inner_size * f[j] as float * 0.5, p[j] as float)
			block.scale = Vector3(inner_size, inner_size * f[j] as float, inner_size)
			block.material_override = material
			add_child(block, false, Node.INTERNAL_MODE_BACK)

func primes(to_n: int) -> Array:
	var p := Array()
	for i in range(2, to_n + 1):
		if divides_any(i, p): continue
		p.push_back(i)
	return p

func divides_any(n: int, divisors: Array) -> bool:
	for d in divisors: if not (n % d): return true
	return false

func prime_factors(n: int, p: Array) -> Array:
	var output := p.duplicate()
	var i := 0
	output.fill(0)
	while n > 1:
		while not (n % p[i]):
			n /= p[i]
			output[i] += 1
		i += 1
	return output
