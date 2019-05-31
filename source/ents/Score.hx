package ents;

import flixel.text.FlxText;
import flixel.util.FlxColor;

import Progression;
import Config;

class Score extends FlxText
{
  public function new()
  {
    super(0, 0, 0, "0", 42);
    this.color = FlxColor.PURPLE;
  }

  public override function update(delta:Float):Void
  {
    if (Config.PROGRESS)
    {
      this.text = (Progression.Get().getScore() + " / " + Progression.Get().getTarget());
    }
  }
}
