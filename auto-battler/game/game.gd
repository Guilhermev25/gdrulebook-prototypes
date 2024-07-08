@tool
class_name Game
extends Control

var finish_game: bool = false
@export var combat_rulebook: String = ""
var rulebook: CompiledRulebook

# Called when the node enters the scene tree for the first time.
func _ready():
	if not Engine.is_editor_hint():
		rulebook = RulebooksManager.get_rulebook(combat_rulebook)
		while not finish_game:
			await turn()
		await get_tree().create_timer(2).timeout
		get_tree().quit()

# Overriding built-in virtual method
func _validate_property(property: Dictionary):
	if property.name == "combat_rulebook":
		property.hint = PROPERTY_HINT_ENUM
		property.hint_string = RulebooksManager.get_rulebook_hints()

# Overriding built-in virtual method
func _get_configuration_warnings() -> PackedStringArray:
	var warnings: PackedStringArray = []

	if combat_rulebook == "":
		warnings.append("Please set `Combat Rulebook` to a non-empty value.")
	
	return warnings


func turn():
	rulebook.enqueue_effect(TurnStartEffect.new())
	await rulebook.execute()
	rulebook.enqueue_effect(TurnEndEffect.new())
	await rulebook.execute()


func game_over(_winner: Player, _loser: Player):
	finish_game = true


func get_enemy_cards(player: Player) -> Array[Node]:
	if %TopPlayer == player:
		return %BottomPlayer.get_cards()
	else:
		return %TopPlayer.get_cards()
