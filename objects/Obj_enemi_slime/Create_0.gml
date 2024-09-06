/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor







event_inherited();

// e sobre escrito



#region estado idle
estado_slime_idle.inicia=function()
{
	sprite_index = Slime_idle
	image_index = 0
	show_debug_message("estado_slime_idle.inicia");
	
}
estado_slime_idle.roda= function ()
{
	
}

#endregion
#region walk
	estado_slime_walk.inicia = function ()
	{
		sprite_index = Slime_walk
		image_index = 0 
	}
	
	estado_slime_walk.roda = function()
	{
	
	}
#endregion
#region hurt
	estado_slime_hurt.inicia= function()
	{
		sprite_index=Slime_hurt
		image_index = 0 
		
		life --
		
	}	
	
	estado_slime_hurt.roda=function()
			{
				if (image_index>image_number-.5)
				{
					if(life > 0)
							{
								troca_estado(estado_slime_idle)
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
		sprite_index = Slime_death
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
		sprite_index = Slime_attack
		image_index = 0
	}
	estado_slime_attack.roda =function ()
	{
	
	}
	
	
#endregion


