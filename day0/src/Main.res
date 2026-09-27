let baseWidth = 160.0
let baseHeight = 120.0
let scaleFactor = 6.0
let screenWidth = baseWidth * scaleFactor
let screenHeight = baseHeight * scaleFactor

let main = () => {
  Browser.window->P5.setSetup(() => {
    P5.createCanvas(screenWidth, screenHeight)
    P5.background(#Str("#1a1c2c"))
    P5.fill(#CSSColor("#f4f4f4"))
    P5.textFont("monospace")
    P5.textSize(scaleFactor * 4.0)
    P5.text("Geometrinktober 2026 Day 1 (ReScript + p5.js)", 2.0 * scaleFactor, 6.0 * scaleFactor)
  })

  P5.initP5Global()
}

main()
