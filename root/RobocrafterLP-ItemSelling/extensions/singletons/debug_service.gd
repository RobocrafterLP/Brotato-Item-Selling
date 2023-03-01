extends "res://singletons/debug_service.gd"

const MOD_DIR = "RobocrafterLP-ItemSelling/"
var dir = ""
var ext_dir = ""
var trans_dir = ""
var ui_dir = ""
var menus_dir = ""
var shop_dir = ""

func _ready():
	dir = ModLoader.UNPACKED_DIR + MOD_DIR
	ext_dir = dir + "extensions/"
	trans_dir = dir + "translations/"
	ui_dir = ext_dir + "ui/"
	menus_dir = ui_dir + "menus/"
	shop_dir = menus_dir + "shop/"
	ModLoader.install_script_extension(shop_dir + "shop.gd")
	pass 
