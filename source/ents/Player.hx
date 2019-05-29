package ents;

import flixel.math.FlxPoint;
import flixel.math.FlxVector;
import flixel.math.FlxRandom;
import flixel.FlxG;
import flixel.text.FlxText;

import Config;

class Player extends FlxText
{
  private var _rand:FlxRandom;
  private var _direction:FlxVector;
  private var _moveTime:Float = 0;

  public function new(x:Float, y:Float)
  {
    super(x, y, 0, "x", 16);
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
    if (FlxG.mouse.pressed)
    {
      var mouse = FlxG.mouse.getPosition();

      this.moveToward(mouse.x, mouse.y);
    }
  }

  private function mobileMove():Void
  {
    #if FLX_TOUCH 
    for (touch in FlxG.touches.list)
    {
      if (touch.pressed)
      {
        this.moveToward(touch.x, touch.y);
      }
    }
    #end
  }

  private function moveToward(x:Float, y:Float):Void
  {
    var distanceNormal = new FlxVector(x, y).subtract(this.x, this.y).normalize();
    this.x += distanceNormal.x;
    this.y += distanceNormal.y;
  }

  private function moveRandom(delta:Float):Void
  {
    _moveTime += delta;

    if (_moveTime > 3)
    {
      var xPos = _rand.float(0, FlxG.width);
      var yPos = _rand.float(0, FlxG.height);
      _direction = new FlxVector(xPos, yPos).subtract(this.x, this.y).normalize();
      _moveTime = 0;
    }

    this.x += _direction.x;
    this.y += _direction.y;
  }
}
