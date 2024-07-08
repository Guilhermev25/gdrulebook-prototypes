@tool
class_name AttackableCard
extends Monitorable


signal health_update(value)
@export var health: int = 0:
	set(value):
		health = value
		health_update.emit(value)
		_set("health", value)


func damage_animation():
	var card = holder as Card
	var original_position: Vector2 = card.position
	var tween := create_tween().set_trans(Tween.TRANS_BOUNCE)
	var random_offset := Vector2(randi_range(-10, 10), randi_range(-10, 10))
	tween.tween_property(card, "position", card.position + random_offset, 0.1)
	tween.tween_property(card, "position", card.position - random_offset, 0.1)
	tween.tween_property(card, "position", original_position, 0.1)
	await tween.finished
