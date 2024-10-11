extends Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	if Global.drill_level >= 1:
		$DrillTimer.start()
	$Background/Label.text = str("stone: ", Global.stone)
	
func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_cancel") && !Global.animation_playing:
		_on_settings_button_pressed()

func _on_stone_pressed() -> void:
	if Global.stone <= Global.stone_limit:
		Global.stone += Global.multiplier
		$Background/Label.text = str("stone: ", Global.stone)

func _on_shop_button_pressed() -> void:
	$Transition.play("transition")
	Global.animation_playing = true
	disable_buttons()
	await $Transition.animation_finished
	Global.animation_playing = false
	get_tree().change_scene_to_file("res://shop.tscn")

func _on_tower_button_pressed() -> void:
	$Transition.play("transition")
	Global.animation_playing = true
	disable_buttons()
	await $Transition.animation_finished
	Global.animation_playing = false
	get_tree().change_scene_to_file("res://tower.tscn")
	
func _on_settings_button_pressed() -> void:
	$Transition.play("transition")
	Global.animation_playing = true
	disable_buttons()
	await $Transition.animation_finished
	Global.animation_playing = false
	get_tree().change_scene_to_file("res://settings.tscn")
	
func _on_drill_timer_timeout() -> void:
	Global.stone += Global.drill_multiplier
	$Background/Label.text = str("stone: ", Global.stone)

func disable_buttons():
	#disables all buttons to prevent them being pressed while changing scenes
	$Background/ShopButton.disabled = true
	$Background/TowerButton.disabled = true
	$Background/SettingsButton.disabled = true
	
