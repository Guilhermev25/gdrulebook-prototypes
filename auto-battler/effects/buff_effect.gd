class_name BuffEffect
extends Effect

var source: Card
var target: Card
var variation: Vector2


func _init(_source: Card, _target: Card, _variation: Vector2) -> void:
	super()
	source = _source
	target = _target
	variation = _variation
