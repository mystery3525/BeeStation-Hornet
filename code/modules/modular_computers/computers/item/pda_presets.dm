/obj/item/modular_computer/tablet/pda/clown
	name = "clown PDA"
	desc = "A portable microcomputer by Thinktronic Systems, LTD. The surface is coated with polytetrafluoroethylene and banana drippings."
	note = "Honk!"
	default_disk = /obj/item/computer_hardware/hard_drive/role/virus/clown
	icon_state = "pda-clown"
	insert_type = /obj/item/toy/crayon/rainbow
	/// List of victims (of a very funny joke, that everyone loves!). Stores references to mobs.
	var/list/slip_victims = list()
	init_ringtone = "honk"
	var/cached_name

/obj/item/modular_computer/tablet/pda/clown/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/slippery, 7 SECONDS, NO_SLIP_WHEN_WALKING, CALLBACK(src, PROC_REF(AfterSlip)), 5 SECONDS)

/obj/item/modular_computer/tablet/pda/clown/install_modpc_hardware(obj/item/mainboard/MB)
	. = ..()
	MB.device_theme = THEME_NTOS_CLOWN_PINK
	MB.ignore_theme_pref = TRUE

/obj/item/modular_computer/tablet/pda/clown/proc/AfterSlip(mob/living/carbon/human/M)
	if (!istype(M) || (M.real_name == mainboard.saved_identification()))
		return
	slip_victims |= REF(M)
	var/obj/item/computer_hardware/hard_drive/role/virus/clown/cart = mainboard.all_components[MC_HDD_JOB]
	if(istype(cart) && cart.charges < 5)
		cart.charges++
		playsound(src,'sound/machines/ping.ogg',30,TRUE)

/obj/item/modular_computer/tablet/pda/mime
	name = "mime PDA"
	desc = "A portable microcomputer by Thinktronic Systems, LTD. The hardware has been modified for compliance with the vows of silence."
	default_disk = /obj/item/computer_hardware/hard_drive/role/virus/mime
	insert_type = /obj/item/toy/crayon/mime
	init_ringer_on = FALSE
	init_ringtone = "silence"

/obj/item/modular_computer/tablet/pda/mime/install_modpc_software(obj/item/computer_hardware/hard_drive/hard_drive)
	. = ..()

	for(var/datum/computer_file/program/messenger/msg in hard_drive.stored_files)
		msg.mime_mode = TRUE
		msg.allow_emojis = TRUE

/obj/item/modular_computer/tablet/pda/assistant
	name = "assistant PDA"
	icon_state = "pda-assistant"

/obj/item/modular_computer/tablet/pda/medical
	name = "medical PDA"
	default_disk = /obj/item/computer_hardware/hard_drive/role/medical
	icon_state = "pda-medical"

/obj/item/modular_computer/tablet/pda/paramedic
	name = "paramedic PDA"
	default_disk = /obj/item/computer_hardware/hard_drive/role/medical
	icon_state = "pda-paramedical"

/obj/item/modular_computer/tablet/pda/virologist
	name = "virology PDA"
	default_disk = /obj/item/computer_hardware/hard_drive/role/medical
	icon_state = "pda-virology"

/obj/item/modular_computer/tablet/pda/station_engineer
	name = "engineering PDA"
	default_disk = /obj/item/computer_hardware/hard_drive/role/engineering
	icon_state = "pda-engineer"

/obj/item/modular_computer/tablet/pda/security
	name = "security PDA"
	default_disk = /obj/item/computer_hardware/hard_drive/role/security
	icon_state = "pda-security"

/obj/item/modular_computer/tablet/pda/deputy
	name = "deputy PDA"
	default_disk = /obj/item/computer_hardware/hard_drive/role/security
	icon_state = "pda-deputy"

/obj/item/modular_computer/tablet/pda/brig_physician
	name = "brig physician PDA"
	default_disk = /obj/item/computer_hardware/hard_drive/role/brig_physician
	icon_state = "pda-brigphys"


/obj/item/modular_computer/tablet/pda/detective
	name = "detective PDA"
	default_disk = /obj/item/computer_hardware/hard_drive/role/detective
	icon_state = "pda-detective"

