package;

import flixel.FlxState;
import flixel.FlxG;
import flixel.addons.display.FlxTiledSprite;

import Config;
import AssetPaths;

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

    if (Config.GRAPHICS)
    {
      var backdrop = new FlxTiledSprite(AssetPaths.floor__png, FlxG.width, FlxG.height);
      add(backdrop);
    }

    var player = new Player(20, 20);
    _score = new Score();
    add(player);
    add(_score);

    if (Config.GOALS)
    {
      _grid = new Grid(this, player);
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
