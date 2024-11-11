package entities

import "../common"
import "core:fmt"
import rl "vendor:raylib"

Alien :: struct {
	position:     rl.Vector2,
	since_jumped: f32,
}


alien_init :: proc() -> Alien {
	alien := Alien {
		position     = rl.Vector2{cast(f32)common.WIDTH / 2, 0},
		since_jumped = 0,
	}
	return alien
}


alien_update :: proc(alien: ^Alien) {
	if alien.since_jumped > rl.GetFrameTime() * 10 {
		alien.since_jumped = 0
		alien.position.y += 5
		fmt.println(alien.position)
	}
	alien.since_jumped += rl.GetFrameTime()
}


alien_draw :: proc(alien: Alien) {
	rl.DrawRectangleV(alien.position, rl.Vector2{20, 20}, rl.GREEN)
}
