package ents;

import flixel.FlxG;
import flixel.FlxState;
import flixel.math.FlxRandom;

import ents.Plant;

class Grid
{
  private var _plants:Array<Plant> = [];
  private var _random:FlxRandom;
  private var _parentState:FlxState;

  public function new(state:FlxState)
  {
    _random = new FlxRandom();
    _parentState = state;
  }

  public function update(delta:Float)
  {
    if (_plants.length < 10)
    {
      var x = FlxG.width * 0.9;
      var y = FlxG.height * 0.9;
      var plant = new Plant(_random.float(x) + FlxG.width * 0.05, _random.float(y) + FlxG.height * 0.05);
      _plants.push(plant);
      _parentState.add(plant);
    }
  }
}
