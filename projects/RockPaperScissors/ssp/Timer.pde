public class Timer {
  float currentTime;
  
  public Timer () {
    currentTime = 0;
  }
  
  void setTime(float newTime) {
    this.currentTime = newTime;
  }
  
  float getTime() {
    return currentTime;
  }
  
  void decrement() {
    currentTime--;
  }
  
  void update() {
    if (currentTime > 0.1) {
      decrement();
    }
  }
  
  void render() {}
}
