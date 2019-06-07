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
  
  void update() {
    /*
        falls neueWaffeAusgewählt dann
          waffeÄndern()
        
        1 -> Schere
        2 -> Stein
        3 -> Papier
    */
    
    if (keyPressed == true) {
      if (key == '1') {
        //  Neue Waffe erzeugen
        Weapon newWeapon = new Weapon("Schere");
        
        //  Jetztige Waffe mit setter setzen
        setWeapon(newWeapon);
      }
      else if (key == '2') {
        Weapon newWeapon = new Weapon("Stein");
        
        setWeapon(newWeapon);
      }
      else if (key == '3') {
        Weapon newWeapon = new Weapon("Papier");
        
        setWeapon(newWeapon);
      }
    }
  }
  
  void render() {}
}
