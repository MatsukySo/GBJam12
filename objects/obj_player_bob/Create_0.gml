#region variaveis do bob
//variaveis de movimento
velv = 0;
velh = 0;
max_vel = 2;

sprite = 0;
image_spd = 0;
image_numb = 0;
image_ind = 0;
sprites = [[spr_bob_idle_right, spr_bob_idle_left]
					];

//variavel que vai definir os estados
estado = undefined;
face = 0;
#region maquina de estados

estado_parado = function()
{
	//variaveis para movimentar
	var _right, _left, _up, _down
	_right = keyboard_check(ord("D"))
	_left = keyboard_check(ord("A"))
	_up = keyboard_check(ord("W"))
	_down = keyboard_check(ord("S"))
	if (_right or _left or _down or _up) { estado = estado_movendo; }
	
	velv = 0;
	velh = 0;
	
	desenha_sprite(0, 0.05)
}

estado_movendo = function()
{
	var _right, _left, _up, _down
	_right = keyboard_check(ord("D"))
	_left = keyboard_check(ord("A"))
	_up = keyboard_check(ord("W"))
	_down = keyboard_check(ord("S"))

	if(_right) { face = 0; }
	if(_left) { face = 1; }
	var _dir = point_direction(0, 0, (_right - _left), (_down - _up));
	if ((_right xor _left) or (_up xor _down))
	{
		var _velh = lengthdir_x(max_vel, _dir);
		var _velv = lengthdir_y(max_vel, _dir);
		
		velh = lerp(velh, _velh, 0.25);
		velv = lerp(velv, _velv, 0.25);
	}
	else { velh = lerp(velh, 0, 0.15); velv = lerp(velv, 0, 0.15); }
	desenha_sprite(0, 0.05)
}

#endregion
desenha_sprite = function(_ind, _spd)
{
	sprite = sprites[_ind][face];
	image_spd = _spd;
	
	image_numb = sprite_get_number(sprite);
	image_ind += image_spd;
	image_ind %= image_numb;
}

estado = estado_parado;