package ents;

import flixel.text.FlxText;

class Score extends FlxText
{
  public function new()
  {
    super(0, 0, 0, "0", 16);
    this.screenCenter();
    this.y = 0;
  }

  public function increase(n:Float):Void
  {
    this.text = "hello";
  }
}