/obj/item/modular_computer/tablet/pda/warden
	name = "warden PDA"
	default_disk = /obj/item/computer_hardware/hard_drive/role/security
	icon_state = "pda-warden"

/obj/item/modular_computer/tablet/pda/janitor
	name = "janitor PDA"
	default_disk = /obj/item/computer_hardware/hard_drive/role/janitor
	icon_state = "pda-janitor"
	init_ringtone = "slip"

/obj/item/modular_computer/tablet/pda/science
	name = "scientist PDA"
	default_disk = /obj/item/computer_hardware/hard_drive/role/signal/toxins
	icon_state = "pda-science"
	init_ringtone = "boom"

/obj/item/modular_computer/tablet/pda/science
	pda_components = list(/obj/item/computer_hardware/radio_card)

/obj/item/modular_computer/tablet/pda/service
	name = "service PDA"
	icon_state = "pda-service"

/obj/item/modular_computer/tablet/pda/heads
	default_disk = /obj/item/computer_hardware/hard_drive/role/head
	icon_state = "pda-heads"
	pda_components = list(/obj/item/computer_hardware/id_slot/secondary)

/obj/item/modular_computer/tablet/pda/heads/head_of_personnel
	name = "head of personnel PDA"
	default_disk = /obj/item/computer_hardware/hard_drive/role/hop
	icon_state = "pda-hop"
	pda_components = list(
		/obj/item/computer_hardware/id_slot/secondary,
		/obj/item/computer_hardware/printer/mini
	)

/obj/item/modular_computer/tablet/pda/heads/head_of_security
	name = "head of security PDA"
	default_disk = /obj/item/computer_hardware/hard_drive/role/hos
	icon_state = "pda-hos"

/obj/item/modular_computer/tablet/pda/heads/chief_engineer
	name = "chief engineer PDA"
	default_disk = /obj/item/computer_hardware/hard_drive/role/ce
	icon_state = "pda-ce"

/obj/item/modular_computer/tablet/pda/heads/chief_medical_officer
	name = "chief medical officer PDA"
	default_disk = /obj/item/computer_hardware/hard_drive/role/cmo
	icon_state = "pda-cmo"

/obj/item/modular_computer/tablet/pda/heads/research_director
	name = "research director PDA"
	default_disk = /obj/item/computer_hardware/hard_drive/role/rd
	insert_type = /obj/item/pen/fountain
	icon_state = "pda-rd"
	pda_components = list(
		/obj/item/computer_hardware/id_slot/secondary,
		/obj/item/computer_hardware/radio_card
	)

/obj/item/modular_computer/tablet/pda/heads/captain
	name = "captain PDA"
	desc = "A portable microcomputer by Thinktronic Systems, LTD. The internals are modified to be more tough than the usual."
	default_disk = /obj/item/computer_hardware/hard_drive/role/captain
	insert_type = /obj/item/pen/fountain/captain
	icon_state = "pda-captain"
	detonatable = FALSE

/obj/item/modular_computer/tablet/pda/cargo_technician
	name = "cargo technician PDA"
	default_disk = /obj/item/computer_hardware/hard_drive/role/cargo_technician
	icon_state = "pda-cargo"
	pda_components = list(/obj/item/computer_hardware/printer/mini)

/obj/item/modular_computer/tablet/pda/quartermaster
	name = "quartermaster PDA"
	default_disk = /obj/item/computer_hardware/hard_drive/role/quartermaster
	insert_type = /obj/item/pen/fountain
	icon_state = "pda-qm"
	pda_components = list(/obj/item/computer_hardware/printer/mini)

/obj/item/modular_computer/tablet/pda/shaft_miner
	name = "shaft miner PDA"
	icon_state = "pda-miner"

/obj/item/modular_computer/tablet/pda/exploration_crew
	name = "exploration crew PDA"
	icon_state = "pda-exploration"

/obj/item/modular_computer/tablet/pda/syndicate
	name = "military PDA"
	desc = "A portable microcomputer by Thinktronic Systems, LTD. This model is a WGW-XL-NTOS series."
	note = "Congratulations, your -corrupted- has chosen the Thinktronic 5290 WGW-XL-NTOS Series Personal Data Assistant!"
	default_disk = /obj/item/computer_hardware/hard_drive/role/virus/syndicate/military
	icon_state = "pda-syndi"
	messenger_invisible = TRUE
	detonatable = FALSE
	syndicate_themed = TRUE

