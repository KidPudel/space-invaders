package entities

import rl "vendor:raylib"

Bullet :: struct {
	position: rl.Vector2,
}

bullet_init :: proc(init_position: rl.Vector2) -> Bullet {
	return Bullet{rl.Vector2{init_position.x, init_position.y}}
}

bullet_update :: proc(bullet: ^Bullet) {
	bullet.position.y -= 200 * rl.GetFrameTime()
}

bullet_draw :: proc(bullet: Bullet) {
	rl.DrawRectangleV(bullet.position, rl.Vector2{5, 10}, rl.RED)
}
