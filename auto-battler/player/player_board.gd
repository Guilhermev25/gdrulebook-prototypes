@tool
class_name Player
extends VBoxContainer


@export_enum("TOP", "BOTTOM") var side: String:
	set(value):
		side = value
		match side:
			"TOP":
				move_child(%Icon, 0)
				alignment = ALIGNMENT_BEGIN
			"BOTTOM":
				move_child(%Icon, get_child_count() - 1)
				alignment = ALIGNMENT_END


func _ready() -> void:
	if not Engine.is_editor_hint():
		for card in get_cards():
			card.player = self


func increase_card_count(_node: Node) -> void:
	%MonitorablePlayer.card_count += 1


func decrease_card_count(_node: Node) -> void:
	%MonitorablePlayer.card_count -= 1


func get_cards() -> Array[Node]:
	return %CardsContainer.get_children()
