package ents;

import flixel.FlxG;
import flixel.FlxState;
import flixel.math.FlxRandom;
import flixel.FlxObject;
import flixel.group.FlxSpriteGroup;

import ents.Plant;
import PlayState;
import Progression;

// TODO - extend FlxBasic
class Grid
{
  private var _plants:FlxSpriteGroup;
  private var _random:FlxRandom;
  private var _parentState:PlayState;
  private var _player:FlxObject;

  public function new(state:PlayState, player:FlxObject)
  {
    _random = new FlxRandom();
    _parentState = state;
    _player = player;
    _plants = new FlxSpriteGroup();
    _parentState.add(_plants);
  }

  public function update(delta:Float)
  {
    handleCollisions(delta);
    var cap = Progression.Get().getPlantCap();
    var plantCount = _plants.countLiving();
    if (plantCount < cap && (_random.float() > plantCount/cap))
    {
      var x = FlxG.width * 0.9;
      var y = FlxG.height * 0.9;
      var plant = new Plant(_random.float(x) + FlxG.width * 0.05, _random.float(y) - FlxG.height * 0.05);
      _plants.add(plant);
    }
    cleanUp();
  }

  private function handleCollisions(delta:Float):Void
  {
    _plants.forEachOfType(Plant, function (p:Plant) if (FlxG.overlap(_player, p)) { p.interact(delta); } );
  }  

  private function cleanUp():Void
  {
    //BUG - clean up dead plants, currently is a memory leak
  }
}
