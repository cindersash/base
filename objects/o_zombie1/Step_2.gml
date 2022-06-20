event_inherited();

////////////////////////////////// Sprite
// Setting image_angle also rotates the collision mask which we do not want
// so do it at the very end of the step.
image_angle = baseDirection;
