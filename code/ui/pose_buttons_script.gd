extends Node2D

@onready var stand_button = $Stand
@onready var crouch_button = $Crouch
@onready var crawl_button = $Crawl

func _ready():
	stand_button.initialize(
		func():
			_is_crouch = false
			_is_crawl = false)
	crouch_button.initialize(
		func():
			_is_crouch = !_is_crouch
			_is_crawl = false)
	crawl_button.initialize(
		func():
			_is_crawl = !_is_crawl
			_is_crouch = false)

var _is_crouch = false
var _is_crawl = false

func is_crouch():
	return _is_crouch

func is_crawl():
	return _is_crawl
