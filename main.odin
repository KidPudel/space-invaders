package main

import "core:fmt"
import rl "vendor:raylib"
import "entities"

WIDTH :i32: 640
HEIGHT :i32: 480

Game :: struct {
    defender: entities.Defender
}

init_game :: proc() -> Game {
    rl.InitWindow(WIDTH, HEIGHT, "Space invaders")
    defender := entities.init_defender()
    return Game{
        defender
    }
}

update_game :: proc(game: ^Game) {
    entities.update_defender(&game.defender)
}

draw_game :: proc(game: Game) {
    rl.BeginDrawing()

    rl.ClearBackground(rl.BLACK)

    entities.draw_defender(game.defender)
    
    rl.EndDrawing()
}

run_game :: proc(game: ^Game) {
    for !rl.WindowShouldClose() {
        update_game(game)
        draw_game(game^)
    }
}

main :: proc() {
    game := init_game()
    run_game(&game)
}
