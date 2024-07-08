extends Resolution


func _resolve():
	var loser := get("loser") as Player
	var winner := get("winner") as Player
	
	(rulebook as CompiledRulebook).enqueue_effect(GameOverEffect.new(loser, winner), true)
