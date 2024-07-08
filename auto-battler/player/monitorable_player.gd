@tool
class_name MonitorablePlayer
extends Monitorable

@export var card_count: int = 0:
	set(value):
		card_count = value
		_set("card_count", value)
