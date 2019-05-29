package;

import flixel.FlxState;
import flixel.FlxG;

import Config;
import ents.Player;
import ents.Score;
import ents.Grid;


class PlayState extends FlxState
{
  var _score:Score;
  var _grid:Grid;

  override public function create():Void
  {
    // Setup goes here...
    super.create();
    var player = new Player(20, 20);
    _score = new Score();
    add(player);
    add(_score);

    if (Config.GOALS)
    {
      _grid = new Grid(this);
    }
  }

  override public function update(elapsed:Float):Void
  {
    // Game loop goes here...
    super.update(elapsed);
    if (Config.GOALS)
    {
      _grid.update(elapsed);
    }
  }
}
