class_name KillCardEffect
extends Effect

var target: Card


func _init(_target: Card) -> void:
	super()
	target = _target
