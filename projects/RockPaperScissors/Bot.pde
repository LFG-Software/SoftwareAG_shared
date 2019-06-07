public class Bot {
  String name;
  int difficulty;
  
  public Bot(String newName, int newDiff) {
    this.name = newName;
    this.difficulty = newDiff;
  }
  
  String getName() {
    return name;
  }
  
  int getDifficulty() {
    return difficulty;
  }
  
  void setName(String newName) {
    this.name = newName;
  }
  
  void setDifficulty(int newDiff) {
    this.difficulty = newDiff;
  }
} 
