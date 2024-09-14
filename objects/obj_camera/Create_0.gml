alvo = noone;
estado = noone;

segue_alvo = function()
{
	//pegando a camera
	var _view_w = camera_get_view_width(view_camera[0]);
	var _view_h = camera_get_view_height(view_camera[0]);
	
	//pegando a metade da camera
	var _cam_x = x - _view_w/2;
	var _cam_y = y - _view_h/2;
	
	//mantendo ela no limite da room com o clamp
	//ela vai fica entre o 0, 0, que é a superior esquerda da room
	//e a inferior direita da room;
	_cam_x = clamp(_cam_x, 0, room_width - _view_w);
	_cam_y = clamp(_cam_y, 0, room_height - _view_h);
	
	//dando um leve deley na camera ao seguir o player;
	x = lerp(x, alvo.x, 0.1);
	y = lerp(y, alvo.y, 0.1);
	
	//setando o posição da camera
		//o obj vai seguir o seu alvo com um pequeno deley
		//e a camera vai estar setada no seu x e no seu y final;
	camera_set_view_pos(view_camera[0], _cam_x, _cam_y);
}

segue_player = function()
{
	var _player = instance_exists(obj_player_bob);
	if (_player) { alvo = obj_player_bob; }
	else { alvo = noone; }
	segue_alvo();
}
estado = segue_player;