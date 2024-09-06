// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function estado()constructor
{
	//iniciando estado
	static inicia = function(){}
	//rodando estado
	static roda = function(){}
	//finalizando o estado
	static finaliza = function(){}
	
}

//funcooes para iniciar estado 
function inicia_estado (_estado)

{
	estado_atual = _estado
	
	estado_atual.inicia()
}


function roda_estado()
{
	estado_atual.roda()	
}
function troca_estado(_estado)
{
	estado_atual.finaliza()
	
	estado_atual=_estado
	estado_atual.inicia()
}


///definindo a sprite
function define_sprite (_dir = 0 ,_sprite_side,_sprite_front,_sprite_back)
{
	var _sprite
	switch(_dir)
	{
		case 0 : _sprite = _sprite_side break
		case 1 : _sprite = _sprite_back break
		case 2 : _sprite = _sprite_side break
		case 3 : _sprite = _sprite_front break
		
	}
	 return _sprite
}