public class GameBoard {
  float gameWidth;
  float gameHeight;
  
  // result will be 0 if nobody has won yet, -1 if the computer won, 1 if the player won
  int result;
  
  Timer timer;
  Player player;
  Bot bot;
  
  public GameBoard(float gameWidth, float gameHeight) {
     this.gameWidth = gameWidth;
     this.gameHeight = gameHeight;
  }
  
  public void init() {
    result = 0;
  }
  
  public void update() {
    
  }
  
  public void render() {
    
  }
  
}
