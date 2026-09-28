type webgl

@val external webgl: webgl = "WEBGL"

@val
external background: @unwrap
[
  | #Num(float)
  | #Str(string)
  | #RGB(float, float, float)
] => unit = "background"

@val external beginShape: int => unit = "beginShape"

@val external circle: (float, float, float) => unit = "circle"

@val external constrain: (float, float, float) => float = "constrain"

@val external createCanvas: (float, float) => unit = "createCanvas"

@val external createWebGLCanvas: (float, float, webgl) => unit = "createCanvas"

@val external endShape: unit => unit = "endShape"

@val
external fill: @unwrap
[
  | #CSSColor(string)
  | #Range(float, float)
  | #Gray(float)
] => unit = "fill"

@val external floor: float => float = "floor"

@val external floorInt: float => int = "floor"

@new external initP5Global: unit => unit = "p5"

@val external loadPixels: unit => unit = "loadPixels"

@val external map: (float, float, float, float, float) => float = "map"

@val external mouseX: float = "mouseX"

@val external mouseY: float = "mouseY"

@val external noFill: unit => unit = "noFill"

@val
external noise: @unwrap
[
  | #OneD(float)
  | #TwoD(float, float)
] => float = "noise" // For some reason this is returning NaN?

@val external noise2d: (float, float) => float = "noise"

@val external noise3: (float, float, float) => float = "noise"

@val external noise3d: (float, float, float) => float = "noise"

@val external noiseDetail: (float, float) => unit = "noiseDetail"

@val external noStroke: unit => unit = "noStroke"

@val external point: (float, float) => unit = "point"

@val external pop: unit => unit = "pop"

@val external push: unit => unit = "push"

@val external quadStrip: int = "QUAD_STRIP"

@val
external random: @unwrap
[
  | #Num(int)
  | #Range(int, int)
] => float = "random"

@val external randomChoice: array<'a> => 'a = "random"

@val external randomGaussian: (float, float) => float = "randomGaussian"

@val external rect: (float, float, float, float) => unit = "rect"

@val external rotateX: float => unit = "rotateX"

@val external rotateY: float => unit = "rotateY"

@val external rotateZ: float => unit = "rotateZ"

@val external scale: float => unit = "scale"

@val external set: (float, float, float) => unit = "set"

@set external setDraw: (Browser.window, unit => unit) => unit = "draw"

@set external setSetup: (Browser.window, unit => unit) => unit = "setup"

@val
external stroke: @unwrap
[
  | #Num(float)
  | #Str(string)
] => unit = "stroke"

@val external strokeWeight: int => unit = "strokeWeight"

// TODO: move terrain to it's own module
type terrain

@send external calculate: terrain => unit = "calculate"

@new external initTerrain: (int, int, int) => terrain = "Terrain"

@send external render: terrain => unit = "render"

@val external text: (string, float, float) => unit = "text"

@val external textFont: string => unit = "textFont"

@val external textSize: float => unit = "textSize"

@val external translate: (float, float, float) => unit = "translate"

@val external updatePixels: unit => unit = "updatePixels"

module Prim2D = {

  type t

  @module("p5") @new
  external make: unit => t = "default"

  type mode = [#CORNER | #CORNERS | #CENTER | #RADIUS]
  type arcMode = [#CHORD | #PIE | #OPEN]

  type numOrString = [
    | #N(float)
    | #S(string)
  ]

  type num = float

  module Prim2D = {
    // --- arc ---
    @send
    external arcFloat: (
      t,
      ~x: float,
      ~y: float,
      ~w: float,
      ~h: float,
      ~start: float,
      ~stop: float,
      ~mode: string=?,
      ~detail: int=?,
    ) => unit = "arc"

    let arc = (
      inst: t,
      ~x: float,
      ~y: float,
      ~w: float,
      ~h: float,
      ~start: float,
      ~stop: float,
      ~mode: option<string>=?,
      ~detail: option<int>=?,
      (),
    ) => {
      arcFloat(inst, ~x, ~y, ~w, ~h, ~start, ~stop, ~mode?, ~detail?)
    }

    // --- circle ---
    @send
    external circle: (t, ~x: float, ~y: float, ~d: float) => unit = "circle"

    // --- ellipse ---
    @send
    external ellipse: (
      t,
      ~x: float,
      ~y: float,
      ~w: float,
      ~h: float=?,
      ~detail: int=?,
      unit,
    ) => unit = "ellipse"

    // --- line ---
    @send
    external line: (t, ~x1: float, ~y1: float, ~x2: float, ~y2: float) => unit = "line"

    @send
    external line3D: (
      t,
      ~x1: float,
      ~y1: float,
      ~z1: float,
      ~x2: float,
      ~y2: float,
      ~z2: float,
    ) => unit = "line"

    // --- point ---
    @send
    external point: (t, ~x: float, ~y: float, ~z: float=?) => unit = "point"

    // --- quad ---
    @send
    external quad: (
      t,
      ~x1: float,
      ~y1: float,
      ~x2: float,
      ~y2: float,
      ~x3: float,
      ~y3: float,
      ~x4: float,
      ~y4: float,
      ~detailX: int=?,
      ~detailY: int=?,
      unit,
    ) => unit = "quad"

    @send
    external quad3D: (
      t,
      ~x1: float,
      ~y1: float,
      ~z1: float,
      ~x2: float,
      ~y2: float,
      ~z2: float,
      ~x3: float,
      ~y3: float,
      ~z3: float,
      ~x4: float,
      ~y4: float,
      ~z4: float,
      ~detailX: int=?,
      ~detailY: int=?,
      unit,
    ) => unit = "quad"

    // --- rect ---
    @send
    external rect: (
      t,
      ~x: float,
      ~y: float,
      ~w: float,
      ~h: float=?,
      ~tl: float=?,
      ~tr: float=?,
      ~br: float=?,
      ~bl: float=?,
      unit,
    ) => unit = "rect"

    // --- square ---
    @send
    external square: (
      t,
      ~x: float,
      ~y: float,
      ~s: float,
      ~tl: float=?,
      ~tr: float=?,
      ~br: float=?,
      ~bl: float=?,
      unit,
    ) => unit = "square"

    // --- triangle ---
    @send
    external triangle: (
      t,
      ~x1: float,
      ~y1: float,
      ~x2: float,
      ~y2: float,
      ~x3: float,
      ~y3: float,
    ) => unit = "triangle"

    // --- Polymorphic modes helpers ---
    @send
    external rectModeRaw: (t, string) => unit = "rectMode"

    let rectMode = (inst: t, mode: mode) => {
      let modeStr = switch mode {
      | #CORNER => "corner"
      | #CORNERS => "corners"
      | #CENTER => "center"
      | #RADIUS => "radius"
      }
      rectModeRaw(inst, modeStr)
    }

    @send
    external ellipseModeRaw: (t, string) => unit = "ellipseMode"

    let ellipseMode = (inst: t, mode: mode) => {
      let modeStr = switch mode {
      | #CORNER => "corner"
      | #CORNERS => "corners"
      | #CENTER => "center"
      | #RADIUS => "radius"
      }
      ellipseModeRaw(inst, modeStr)
    }
  }
}

module Vector = {
  type t

  // --- Constructors & Factory Functions ---

  @new @module("p5")
  external create: (~x: float=?, ~y: float=?, ~z: float=?) => t = "Vector"

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
  external map: (t, ~inMin: float, ~inMax: float, ~outMin: float, ~outMax: float) => t = "map"

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
