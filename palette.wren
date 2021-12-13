import "graphics" for Color
import "core/config" for Config
var edg32colors = Config["palette"]

var EDG32 = edg32colors.map {|hex| Color.hex(hex) }.toList
var EDG32A = edg32colors.map {|hex|
  var c = Color.hex(hex)
  c.a = 115
  return c
}.toList

var PAL = EDG32
var PALA = EDG32A

