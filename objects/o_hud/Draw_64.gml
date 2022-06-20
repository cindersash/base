draw_set_font(f_hud);
draw_set_color(c_white);

windowBorder = 5;

topRightX = window_get_width() - windowBorder;
topRightY = 0 + windowBorder;

bottomRightX = window_get_width() - windowBorder;
bottomRightY = window_get_height() - windowBorder;

draw_set_halign(fa_right);
draw_set_valign(fa_bottom);
draw_text(bottomRightX, bottomRightY, "Semi-Automatic");

draw_set_halign(fa_right);
draw_set_valign(fa_top);
draw_text(topRightX, topRightY, string(o_player.x) + "," + string(o_player.y));
