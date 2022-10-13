extends Node2D
const gamevariables = "res://MiscScenes/GameVariables.tscn"

func RenderSpeech(load_on, text):
	var speech = preload("res://MiscScenes/Speech.tscn").instance()
	speech.bubble_text = text
	speech.set_position(Vector2(0,-40))
	load_on.add_child(speech)

func SoundOnInteraction(load_on, sound_name):
	var audio = preload(gamevariables).instance().get_node("Sound")
	audio.stream = load("res://Sounds/%s.wav" % sound_name)
	load_on.add_child(audio)
	Global.Log("Sound playing "+sound_name, 1)
