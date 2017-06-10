extends Node2D

var bullets = []

func _ready():
	set_fixed_process(true)

func _fixed_process(delta):
	for blt in bullets:
		blt.process_job(delta)
		blt.process_collision()
		# bullet 도 _fixed_process를 가지지만 노드는 아니므로 직접 호출
	update() # _draw() 호출
	
	OS.set_window_title(str(bullets.size()) + " fps: " + str(1.0 / get_process_delta_time()))

func _draw():
	for blt in bullets:
		blt.draw_to(self)

# fire()에 의해 생성된 노드가 extends enemy_bullet 인 경우에 bullets 노드에서 관리
func add_bullet(enemy_bullet):
	bullets.push_back(enemy_bullet)