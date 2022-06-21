draw_set_font(f_hud);
draw_set_color(c_white);

var topRightX = window_get_width() - _WINDOW_BORDER;
var topRightY = 0 + _WINDOW_BORDER;

var bottomLeftX = 0 + _WINDOW_BORDER;
var bottomLeftY = window_get_height() - _WINDOW_BORDER;

var bottomRightX = window_get_width() - _WINDOW_BORDER;
var bottomRightY = window_get_height() - _WINDOW_BORDER;

// Bottom Left
draw_set_halign(fa_left);
draw_set_valign(fa_bottom);
if (o_game_controller.constructionPhase) {
	draw_set_color(c_yellow);
	draw_text(bottomLeftX, bottomLeftY, "Press 'B' to begin next wave");
	draw_set_color(c_white);
}else {
	draw_text(bottomLeftX, bottomLeftY, "Wave: " + string(o_game_controller.wave));
}

// Bottom right
draw_set_halign(fa_right);
draw_set_valign(fa_bottom);
draw_text(bottomRightX, bottomRightY, "Semi-Automatic");

// Top right
draw_set_halign(fa_right);
draw_set_valign(fa_top);
draw_text(topRightX, topRightY, string(o_player.x) + "," + string(o_player.y));

// Debug
if (debug) {
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_text(100, 100, "Number of enemies: " + string(instance_number(o_enemy)));
}
