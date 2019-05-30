package ents;

import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.FlxObject;
import flixel.text.FlxText;

import Config;
import AssetPaths;

class Plant extends FlxSprite
{
  private var _growTime:Float = 0;
  private var _waterTime:Float = 0;
  private var _label:FlxText;
  private var _showLabel:Bool = false;

  public function new(x:Float, y:Float)
  {
    super(x, y);

    if (Config.GRAPHICS)
    {
      loadGraphic(AssetPaths.flower64_4x1__png, true, 32, 32);
      // TODO - resize plant graphics to 64 by 64
      setGraphicSize(64,64);
      updateHitbox();
      this.animation.add("dirt", [0]);
      this.animation.add("new", [1]);
      this.animation.add("half", [2]);
      this.animation.add("done", [3]);

      this.animation.play("new");
    }
    else
    {
      makeGraphic(32, 32, FlxColor.BROWN);
    }

    _label = new FlxText(x, y + 16, 0, "0%", 16);
  }

  public function interact(delta:Float):Void
  {
    _waterTime += delta;
  }

  public override function update(delta:Float):Void
  {
    // TODO - refactor animation selection
    var animName = "dirt";
    if (this.growing())
    {
      if (Config.GRAPHICS)
      {
        animName = "new";
      }
      else
      {
        this.color = FlxColor.GREEN;
      }
      _growTime += delta;
    }

    if (_growTime > 2 && _growTime < 5)
    {
      animName = "half";
    }

    if (_growTime >= 5)
    {
      if (Config.GRAPHICS)
      {
        animName = "done";
      }
      else 
      {
        this.color = FlxColor.RED;
      }
    }

    if (Config.GRAPHICS)
    {
      this.animation.play(animName);
    }
  }

  public override function draw():Void
  {
    super.draw();
    drawLabel();
  }

  private function drawLabel():Void
  {
    if (_waterTime > 0 && _waterTime <= 2)
    {
      _label.text = Math.floor((_waterTime / 2) * 100) + "%";
      _label.draw();
    }
  }

  private function growing():Bool
  {
    return this._waterTime > 2;
  }
}
