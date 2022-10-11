extends Node2D
#Global functions for the game, like speech bubbles and sounds

func RenderSpeech(load_on, text):
	var speech = preload("res://MiscScenes/Speech.tscn").instance()
	speech.bubble_text = text
	speech.set_position(Vector2(0,-40))
	load_on.add_child(speech)

func SoundOnInteraction(load_on, sound_name):
	var audio = preload("res://MiscScenes/Sound.tscn").instance()
	var format_string = "res://Sounds/%s.wav"
	var actual_string = format_string % sound_name
	var Sound = load(actual_string)
	audio.stream = Sound
	load_on.add_child(audio)
