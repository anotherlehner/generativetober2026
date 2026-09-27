module Vector = {
  type t

  // --- Constructors & Factory Functions ---

  @new @module("p5")
  external create: (~x: float=?, ~y: float=?, ~z: float=?, unit) => t = "Vector"

  @module("p5") @scope("Vector")
  external createRandom2D: unit => t = "random2D"

  @module("p5") @scope("Vector")
  external createRandom3D: unit => t = "random3D"

  @module("p5") @scope("Vector")
  external fromAngle: (float, ~length: float=?) => t = "fromAngle"

  @module("p5") @scope("Vector")
  external fromAngles: (float, float, ~length: float=?) => t = "fromAngles"

  // --- Getters & Setters ---

  @get external x: t => float = "x"
  @get external y: t => float = "y"
  @get external z: t => float = "z"

  @send external setX: (t, float) => unit = "x"
  @send external setY: (t, float) => unit = "y"
  @send external setZ: (t, float) => unit = "z"

  type vecOrComponents = [
    | #Vector(t)
    | #Components2D(float, float)
    | #Components3D(float, float, float)
    | #Array(array<float>)
  ]

  @send
  external set: (t, vecOrComponents) => t = "set"

  @send external copy: t => t = "copy"

  // --- Vector Operations (In-place & Static) ---

  // Add
  @send
  external add: (t, vecOrComponents) => t = "add"

  @module("p5") @scope("Vector")
  external addStatic: (vecOrComponents, vecOrComponents) => t = "add"

  // Subtract
  @send
  external sub: (t, vecOrComponents) => t = "sub"

  @module("p5") @scope("Vector")
  external subStatic: (vecOrComponents, vecOrComponents) => t = "sub"

  // Multiply (Scalar or Vector component-wise)
  type multTarget = [
    | #Scalar(float)
    | #Vector(t)
    | #Components2D(float, float)
    | #Components3D(float, float, float)
    | #Array(array<float>)
  ]

  @send
  external mult: (t, multTarget) => t = "mult"

  @module("p5") @scope("Vector")
  external multStatic: (t, multTarget) => t = "mult"

  // Divide
  type divTarget = [
    | #Scalar(float)
    | #Vector(t)
    | #Components2D(float, float)
    | #Components3D(float, float, float)
    | #Array(array<float>)
  ]

  @send
  external div: (t, divTarget) => t = "div"

  @module("p5") @scope("Vector")
  external divStatic: (t, divTarget) => t = "div"

  // --- Magnitude, Distance, & Angle Calculations ---

  @send external mag: t => float = "mag"
  @send external magSq: t => float = "magSq"

  @send
  external setMag: (t, float) => t = "setMag"

  @send
  external dist: (t, vecOrComponents) => float = "dist"

  @module("p5") @scope("Vector")
  external distStatic: (vecOrComponents, vecOrComponents) => float = "dist"

  @send
  external dot: (t, vecOrComponents) => float = "dot"

  @module("p5") @scope("Vector")
  external dotStatic: (vecOrComponents, vecOrComponents) => float = "dot"

  @send external cross: (t, t) => t = "cross"

  @module("p5") @scope("Vector")
  external crossStatic: (t, t) => t = "cross"

  @send external heading: t => float = "heading"
  @send external setHeading: (t, float) => t = "setHeading"

  @send external angleBetween: (t, t) => float = "angleBetween"

  @module("p5") @scope("Vector")
  external angleBetweenStatic: (t, t) => float = "angleBetween"

  // --- Normalization, Limiting, & Interpolation ---

  @send external normalize: t => t = "normalize"

  @send external limit: (t, float) => t = "limit"

  // Lerp (Linear Interpolation)
  type lerpTarget = [
    | #VectorAmount(t, float)
    | #Components2DAmount(float, float, float)
    | #Components3DAmount(float, float, float, float)
  ]

  @send
  external lerp: (t, lerpTarget) => t = "lerp"

  @module("p5") @scope("Vector")
  external lerpStatic: (t, t, float) => t = "lerp"

  // Slerp (Spherical Linear Interpolation)
  @send external slerp: (t, t, float) => t = "slerp"

  @module("p5") @scope("Vector")
  external slerpStatic: (t, t, float) => t = "slerp"

  // Remap components
  @send
  external map: (
    t,
    ~inMin: float,
    ~inMax: float,
    ~outMin: float,
    ~outMax: float,
  ) => t = "map"

  // --- Transformation & Rotation ---

  @send external rotate: (t, float) => t = "rotate"

  // 3D rotations around axes
  @send external rotateX: (t, float) => t = "rotateX"
  @send external rotateY: (t, float) => t = "rotateY"
  @send external rotateZ: (t, float) => t = "rotateZ"

  // --- Conversions & Utility ---

  @send external array: t => array<float> = "array"
  @send external equals: (t, vecOrComponents) => bool = "equals"
  @send external toString: t => string = "toString"
}
