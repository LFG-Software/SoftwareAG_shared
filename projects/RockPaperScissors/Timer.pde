public class Timer {
  float currentTime;
  
  void setTime(float newTime) {
    this.currentTime = newTime;
  }
  
  float getTime() {
    return currentTime;
  }
  
  void decrement() {
    currentTime--;
  }
  
  
}
