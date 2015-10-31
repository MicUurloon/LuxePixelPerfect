package;

import luxe.Camera.SizeMode;
import luxe.Color;
import luxe.Input;
import luxe.Sprite;
import luxe.Vector;
import phoenix.Texture.FilterType;

class Main extends luxe.Game 
{
	
	var game_resolution_x:Int = 160;
	var game_resolution_y:Int = 120;
	
	var screen_w:Float;
	var screen_h:Float;
	
	var zoomfactor:Float;
	
	var background:Sprite;
	var player:Sprite;
	
	override function ready() 
	{
		zoomfactor = Math.floor(Luxe.screen.h / game_resolution_y);
		screen_w = Luxe.screen.w / zoomfactor;
		screen_h = Luxe.screen.h / zoomfactor;
		trace(zoomfactor);
		trace(screen_w);
		trace(screen_h);
		Luxe.camera.size = new Vector(screen_w, screen_h);
		Luxe.camera.size_mode = SizeMode.fit;
		var texture = Luxe.resources.texture('assets/background.png');
		
		texture.filter_mag = FilterType.nearest;
		var menubackground:Sprite = new Sprite( {
			name : 'background',
			texture : texture,
			centered: false,
			pos: new Vector(-80, -60),
		});
		
		var texture = Luxe.resources.texture('assets/player.png');
		texture.filter_mag = FilterType.nearest;
		var player:Sprite = new Sprite( {
			name : 'player',
			texture : texture,
			centered: false,
			pos: new Vector(80,80),
		});
		
		Luxe.draw.rectangle({
			x : 0, 
			y : 0,
			w : 160, 
			h : 120,
			depth:10, 
			color : new Color( 0.8, 0.3, 0.2, 1 )
		});
	}

	override function onkeyup(e:KeyEvent) 
	{
		if(e.keycode == Key.escape)
			Luxe.shutdown();
	}
	
	override function onkeydown(e:KeyEvent) 
	{
		if (e.keycode == Key.left) {
			Luxe.camera.pos.x -= 1;
		}
		if (e.keycode == Key.right) {
			Luxe.camera.pos.x += 1;
		}
		if (e.keycode == Key.down) {
			Luxe.camera.pos.y += 1;
		}
		if (e.keycode == Key.up) {
			Luxe.camera.pos.y -= 1;
		}
	}

	override function update(dt:Float) 
	{
	}
	
	override function config( config:luxe.AppConfig ) {
		config.window.width = Math.round(1024);
        config.window.height = Math.round(768);
		config.window.title = 'PixelPerfectZoomTest';
		
		config.preload.textures = [
            { id:'assets/background.png' },
            { id:'assets/player.png' },
        ];
        return config;

    }
	
	
}
