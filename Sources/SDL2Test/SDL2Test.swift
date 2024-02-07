import CSDL2

guard SDL_Init(SDL_INIT_VIDEO) == 0 else {
    fatalError("error with SDL init: \(#file) \(#function)")
}

let centeredMask = Int32(SDL_WINDOWPOS_CENTERED_MASK)
guard
    let window = SDL_CreateWindow(
        "SDL Tutorial",
        centeredMask, centeredMask, 800, 600,
        0 /*| UInt32(SDL_WINDOW_FULLSCREEN.rawValue) */)
else {
    fatalError("Unable to create window")
}

guard let renderer = SDL_CreateRenderer(window, -1, 0) else {
    fatalError("unable to create renderer")
}

var loop = true
var state = false

var event = SDL_Event()
while loop {
    while SDL_PollEvent(&event) > 0 {
        // Handle input
        print(event.type)
        if event.type == SDL_QUIT.rawValue {
            loop = false
        }

        // Mouse click I think
        if event.type == 1025 {
            state.toggle()
        }
    }
    // Update State

    // Draw Screen
    SDL_SetRenderDrawColor(renderer, 0, 0, 0, UInt8(SDL_ALPHA_OPAQUE))
    SDL_RenderClear(renderer)

    if state {
        SDL_SetRenderDrawColor(
            renderer, 0x00, 0x69, 0x69, UInt8(SDL_ALPHA_OPAQUE))
        SDL_RenderDrawLine(renderer, 25, 25, 500, 200)
    }

    SDL_RenderPresent(renderer)
    SDL_Delay(100)
}
SDL_DestroyWindow(window)
SDL_Quit()
