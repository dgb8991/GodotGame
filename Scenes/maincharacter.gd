extends CharacterBody2D

const SPEED = 400.0
const JUMP_VELOCITY = -900.0
@onready var sprite_2d: AnimatedSprite2D = $Sprite2D

# Track the last direction the character was facing
var facing_left = false

func _physics_process(delta: float) -> void:

	# Check if the player is airborne
	if not is_on_floor():
		velocity += get_gravity() * delta
		# Only set the jump animation if it's not already active
		if sprite_2d.animation != "Jumping":
			sprite_2d.animation = "Jumping"
	else:
		# If on the floor, handle idle and run animations
		if abs(velocity.x) > 1:
			if sprite_2d.animation != "Run":
				sprite_2d.animation = "Run"
		else:
			if sprite_2d.animation != "Iddle":
				sprite_2d.animation = "Iddle"

	# Handle jump
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle movement/deceleration.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		# Update facing direction when moving
		facing_left = velocity.x < 0
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

	# Apply the last facing direction to the sprite
	sprite_2d.flip_h = facing_left
