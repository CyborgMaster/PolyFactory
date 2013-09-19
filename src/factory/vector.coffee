vector =
  pi: Math.PI
  tpi: Math.PI * 2

  len: (v) ->
    Math.sqrt(v.reduce(((s, t) -> t * t + s), 0))

  add: (v1, v2) ->
    (v2[i] + v1[i] for x, i in v1)

  sub: (v1, v2) ->
    (v1[i] - v2[i] for x, i in v1)

  mul: (v1, v2) ->
    if @isVector v2
      (v1[i] * v2[i] for x, i in v1)
    else
      (x * v2 for x in v1)

  div: (v1, v2) ->
    if @isVector v2
      (v1[i] / v2[i] for x, i in v1)
    else
      (x / v2 for x in v1)

  isVector: (value) ->
    value and
      typeof value.length is 'number' and
      typeof value[0] is 'number'

  copy: (v) ->
    (x for x in v)

  angle: (v) ->
    throw 'Not a 3d vector!' if not @isVector(v) or not v.length == 3
    Math.atan2 v[0], v[2]

  constrainAngle: (a) ->
    a = (a + @pi) % @tpi
    a += @tpi if a < 0
    a - @pi

@vector = vector
