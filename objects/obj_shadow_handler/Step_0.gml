//makes sure its always on shadow layer
if layer != layer_get_id("Shadows") {
	if layer_exists(layer_get_id("Shadows")) {
		layer = layer_get_id("Shadows")
	} else {
		layer_create(shadow_depth, "Shadows")
		layer = layer_get_id("Shadows")
	}
}