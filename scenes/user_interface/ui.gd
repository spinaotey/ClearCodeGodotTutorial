extends CanvasLayer

@export var normal_color: Color = Color.GREEN
@export var empty_color: Color = Color.RED

func _ready():
    Globals.health_change.connect(update_health_ui)
    update_laser_text()
    update_grenade_text()
    update_health_ui()

func update_laser_text():
    %LaserLabel.text = str(Globals.laser_amount)
    if Globals.laser_amount == 0:
        %LaserContainer.modulate = empty_color
    else:
        %LaserContainer.modulate = normal_color

func update_grenade_text():
    %GrenadeLabel.text = str(Globals.grenade_amount)
    if Globals.grenade_amount == 0:
        %GrenadeContainer.modulate = empty_color
    else:
        %GrenadeContainer.modulate = normal_color

func update_health_ui():
    %HealthBar.value = Globals.health