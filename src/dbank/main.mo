import Debug "mo:base/Debug";
import Int "mo:base/Int";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor DBank {
  stable var currentValue:Float = 300;
  // currentValue := 300;
  Debug.print(debug_show(currentValue));

  stable var startTime = Time.now();
    // startTime := Time.now();
    Debug.print(debug_show(startTime));


  public func topUp(amount: Float)  {
    currentValue += amount; 
    Debug.print(debug_show(currentValue));
  };

  public func withdrawl(amount: Float) {
    
    if(currentValue >= amount)
    {
      currentValue -=amount;
      Debug.print(debug_show(currentValue));
    }
    else{
      Debug.print("amount is greater than current value");
    }
  };

  public query func readTime():async Int {
    return Time.now();
  };

  public query func checkBalance():async Float {
    return currentValue;
  };

  public func compound(): async Float {
    let currentTime = Time.now();
    let timeElapsedNS = currentTime - startTime;
    let timeElapsedS = timeElapsedNS /1000000000;
    currentValue := currentValue * (1.01 ** Float.fromInt(timeElapsedS));
    startTime := currentTime;
    return currentValue;
  }
}