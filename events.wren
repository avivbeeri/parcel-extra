import "./core/event" for Event, EntityRemovedEvent, EntityAddedEvent
import "./extra/combat" for AttackResult

class GameEndEvent is Event {
  construct new(won) {
    super()
    _won = won
  }

  won { _won }

  // Force later
  priority { 3 }
}

class MoveEvent is Event {
  construct new(target) {
    super()
    _target = target
  }

  target { _target }
}

class CollisionEvent is Event {

  construct new(source, target, position) {
    super()
    _target = target
    _source = source
    _pos = position
  }

  source { _source }
  target { _target }
  pos { _pos }
}

class AttackEvent is Event {

  construct new(source, target, attack) {
    super()
    _target = target
    _source = source
    _attack = attack
    _result = true
  }
  construct new(source, target, attack, result) {
    super()
    _target = target
    _source = source
    _attack = attack
    _result = result
  }

  source { _source }
  target { _target }
  attack { _attack }
  result { _result }

  fail() {
    _result = AttackResult.blocked
  }
}

class LogEvent is Event {
  construct new(text) {
    super()
    _text = text
  }
  text { _text }
}

class PickupEvent is Event {
  construct new(source, item) {
    super()
    _source = source
    _item = item
  }
  source { _source }
  item { _item }
}

class ModifierEvent is Event {
  construct new(target, positive) {
    super()
    _target = target
    _positive = positive
  }
  target { _target }
  positive { _positive }
}

