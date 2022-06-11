extends Node

signal inventory
signal type
signal cancel_select

func broadcast_signal(signal_name: String, arguments: Array = []):
	emit_signal(signal_name, arguments)
