extends Node

const MOD_DIR = "RobocrafterLP-ItemSelling/"
const MYMODNAME_LOG = "RobocrafterLP-ItemSelling"

var dir = ""
var ext_dir = ""
var trans_dir = ""
var ui_dir = ""
var menus_dir = ""
var shop_dir = ""
var singletons_dir = ""

func _init(modLoader = ModLoader):
	ModLoaderUtils.log_info("Init", MYMODNAME_LOG)
	dir = modLoader.UNPACKED_DIR + MOD_DIR
	ext_dir = dir + "extensions/"
	trans_dir = dir + "translations/"
	ui_dir = ext_dir + "ui/"
	menus_dir = ui_dir + "menus/"
	shop_dir = menus_dir + "shop/"
	singletons_dir = ext_dir + "singletons/"
	# Add extensions
	# ModLoaderUtils.log_info("Loaded " + ext_dir + "main.gd", MYMODNAME_LOG)
	modLoader.install_script_extension(ext_dir + "global/inventory_element.gd")
	modLoader.install_script_extension(shop_dir + "inventory.gd")
	modLoader.install_script_extension(shop_dir + "item_popup.gd")
	modLoader.install_script_extension(singletons_dir + "debug_service.gd")
	modLoader.install_script_extension(ui_dir + "global/focus_manager.gd")

	# Add translations

func _ready():
	var ContentLoader = get_node("/root/ModLoader/Darkly77-ContentLoader/ContentLoader")

	# Difficulties
	ModLoaderUtils.log_info("Done", MYMODNAME_LOG)
