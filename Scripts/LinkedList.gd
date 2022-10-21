extends Reference

var _tail = null
var _head = _tail
var _len = 0

func get_tail():
	return _tail

func size():
	return _len

func push_back(val):
	if _len == 0:
		_head = LinkedListItem.new(val)
		_tail = _head
	else:
		var new_head = LinkedListItem.new(val)
		_head.link(new_head)
		_head = new_head
	_len += 1

func push_front(val):
	if _len == 0:
		_head = LinkedListItem.new(val)
		_tail = _head
	else:
		var new_tail = LinkedListItem.new(val)
		new_tail.link(_tail)
		_tail = new_tail
	_len += 1

func pop_back():
	if _len == 0:
		return null
	else:
		var result = _head.data
		_head = _head.previous
		_len -= 1
		return result

func pop_front():
	if _len == 0:
		return null
	else:
		var result = _tail.data
		_tail = _tail.next
		_len -= 1
		return result


class LinkedListItem:
	extends Reference

	var next = null
	var previous = null
	var data = {}
	func _init(v):
		data = v

	func link(other):
		other.previous = self
		next = other
		
	func push_back(val):
		print("Hola")

	func unlink():
		var _next = next
		var _previous = previous
		if _previous:
			_previous.next = next
		if _next:
			_next.previous = previous
