package ents;

import flixel.text.FlxText;

class Plant extends FlxText
{
  public function new(x:Float, y:Float)
  {
    super(x, y, 0, "p", 16);
  }

  override public function update(delta:Float):Void
  {
    super.update(delta);
  }
}
