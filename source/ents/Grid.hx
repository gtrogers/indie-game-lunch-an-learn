package ents;

import flixel.FlxG;
import flixel.FlxState;
import flixel.math.FlxRandom;
import flixel.FlxObject;

import ents.Plant;

// TODO - extend FlxBasic
class Grid
{
  private var _plants:Array<Plant> = [];
  private var _random:FlxRandom;
  private var _parentState:FlxState;
  private var _player:FlxObject;

  public function new(state:FlxState, player:FlxObject)
  {
    _random = new FlxRandom();
    _parentState = state;
    _player = player;
  }

  public function update(delta:Float)
  {
    handleCollisions(delta);
    if (_plants.length < 10)
    {
      var x = FlxG.width * 0.9;
      var y = FlxG.height * 0.9;
      var plant = new Plant(_random.float(x) + FlxG.width * 0.05, _random.float(y) + FlxG.height * 0.05);
      _plants.push(plant);
      _parentState.add(plant);
    }
  }

  private function handleCollisions(delta:Float):Void
  {
    for (plant in _plants)
    {
      if (FlxG.overlap(_player, plant))
      {
        plant.interact(delta);
      }
    }
  }  
}
