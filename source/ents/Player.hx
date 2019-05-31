package ents;

import flixel.math.FlxPoint;
import flixel.math.FlxVector;
import flixel.math.FlxRandom;
import flixel.FlxG;
import flixel.FlxSprite;

import Config;
import Progression;
import AssetPaths;

class Player extends FlxSprite
{
  private var _rand:FlxRandom;
  private var _direction:FlxVector;
  private var _moveTime:Float = 0;

  public function new(x:Float, y:Float)
  {
    super(x, y);
    if (Config.GRAPHICS)
    {
      loadGraphic(AssetPaths.cloud64_3x1__png, true, 64, 64);
      this.setGraphicSize(256,256);
      this.updateHitbox();
      this.animation.add("rain", [0,1,2], 2, true);
      this.animation.play("rain");
    }
    else
    {
      makeGraphic(64, 64, 0xff00ffff);
    }
    _rand = new FlxRandom();
    _direction = new FlxVector(1,1);
    _direction.normalize();
  }

  override public function update(delta:Float):Void
  {
    super.update(delta);

    if (Config.PLAYER_CONTROLS)
    {
      #if (web || desktop)
      this.mouseMove();
      #end

      #if mobile
      this.mobileMove();
      #end
    }
    else
    {
      this.moveRandom(delta);
    }
  }

  private function mouseMove():Void
  {
    #if FLX_MOUSE
    if (FlxG.mouse.pressed)
    {
      var mouse = FlxG.mouse.getPosition();

      this.moveToward(mouse.x, mouse.y, Progression.Get().getPlayerSpeed());
    }
    #end
  }

  private function mobileMove():Void
  {
    #if FLX_TOUCH 
    for (touch in FlxG.touches.list)
    {
      if (touch.pressed)
      {
        this.moveToward(touch.x, touch.y, Progression.Get().getPlayerSpeed());
      }
    }
    #end
  }

  private function moveToward(x:Float, y:Float, speed:Float):Void
  {
    var distanceNormal = new FlxVector(x, y).subtract(this.x + 128, this.y + 128).normalize();
    this.x += distanceNormal.x * speed;
    this.y += distanceNormal.y * speed;
  }

  private function moveRandom(delta:Float):Void
  {
    _moveTime += delta;

    //TODO deal with player moving off of screen

    if (_moveTime > 3)
    {
      var xPos = _rand.float(0, FlxG.width);
      var yPos = _rand.float(0, FlxG.height);
      _direction = new FlxVector(xPos, yPos);
      _moveTime = 0;
    }

    this.moveToward(_direction.x, _direction.y, Progression.Get().getPlayerSpeed());
  }
}
