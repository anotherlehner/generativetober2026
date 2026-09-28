let screenHeight = 640.0
let screenWidth = 640.0
let scaleFactor = 5.0

let initSketch = title => {
  P5.createCanvas(screenWidth, screenHeight)
  P5.background(#Str("#fff"))
  P5.fill(#CSSColor("#999"))
  P5.textFont("monospace")
  P5.textSize(scaleFactor * 4.0)
  P5.text(title, 2.0 * scaleFactor, 6.0 * scaleFactor)
}

let main = () => {
  Browser.window->P5.setSetup(() => {
    open P5
    initSketch("Day 0")

    let centerx = screenWidth / 2.0
    let centery = screenHeight / 2.0
    let nCircles = 5

    noFill()

    strokeWeight(1)
    stroke(#Num(0.0))
    for i in 1 to nCircles {
      circle(centerx + 120.0, centery - 50.0, 40.0 * Int.toFloat(i))
    }

    strokeWeight(2)
    stroke(#Num(150.0))
    for i in 1 to nCircles {
      circle(centerx, centery, 50.0 * Int.toFloat(i))
    }

    strokeWeight(3)
    stroke(#Num(200.0))
    for i in 1 to nCircles {
      circle(centerx - 120.0, centery + 50.0, 60.0 * Int.toFloat(i))
    }
  })

  P5.initP5Global()
}

main()
