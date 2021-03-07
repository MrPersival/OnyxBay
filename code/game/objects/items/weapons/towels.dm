/obj/item/weapon/towel
	name = "towel"
	icon = 'icons/obj/weapons.dmi'
	icon_state = "towel"
	item_flags = ITEM_FLAG_IS_BELT
	slot_flags = SLOT_HEAD | SLOT_BELT | SLOT_OCLOTHING
	force = 0.5
	w_class = ITEM_SIZE_NORMAL
	mod_weight = 0.5
	mod_reach = 0.75
	mod_handy = 0.25
	attack_verb = list("whipped")
	hitsound = 'sound/weapons/towelwhip.ogg'
	desc = "A soft cotton towel."

/obj/item/weapon/towel/attack_self(mob/living/user as mob)
	user.visible_message(text("<span class='notice'>[] uses [] to towel themselves off.</span>", user, src))
	playsound(user, 'sound/weapons/towelwipe.ogg', 25, 1)

/obj/item/weapon/towel/random/New()
	..()
	color = get_random_colour()

/obj/item/weapon/towel/fleece // loot from the king of goats. it's a golden towel
	name = "golden fleece"
	desc = "The legendary Golden Fleece of Jason made real."
	color = "#ffd700"
	force = 1
	attack_verb = list("smote")

/obj/item/skin
	icon = 'icons/obj/items.dmi'
	w_class = ITEM_SIZE_NORMAL
	desc = "That is a skin of an animal."

/obj/item/skin/goat
	name = "goat hide"
	desc = "A goat hide."
	icon_state = "goatskin"

/obj/item/skin/goat/attackby(obj/item/weapon/W, mob/user)
	..()
	if(W.sharp && W.edge)
		to_chat(user, SPAN_NOTICE("You use /the [W] to make [src] more wearable."))
		new /obj/item/clothing/suit/storage/hooded/goatskincape(get_turf(loc))
		qdel(src)
		return

