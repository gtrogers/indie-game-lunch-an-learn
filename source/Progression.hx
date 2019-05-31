package;

import flixel.FlxBasic;
import flixel.text.FlxText;

class Progression extends FlxBasic
{
  private var _playerSpeed:Float = 2;
  private var _score:Int = 0;
  private var _flashMessage:FlxText;

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

  public function setFlashMessage(text:String):Void
  {
    this._flashMessage = new FlxText(0, 0, 0, text + "\n[space]", 64);
  }

  public function clearFlashMessage():Void
  {
    this._flashMessage = null;
  }

  public function getFlashMessage():FlxText
  {
    return this._flashMessage;
  }

  public function addToScore():Void
  {
    _score += 1;
  }

  public function getScore():Int
  {
    return _score;
  }

  public function getTarget():Int
  {
    if (_score < 5) return 5;
    if (_score >= 5 && _score < 10) return 10;
    if (_score >= 10 && _score < 1000) return 1000;
    return 10000;
  }
}
