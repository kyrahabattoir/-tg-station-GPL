/mob/living/carbon/slime/death(gibbed)
	if(!gibbed)
		if(is_adult)
			var/mob/living/carbon/slime/M = new /mob/living/carbon/slime(loc)
			M.colour = colour
			M.rabid = 1
			is_adult = 0
			maxHealth = 150
			revive()
			regenerate_icons()
			number = rand(1, 1000)
			name = "[colour] [is_adult ? "adult" : "baby"] slime ([number])"
			return

	if(stat == DEAD)	return
	stat = DEAD
	icon_state = "[colour] baby slime dead"
	overlays.len = 0
	visible_message("<b>The [name]</b> seizes up and falls limp...") //ded -- Urist

	update_canmove()
	if(blind)	blind.invisibility = 101

	if(ticker && ticker.mode)
		ticker.mode.check_win()

	return ..(gibbed)