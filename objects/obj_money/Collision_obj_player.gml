if image_index = 0 global.money++;
if image_index = 1 global.money+=5;

audio_play_sound(snd_pickup_coin, 1, 0);
instance_destroy();
