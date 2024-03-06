extends Node2D

@onready var stand_button = $Stand
@onready var crouch_button = $Crouch
@onready var crawl_button = $Crawl

func _ready():
	stand_button.initialize(
		func():
			_is_crouch = false
			_is_crawl = false
			stand_button.visible = false
			crouch_button.visible = true
			crawl_button.visible = false)
	crouch_button.initialize(
		func():
			_is_crouch = true
			_is_crawl = false
			stand_button.visible = true
			crouch_button.visible = false
			crawl_button.visible = true)
	crawl_button.initialize(
		func():
			_is_crawl = true
			_is_crouch = false
			stand_button.visible = false
			crouch_button.visible = true
			crawl_button.visible = false)

var _is_crouch = false
var _is_crawl = false

func is_crouch():
	return _is_crouch

func is_crawl():
	return _is_crawl
