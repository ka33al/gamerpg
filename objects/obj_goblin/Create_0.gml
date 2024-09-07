/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
tempo_estado = game_get_speed(gamespeed_fps)*15
timer_estado = tempo_estado

rota_x = 0
rota_y = 0
 event_inherited()
 estado_hunt = new estado()
#region estado idle
estado_slime_idle.inicia=function()
{
	sprite_index = goblin_idle
	image_index = 0
	show_debug_message("estado_slime_idle.inicia");
		timer_estado= tempo_estado
}
estado_slime_idle.roda= function ()
{

	timer_estado--
	
	var _tempo = irandom(timer_estado)
	if (_tempo <=4 )
	{
		var _state = choose(estado_slime_idle,estado_slime_walk,estado_slime_walk)
		troca_estado(_state)
	}
	

	
}

#endregion
#region walk
	estado_slime_walk.inicia = function ()
	{
		sprite_index = goblin_walk
		image_index = 0 
				timer_estado = tempo_estado
	
	rota_x = irandom(room_width)
	rota_y = irandom(room_height)
	}
	
	estado_slime_walk.roda = function()
	{
		var _tempo = irandom(timer_estado)
		timer_estado --
		if(_tempo <=5)
		{
			var _new_state = choose(estado_slime_idle,estado_slime_walk)
			troca_estado(_new_state)}
		
		mp_potential_step_object(rota_x,rota_y,1 ,obj_colisor)
		
	
	}
#endregion
#region hurt
	estado_slime_hurt.inicia= function()
	{
		sprite_index=goblin_hurt
		image_index = 0 
		
		life --
		
	}	
	
	estado_slime_hurt.roda=function()
			{
				if (image_index>image_number-.5)
				{
					if(life > 0)
							{
								troca_estado(estado_hunt)
							}
						else
							{
							troca_estado(estado_slime_death)
							}
			
			}
		}
	
#endregion
#region death 
	estado_slime_death.inicia = function ()
	{
		sprite_index = goblin_death
		image_index = 0
	}
	estado_slime_death.roda= function ()
	{
		if(image_index>=image_number - .5)
			{
				instance_destroy()
			}
		
	}
	
#endregion
#region attack
	estado_slime_attack.inicia= function()
	{
		sprite_index = goblin_attack
		image_index = 0
	}
	estado_slime_attack.roda =function ()
	{
	
	}
	
	
#endregion
#region hunt 

estado_hunt.inicia = function ()
{
	sprite_index = goblin_walk
	image_index	 = 0 
	
	image_blend  = c_yellow
	if ( instance_exists(objs_player))
	{
		alvo = objs_player.id
	}
}
estado_hunt.roda=function()

{
	if(!instance_exists(objs_player)){
		alvo = noone
		troca_estado(estado_slime_idle)
	}
	mp_potential_step_object(alvo.x,alvo.y,1,obj_colisor)
	
}


#endregion