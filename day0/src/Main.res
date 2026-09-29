open P5

let screenHeight = 640.0
let screenWidth = 640.0
let scaleFactor = 5.0

let initSketch = () => {
  createCanvas(screenWidth, screenHeight)
  background(#Str("#fff"))
  noFill()
}

let main = () => {
  Browser.window->P5.setSetup(() => {
    initSketch()

    let centerx = screenWidth / 2.0
    let centery = screenHeight / 2.0
    let nCircles = 4

    for x in 1 to 12 {
      strokeWeight(x / 2)
      stroke(#Num(Int.toFloat(x) * 15.0))
      for i in 1 to nCircles {
        circle(
          ~x=centerx, 
          ~y=centery / 2.0 + Int.toFloat(x) * 20.0, 
          ~d=30.0 * Int.toFloat(i))

        line(
          ~x1=25.0,
          ~y1=centery / 2.0 + Int.toFloat(x) * 20.0,
          ~x2=25.0 + random(#Num(100.0)),
          ~y2=centery / 2.0 + Int.toFloat(x) * 20.0
        )

        triangle(
          ~x1=screenWidth - 100.0,
          ~y1=centery / 2.0 + Int.toFloat(x) * 20.0,
          ~x2=screenWidth - 50.0,
          ~y2=centery / 2.0 + Int.toFloat(x) * 20.0,
          ~x3=(screenWidth - 100.0) + 25.0,
          ~y3=centery / 2.0 + Int.toFloat(x) * 20.0 + 35.0
        )

        rect(
          ~x=7.0 + 30.0 * Int.toFloat(x) - 30.0,
          ~y=25.0,
          ~w=25.0,
          ~h=25.0
        )

        ellipse(
          ~x=screenWidth/2.0 + 25.0 * Int.toFloat(x) - 45.0,
          ~y=100.0,
          ~w=50.0,
          ~h=25.0
        )
      }
    }
  })

  P5.initP5Global()
}

main()
