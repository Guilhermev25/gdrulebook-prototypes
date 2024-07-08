extends Resolution


func _resolve():
	var effect := get("effect") as GameOverEffect
	var game := get("game") as Game
	
	game.game_over(effect.winner, effect.loser)
