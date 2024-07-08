class_name GameOverEffect
extends Effect

var loser: Player
var winner: Player


func _init(_loser: Player, _winner: Player) -> void:
	super()
	loser = _loser
	winner = _winner
