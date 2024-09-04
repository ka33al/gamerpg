/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

//iniciando meu primeiro estado 

estado_idle = new estado()

estado_walk = new estado()

estado_attack = new estado()
//estao idle inicia

#region estado idle
estado_idle.inicia = function()
{
	//definindo a sprite atual com base na direcao
	var _sprite = define_sprite(dir, pl_idle_side,pl_idle_front,pl_idle_back);
	
	sprite_index = _sprite	;
	
	image_index = 0;
	show_debug_message("idle.inicia: {0}", sprite_index);
}

estado_idle.roda = function()
{
	
	//achando a condicao pra sair do estado
	//se eu estiver em movimento entao eu vou para o estado walk
	if (up or down or rigth or left)
	{
		troca_estado(estado_walk)
	}
	
	//indo estado attack
	if(attack)
	{
		troca_estado(estado_attack)
	}
	//show_debug_message("idle.roda: {0}", sprite_index);
}

#endregion

 estado_walk.inicia = function() {
	dir  = (point_direction(0, 0, left - rigth, up-down) div 90)
	//definindo a sprite
	//configurando a sprite
	sprite_index = define_sprite (dir, pl_walk_side, pl_walk_back, pl_walk_front)
	image_index = 0 
	show_debug_message("dir: {0}", dir);
	show_debug_message("walk.inicia: {0}", sprite_index);
}
 
 estado_walk.roda = function()
 {
	 dir  = point_direction(0,0,velh,velv) div 90
	 
	 if(velh!= 0 ){
		image_xscale = sign(velh)
	 }
	 sprite_index = define_sprite (dir, pl_walk_side, pl_walk_front, pl_walk_back)
	 image_index = 0;
 
     show_debug_message("walk.roda: {0}", sprite_index)
	 
	 velv = (down-up)*vel	
	 velh = (rigth-left)*vel
	 
	 if(velh == 0 && velv == 0) {
		troca_estado(estado_idle)
	 }
	 if(attack){
		 troca_estado(estado_attack)
		 }
 }
 
 estado_attack.inicia = function()
 
 {
 	sprite_index = define_sprite(dir,pl_attack_side,pl_attack_front,pl_attack_back)
	image_index = 0 
	velh = 0
	velv = 0
 }
estado_attack.roda=function()
{
	if (image_index > image_number-.2 ){
	
		troca_estado(estado_idle)
	}
}

//iniciando variaveis
#region inivciando variaveis
//controles estao sendo iniciado sem valor 
up = noone
down = noone
left = noone
rigth = noone

attack = noone

//variaveis de movimento 
//iniciando parado
velh = 0
velv = 0
//velociade do jogador 
vel = 2

dir = 0
#endregion

inicia_estado(estado_idle)