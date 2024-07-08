class_name AttackEffect
extends Effect

var source: Card
var target: Card
var damage: int


func _init(_source: Card, _target: Card, _damage: int ) -> void:
	super()
	source = _source
	target = _target
	damage = _damage
