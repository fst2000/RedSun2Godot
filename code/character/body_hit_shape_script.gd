class_name BodyHitShape
extends HitShape

@export var damage_mul = 1

func bullet_hit_action(bullet):
	#character.damage(bullet.damage * damage_mul)
	print("body_hit" + name)
