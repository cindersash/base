////////////////////////////////// Movement
// Support either WASD or the arrow keys
var leftKey = keyboard_check_direct(ord("A")) || keyboard_check_direct(vk_left);
var rightKey = keyboard_check_direct(ord("D")) || keyboard_check_direct(vk_right);
var upKey = keyboard_check_direct(ord("W")) || keyboard_check_direct(vk_up);
var downKey = keyboard_check_direct(ord("S")) || keyboard_check_direct(vk_down);

// In Game Maker, the top-left of the screen is (0, 0)
var horizontalMovement = rightKey - leftKey;
var verticalMovement = downKey - upKey;

// Move the object one pixel at a time.
// This will prevent large speeds from allowing the player to "jump" over obstacles in the way.
if (horizontalMovement != 0 || verticalMovement != 0) {
	var pointDirection = point_direction(0, 0, horizontalMovement, verticalMovement);

	var horizontalVelocity = lengthdir_x(1, pointDirection);
	var verticalVelocity = lengthdir_y(1, pointDirection);
	
	// Move x and y separately to support "sliding" along walls
	for (var i = 0; i < baseSpeed; i++) {
		if (horizontalVelocity != 0 && place_free(x + horizontalVelocity, y)) {
			x += horizontalVelocity;
		}
		
		if (verticalVelocity != 0 && place_free(x, y + verticalVelocity)) {
			y += verticalVelocity;
		}
	}
}

///////////////////////////////// Weapons
// TODO upgradeable to fully automatic
var leftMouseButton = mouse_check_button_pressed(mb_left);

if (leftMouseButton) {
	var bulletAngle = _GUN_ANGLE + mousePointDirection;
	var bulletX = x + lengthdir_x(_GUN_DISTANCE, bulletAngle);
	var bulletY = y + lengthdir_y(_GUN_DISTANCE, bulletAngle);
	
	var created_bullet = instance_create_layer(bulletX, bulletY, "Instances", o_bullet);
	created_bullet.direction = mousePointDirection;
}

///////////////////////////////// Camera
// Center the camera on the player
camera_set_view_pos(view_camera[0], x - (view_wport[0] / 2), y - (view_hport[0] / 2));
