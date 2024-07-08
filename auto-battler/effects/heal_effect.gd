class_name HealEffect
extends Effect

var source: Card
var target: Card
var amount: int


func _init(_source: Card, _target: Card, _amount: int) -> void:
	super()
	source = _source
	target = _target
	amount = _amount
