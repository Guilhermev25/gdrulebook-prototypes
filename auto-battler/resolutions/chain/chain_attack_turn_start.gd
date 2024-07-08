extends Resolution


func _resolve():
	var game := get("game") as Game
	var source := get("source") as Card
	var target := (source.get("AttackCard") as AttackCard).get_next_target(game)
	var damage := (source.get("AttackCard") as AttackCard).damage
	
	(rulebook as CompiledRulebook).enqueue_effect(AttackEffect.new(source, target, damage))
