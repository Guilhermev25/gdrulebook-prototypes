class_name SpawnEffect
extends Effect

var packed_card: PackedScene


func _init(_packed_card: PackedScene) -> void:
	super()
	packed_card = _packed_card
