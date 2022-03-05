class AttackResult {
  static success { "success" }
  static blocked { "blocked" }
  static inert { "inert" }
}


class AttackType {
  static melee { "basic" }

  static verify(text) {
    if (text == "basic") {
      return text
    }
    Fiber.abort("unknown AttackType: %(text)")
  }
}

class Attack {
  construct new(damage, attackType) {
    _damage = damage
    _attackType = AttackType.verify(attackType)
  }

  damage { _damage }
  attackType { _attackType }

  static melee(entity) {
    return Attack.new(entity["stats"].get("atk"), AttackType.melee)
  }
}
