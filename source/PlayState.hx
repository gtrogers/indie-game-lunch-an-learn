package;

import flixel.FlxState;
import flixel.FlxG;

import ents.Player;
import ents.Score;

class PlayState extends FlxState
{
  var _score:Score;

  override public function create():Void
  {
    // Setup goes here...
    super.create();
    var player = new Player(20, 20);
    _score = new Score();
    add(player);
    add(_score);
  }

  override public function update(elapsed:Float):Void
  {
    // Game loop goes here...
    super.update(elapsed);
    if (FlxG.mouse.pressedRight)
    {
      _score.increase(1);
    }
  }
}
