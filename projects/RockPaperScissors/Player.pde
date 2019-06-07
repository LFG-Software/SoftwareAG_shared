public class Player {
  Weapon weapon1;
  String name;
 
  public Player(String newName) {
    this.name = newName;
  }
  
  String getName() {
    return name;
  }
  
  Weapon getWeapon() {
    return weapon1;
  }
  
  void setName(String newName) {
    this.name = newName;
  }

  void setWeapon(Weapon newWeapon) {
    this.weapon1 = newWeapon; 
  }
}
