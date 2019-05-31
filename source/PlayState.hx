package;

import flixel.FlxState;
import flixel.FlxG;
import flixel.text.FlxText;
import flixel.addons.display.FlxTiledSprite;

import Config;
import AssetPaths;
import Progression;

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
    add(_score);

    if (Config.GOALS)
    {
      // TODO use sprite group for grid to draw behind player
      _grid = new Grid(this, player);
    }

    add(player);
  }

  override public function draw():Void
  {
    var flashMessage = Progression.Get().getFlashMessage();
    if (flashMessage != null)
    {
      flashMessage.draw();
    }
    else
    {
      super.draw();
    }
  }

  override public function update(elapsed:Float):Void
  {
    var flashMessage = Progression.Get().getFlashMessage();
    if (flashMessage == null)
    {

      super.update(elapsed);
      if (Config.GOALS)
      {
        _grid.update(elapsed);
      }

    }
    else
    {
      #if (web || desktop)
      if (FlxG.keys.pressed.SPACE)
      {
        Progression.Get().clearFlashMessage();
      }
      #end

      #if mobile
      for (swipe in FlxG.swipes)
      {
        if (swipe.distance > 10)
        {
          Progression.Get().clearFlashMessage();
        }
      }
      #end
    }
  }
}
