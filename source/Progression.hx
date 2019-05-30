package;

import flixel.FlxBasic;

class Progression extends FlxBasic
{
  private var _playerSpeed:Float = 2;
  private var _waterTime:Float = 2;
  private var _growTime:Float = 2;
  private var _score:Int = 0;

  private static var _self:Progression;

  public static function Get():Progression
  {
    if (_self == null)
    {
      _self = new Progression();
    }

    return _self;
  }

  private function new()
  {
    super();
  }

  public function getPlayerSpeed():Float
  {
    return _playerSpeed;
  }
}
