# Generativetober 2026

Algorithmic artwork with processing for October 2026.

I saw a blog post recently by Duncan Geere from 2020 about an exercise he did for Inktober of using a plotter to draw inked generative artwork ([https://blog.duncangeere.com/inktober-2020-in-review/](https://blog.duncangeere.com/inktober-2020-in-review/). I've been playing with p5.js the last couple of weeks and Inktober 2026 starts this week and figured I'm at a place with my processing code where it's time to start making things instead of just coding examples. So the idea is to follow the prompts for Inktober 2026 and make a generative art piece with p5.js and ReScript for each day of October. I don't have a plotter but if I did then theoretically I could print some of these for real but that's not really the point. I want to push myself to make something interesting each day and explore. 

Martin Lehner
@anotherlehner
10/2026

## What is Generative Art?

https://en.wikipedia.org/wiki/Generative_art

## Is AI used in this project?

Yes and no, it depends on what you mean by "AI". I do use modern LLM-based AI for work around the edges like generating bindings from ReScript to p5.js but I **DO NOT** use LLMs for writing the primary logic for any program. It is always my hands and brain writing the code to generate a particular work. I also might experiment with primitive neural network algorithms for pieces at some point, which is technically AI but not the type most people are referring to when they use that label in 2026.

## Why use the label "Generative Art"?

I went back and forth on this for some time before settling on it. Generative art is the phrase I've always heard to describe this sort of algorithmic graphical work. Some folks call it by other names (eg procedural generation) and there are various genres that overlap (eg geometric art). In the interest of simplicity and nodding to the most recognizable historical labeling I'm going with "generative" for now.

## How do I run these programs on my computer?

If you want to run any of the works in this repository...

1. Make sure you have a recent version of nodejs installed
2. Enter the directory of the day you want to work with
3. Run `npm run res:dev` to run the rescript dev compiler
4. Open another terminal in the same directory and run `npm run dev` to run vite
5. Browse to `localhost:5173`

