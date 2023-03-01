extends Shop

func _ready()->void :
	var _error_discard_weapon = _item_popup.connect(
		"weapon_discard_button_pressed", self, "on_weapon_discard_button_pressed"
	)
	var _error_cancel_weapon = _item_popup.connect(
		"weapon_cancel_button_pressed", self, "on_weapon_cancel_button_pressed"
	)
	
func on_weapon_discard_button_pressed(weapon_data:ItemData)->void :
	RunData.add_recycled()
	_focus_manager.reset_focus()
	_items_container._elements.remove_element2(weapon_data,true)
	RunData.remove_item(weapon_data)
	RunData.add_gold(ItemService.get_recycling_value(RunData.current_wave, weapon_data.value, true))

	if RunData.get_nb_item("item_recycling_machine") > 0:
		var value = ItemService.get_value(RunData.current_wave, weapon_data.value, true, true)
		RunData.tracked_item_effects["item_recycling_machine"] += (value * (RunData.effects["recycling_gains"] / 100.0)) as int

	var nb_coupons = RunData.get_nb_item("item_coupon")

	if nb_coupons > 0:
		var base_value = ItemService.get_recycling_value(
			RunData.current_wave, weapon_data.value, true, false
		)
		var actual_value = ItemService.get_recycling_value(
			RunData.current_wave, weapon_data.value, true
		)
		RunData.tracked_item_effects["item_coupon"] -= (base_value - actual_value) as int

	reset_item_popup_focus()
	_shop_items_container.update_buttons_color()
	_reroll_button.set_color_from_currency(RunData.gold)
	SoundManager.play(Utils.get_rand_element(recycle_sounds), 0, 0.1, true)

func on_weapon_cancel_button_pressed(weapon_data:ItemData)->void :
	_focus_manager.reset_focus()
	_block_background.hide()
	if $Content.visible:
		_items_container._elements.focus_element(weapon_data)
