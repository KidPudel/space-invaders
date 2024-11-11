package main

import "common"
import "core:fmt"
import "entities"
import rl "vendor:raylib"


Game :: struct {
	defender: entities.Defender,
	alien:    entities.Alien,
}

game_init :: proc() -> Game {
	rl.InitWindow(common.WIDTH, common.HEIGHT, "Space invaders")
	rl.SetTargetFPS(60)
	defender := entities.defender_init()
	alien := entities.alien_init()
	game := Game {
		defender = defender,
		alien    = alien,
	}
	return game
}

game_update :: proc(game: ^Game) {
	entities.defender_update(&game.defender)
	entities.alien_update(&game.alien)
}

game_draw :: proc(game: Game) {
	rl.BeginDrawing()

	rl.ClearBackground(rl.BLACK)

	entities.defender_draw(game.defender)
	entities.alien_draw(game.alien)

	rl.EndDrawing()
}

game_run :: proc(game: ^Game) {
	fmt.println(game^)
	for !rl.WindowShouldClose() {
		game_update(game)
		game_draw(game^)
	}
}

main :: proc() {
	game := game_init()
	fmt.println("main")
	fmt.println(game)

	game_run(&game)
}
