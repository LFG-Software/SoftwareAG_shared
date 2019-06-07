import java.util.concurrent.ThreadLocalRandom;

public class Bot {
  String name;
  int difficulty;
  
  Weapon playerWeapon;
  Weapon botWeapon;
  
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
  
  Weapon getPlayerWeapon() { return playerWeapon; }
  Weapon getBotWeapon() { return botWeapon; }
  
  void setPlayerWeapon(Weapon newWeapon) { this.playerWeapon = newWeapon; }
  void setBotWeapon(Weapon newWeapon) { this.botWeapon = newWeapon; }
  
  void setName(String newName) {
    this.name = newName;
  }
  
  void setDifficulty(int newDiff) {
    this.difficulty = newDiff;
  }
  
  void update() {
    if (difficulty == 0) {
      /*
        In der Schwierigkeitsstufe 0 wird zufällig eine Wahl getroffen
      */
      
      //  zufällige Zahl von 0 bis 2 inklusive generieren
      int randomNum = ThreadLocalRandom.current().nextInt(0, 2 + 1);
      
      /*
        0 -> Schere
        1 -> Stein
        2 -> Papier
      */
  
      if (randomNum == 0) {
        setBotWeapon(new Weapon("Schere"));
      }
      if (randomNum == 1) {
        setBotWeapon(new Weapon("Stein"));
      }
      if (randomNum == 2) {
        setBotWeapon(new Weapon("Papier"));
      }
    }
  }
  
  void render() {}
} 
