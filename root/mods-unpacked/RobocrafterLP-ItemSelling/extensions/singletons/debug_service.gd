extends "res://singletons/debug_service.gd"

const ITEMSELLING_DIR = "RobocrafterLP-ItemSelling/"
func _ready():
	ModLoader.install_script_extension(ModLoader.UNPACKED_DIR + ITEMSELLING_DIR + "extensions/ui/menus/shop/shop.gd") 
