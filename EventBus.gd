extends Node


signal type

func broadcast_signal(signal_name: String, arguments: Array = []):
	emit_signal(signal_name, arguments)
