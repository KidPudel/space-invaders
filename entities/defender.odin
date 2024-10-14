package entities

import rl "vendor:raylib"
import "core:fmt"
import "core:strings"

Defender :: struct {
	position: rl.Vector2,
	life:     i32,
	bullets:  [dynamic]Bullet,
}

init_defender :: proc() -> Defender {
	return Defender{rl.Vector2{640 / 2, 460}, 3, make([dynamic]Bullet, 0)}
}

update_defender :: proc(defender: ^Defender) {
	if rl.IsKeyDown(rl.KeyboardKey.D) && defender.position.x < 640 - 20 {
		defender.position.x += 150 * rl.GetFrameTime()
	} else if rl.IsKeyDown(rl.KeyboardKey.A) && defender.position.x > 0 {
		defender.position.x -= 150 * rl.GetFrameTime()
	}

	// bullet
	if rl.IsKeyPressed(rl.KeyboardKey.UP) {
		append(&defender.bullets, init_bullet(defender.position))
	}

	for i := 0; i < len(defender.bullets); i += 1 {
		update_bullet(&defender.bullets[i])
		if defender.bullets[i].position.y < 0 {
			unordered_remove(&defender.bullets, i)
		}
	}
}

draw_defender :: proc(defender: Defender) {
	rl.DrawRectangleV(defender.position, rl.Vector2{20, 20}, rl.BLUE)

	for bullet in defender.bullets {
		draw_bullet(bullet)
	}

    string_builder := strings.Builder{}
    bullet_number_string := fmt.sbprintf(&string_builder, "%x", len(defender.bullets))

	rl.DrawText(strings.to_cstring(&string_builder), 0, 0, 20, rl.WHITE)
}