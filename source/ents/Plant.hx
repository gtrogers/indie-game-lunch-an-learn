package ents;

import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.FlxObject;
import flixel.text.FlxText;

class Plant extends FlxSprite
{
  private var _growTime:Float = 0;
  private var _waterTime:Float = 0;
  private var _label:FlxText;
  private var _showLabel:Bool = false;

  public function new(x:Float, y:Float)
  {
    super(x, y);
    makeGraphic(32, 32, FlxColor.BROWN);
    _label = new FlxText(x, y + 16, 0, "0%", 16);
  }

  public function interact(delta:Float):Void
  {
    _waterTime += delta;
  }

  public override function update(delta:Float):Void
  {
    if (this.growing())
    {
      this.color = FlxColor.GREEN;
      _growTime += delta;
    }

    if (_growTime > 5)
    {
      this.color = FlxColor.RED;
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
