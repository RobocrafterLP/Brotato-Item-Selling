extends FocusManager


func on_element_pressed(element:InventoryElement)->void :
	emit_signal("element_pressed", element)
	if  _item_popup and _item_popup.buttons_active:
		_element_hovered = element
		_element_focused = element
		_element_pressed = element
		_item_popup.display_element(element)
		_item_popup.focus()
