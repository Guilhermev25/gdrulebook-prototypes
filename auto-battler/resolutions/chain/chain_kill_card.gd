extends Resolution


func _resolve():
	var card := get("card") as Card
	
	(rulebook as CompiledRulebook).enqueue_effect(KillCardEffect.new(card), true)
