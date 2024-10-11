extends Control

func _ready() -> void:
	Savefile.load()
	
func _on_start_button_pressed() -> void:
	$Transition.play("transition")
	Global.animation_playing = true
	disable_buttons()
	await $Transition.animation_finished
	Global.animation_playing = false
	get_tree().change_scene_to_file("res://world.tscn")

func _on_credits_button_pressed() -> void:
	$Transition.play("transition")
	Global.animation_playing = true
	disable_buttons()
	await $Transition.animation_finished
	Global.animation_playing = false
	get_tree().change_scene_to_file("res://credits.tscn")

func _on_exit_button_pressed() -> void:
	$Transition.play("transition")
	Global.animation_playing = true
	disable_buttons()
	await $Transition.animation_finished
	Global.animation_playing = false
	get_tree().quit()
	
func disable_buttons():
	#disables all buttons to prevent them being pressed while changing scenes
	$Background/ExitButton.disabled = true
	$Background/StartButton.disabled = true
	$Background/CreditsButton.disabled = true
