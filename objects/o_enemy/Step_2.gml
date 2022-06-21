if (hp <= 0) {
	instance_destroy(id);
}

if (isHit) {
	isHit = false;
	if (hitSound == noone) {
		hitSound = audio_play_sound(snd_zombie_hit, 10, false);
	} else {
		if (!audio_is_playing(hitSound)) {
			hitSound = noone;
		}
	}
}

if (hitFrame > 0) {
	hitFrame--;
}
