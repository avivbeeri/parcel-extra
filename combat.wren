class AttackResult {
  static success { "success" }
  static blocked { "blocked" }
  static inert { "inert" }
}


class AttackType {
  static direct { "basic" }
  static stun { "stun" }

  static verify(text) {
    if (text == "basic" || text == "stun") {
      return text
    }
    Fiber.abort("unknown AttackType: %(text)")
  }
}

class Attack {
  construct new(attackType, damage) {
    _damage = damage
    _attackType = AttackType.verify(attackType)
  }

  damage { _damage }
  attackType { _attackType }

  static direct(entity) {
    return Attack.new(AttackType.direct, entity["stats"].get("atk"))
  }
  static stun(entity) {
    return Attack.new(AttackType.stun, 0)
  }
}
