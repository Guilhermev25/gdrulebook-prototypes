@tool
class_name IniciativeCard
extends Monitorable

@export var chain_effects: Array[Effect]

func get_chain_effects() -> Array[Effect]:
	return chain_effects
