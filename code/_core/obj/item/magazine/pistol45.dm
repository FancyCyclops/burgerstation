/obj/item/magazine/pistol_45
	name = "\improper .45 pistol magazine"
	icon = 'icons/obj/items/magazine/45pistol.dmi'
	icon_state = "45"
	bullet_count_max = 7

	weapon_whitelist = list(
		/obj/item/weapon/ranged/bullet/magazine/pistol/tactical,
		/obj/item/weapon/ranged/bullet/magazine/pistol/tactical/mod
	)

	bullet_length_min = 20
	bullet_length_best = 23
	bullet_length_max = 24

	bullet_diameter_min = 11
	bullet_diameter_best = 11.43
	bullet_diameter_max = 12

	ammo = /obj/item/bullet_cartridge/pistol_45

/obj/item/magazine/pistol_45/update_icon()
	icon_state = "[initial(icon_state)]_[length(stored_bullets)]"
	..()

/*
/obj/item/magazine/pistol_45/surplus
	name = "\improper surplus .45 pistol magazine"

	ammo = /obj/item/bullet_cartridge/pistol_45/surplus

/obj/item/magazine/pistol_45/rubber
	name = "\improper rubber .45 pistol magazine"

	ammo = /obj/item/bullet_cartridge/pistol_45/rubber
*/