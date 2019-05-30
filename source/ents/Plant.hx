package ents;

import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.FlxObject;


class Plant extends FlxSprite
{
  public function new(x:Float, y:Float)
  {
    super(x, y);
    makeGraphic(16, 16, FlxColor.GREEN);
  }

  public function interact(player: FlxObject):Void
  {
    trace('ping');
    super.color = 0xff0000ff;
  }
}
