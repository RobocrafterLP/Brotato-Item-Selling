extends ItemPopup

signal weapon_discard_button_pressed(item_data)
signal weapon_cancel_button_pressed(item_data)

func display_element(element:InventoryElement)->void :
	.display_element(element)
	if element.item is WeaponData and buttons_active:
		_combine_button.show()
		if not RunData.can_combine(element.item):
			_combine_button.hide()
		_discard_button.show()
		_cancel_button.show()
	elif element.item is ItemData and buttons_active and not "character" in element.item.my_id:
		_combine_button.hide()
		_discard_button.show()
		_cancel_button.show()
	else :
		_combine_button.hide()
		_discard_button.hide()
		_cancel_button.hide()
	show()


func _input(event:InputEvent)->void :
	if event.is_action_pressed("ui_cancel"):
		if _item_displayed is ItemData:
			emit_signal("weapon_cancel_button_pressed", _item_displayed)
		elif _item_displayed is WeaponData:
			emit_signal("item_cancel_button_pressed", _item_displayed)

func _on_DiscardButton_pressed()->void :
	if _item_displayed is ItemData:
		emit_signal("weapon_discard_button_pressed", _item_displayed)
	elif _item_displayed is WeaponData:
		emit_signal("item_discard_button_pressed", _item_displayed)

func _on_CancelButton_pressed()->void :
	if _item_displayed is ItemData:
		emit_signal("weapon_cancel_button_pressed", _item_displayed)
	elif _item_displayed is WeaponData:
		emit_signal("item_cancel_button_pressed", _item_displayed)
