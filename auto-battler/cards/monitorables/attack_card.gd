@tool
class_name AttackCard
extends Monitorable

signal damage_update(value)
@export var damage: int = 0:
	set(value):
		damage = value
		damage_update.emit(value)
		_set("damage", damage)


func attack_animation(target: Card):
	var card = holder as Card
	var original_position = card.global_position
	var offset := target.size / 2
	offset *= sign(target.global_position - original_position) 
	
	card.z_index += 1
	
	var tween := create_tween().set_ease(Tween.EASE_IN).set_trans(Tween.TRANS_BACK)
	tween.tween_property(card, "global_position", target.global_position - offset, 0.5)
	tween.tween_property(card, "global_position", original_position, 0.3)
	await tween.finished
	
	card.z_index -= 1


func get_next_target(game: Game) -> Card:
	var enemy_cards := game.get_enemy_cards(holder.player)
	var closest_target: Card
	var closest_dist: float = INF
	for card in enemy_cards:
		if holder.global_position.distance_to(card.global_position) < closest_dist:
			closest_target = card
	return closest_target
