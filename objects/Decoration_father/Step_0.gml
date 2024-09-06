/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
 depth = -bbox_bottom
 
 
 
 // transparence
 
 
 // checking if player its there
 
 if (instance_exists(objs_player)){
		
		if(objs_player.y<y){
			
			if (point_in_rectangle(objs_player.x,objs_player.y,bbox_left-10,bbox_top-20,bbox_right,bbox_top))
			{
				
			image_alpha = lerp(image_alpha,.2,.02)
				
			}
			else
			
			{image_alpha = lerp(image_alpha,1,.04)}
			
		}
 }
 