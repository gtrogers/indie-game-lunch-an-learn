package;

import flixel.FlxBasic;
import flixel.text.FlxText;

class Progression extends FlxBasic
{
  private var _speedBoost:Bool = false;
  private var _plantCapBoost:Bool = false;
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
    if (_speedBoost) return 4;
    return 2;
  }

  public function getPlantCap():Int
  {
    if (_plantCapBoost) return 20;
    return 10;
  }

  public function setFlashMessage(text:String):Void
  {
    this._flashMessage = new FlxText(0, 0, 0, text + "\n[space/swipe]", 64);
    this._flashMessage.screenCenter();
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
    if (_score >= 5 && !_speedBoost)
    {
      _speedBoost = true;
      this.setFlashMessage("Well done!\nSpeed boost unlocked!");
    }

    if (_score >= 15 && !_plantCapBoost)
    {
      _plantCapBoost = true;
      this.setFlashMessage("Hooray!\nMore plants unlocked!");
    }
  }

  public function getScore():Int
  {
    return _score;
  }

  public function getTarget():Int
  {
    if (_score < 5) return 5;
    if (_score >= 5 && _score < 15) return 15;
    if (_score >= 10 && _score < 1000) return 1000;
    return 10000;
  }
}