/obj/item/modular_computer/tablet/pda/syndicate/install_modpc_hardware(obj/item/mainboard/MB)
	. = ..()
	var/obj/item/computer_hardware/network_card/network_card = MB.all_components[MC_NET]
	if(istype(network_card))
		MB.forget_component(network_card)
		MB.install_component(new /obj/item/computer_hardware/network_card/advanced/norelay)
	MB.update_id_display("John Doe", "Citizen")

/obj/item/modular_computer/tablet/pda/chaplain
	name = "chaplain PDA"
	icon_state = "pda-chaplain"
	init_ringtone = "holy"

/obj/item/modular_computer/tablet/pda/lawyer
	name = "lawyer PDA"
	default_disk = /obj/item/computer_hardware/hard_drive/role/lawyer
	insert_type = /obj/item/pen/fountain
	icon_state = "pda-lawyer"
	init_ringtone = "objection"

/obj/item/modular_computer/tablet/pda/roboticist
	name = "roboticist PDA"
	default_disk = /obj/item/computer_hardware/hard_drive/role/roboticist
	icon_state = "pda-roboticist"

/obj/item/modular_computer/tablet/pda/curator
	name = "curator PDA"
	desc = "A portable microcomputer by Thinktronic Systems, LTD. This model is a WGW-11-NTOS series e-reader."
	note = "Congratulations, your station has chosen the Thinktronic 5290 WGW-11-NTOS Series E-reader and Personal Data Assistant!"
	default_disk = /obj/item/computer_hardware/hard_drive/role/curator
	icon_state = "pda-library"
	insert_type = /obj/item/pen/fountain
	init_ringtone = "silence"
	init_ringer_on = FALSE

/obj/item/modular_computer/tablet/pda/clear
	name = "clear PDA"
	desc = "A portable microcomputer by Thinktronic Systems, LTD. This model is a special edition with a transparent case."
	note = "Congratulations, you have chosen the Thinktronic 5230-NTOS Personal Data Assistant Deluxe Special Max Turbo Limited Edition!"
	icon_state = "pda-clear"

/obj/item/modular_computer/tablet/pda/cook
	name = "cook PDA"
	icon_state = "pda-cook"

/obj/item/modular_computer/tablet/pda/bartender
	name = "bartender PDA"
	insert_type = /obj/item/pen/fountain
	icon_state = "pda-bartender"

/obj/item/modular_computer/tablet/pda/atmospheric_technician
	name = "atmospherics PDA"
	default_disk = /obj/item/computer_hardware/hard_drive/role/atmos
	icon_state = "pda-atmos"

/obj/item/modular_computer/tablet/pda/chemist
	name = "chemist PDA"
	default_disk = /obj/item/computer_hardware/hard_drive/role/chemistry
	icon_state = "pda-chemistry"

/obj/item/modular_computer/tablet/pda/geneticist
	name = "geneticist PDA"
	default_disk = /obj/item/computer_hardware/hard_drive/role/medical
	icon_state = "pda-genetics"

/obj/item/modular_computer/tablet/pda/vip
	name = "fancy PDA"
	desc = "A portable microcomputer by Thinktronic Systems, LTD. This model is a gold-plated 5230-NTOS LRP Series, and probably quite expensive."
	note = "Congratulations, you have chosen the Thinktronic 5230-NTOS LRP Series Personal Data Assistant Golden Edition!"
	default_disk = /obj/item/computer_hardware/hard_drive/role/vip
	insert_type = /obj/item/pen/fountain
	icon_state = "pda-gold"
	init_ringtone = "ch-CHING"

/obj/item/modular_computer/tablet/pda/unlicensed
	name = "unlicensed PDA"
	desc = "A shitty knockoff of a portable microcomputer by Thinktronic Systems, LTD. Complete with a cracked operating system."
	note = "Error: Unlicensed software detected. Please contact your supervisor."
	default_disk = /obj/item/computer_hardware/hard_drive/role/maint
	icon_state = "pda-knockoff"
