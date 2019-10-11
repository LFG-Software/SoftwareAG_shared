class Game {
  // Attribute
   private float gameSize;              // Größe des quadratischen Fensters (wird im Konstruktor gesetzt)
   private int[][] playingField;        // 2-dimensionales Array, in dem der aktuelle Spielzustand festgehalten werden soll
   private int turn;                    // Aktueller Spielzug
   
   private PFont font;                  // Schriftart für die Ausgabe des Ergebnisses am Ende
   
   // Konstruktor
   public Game(float gameSize) {
     this.gameSize = gameSize; 
     this.font = createFont("Arial", 30, true);
   }
   
   // Methoden
   
   // Initialisierung der Attrribute mit Ausgangswerten
   public void init() {
     // Unser Spielfeld ist ein 3x3-Feld. Am Anfang sind alle Plätze 0, was dafür steht, dass dieser Platz noch leer ist
     playingField = new int[3][3];
     // Am Anfang befinden wir uns bei Spielzug 1
     turn = 1;
   }
   

   public int run() {
     /*
     *  Erläuterungen zur run()-Methode:
     *  Ist die Zugzahl größer als '9', so soll '100' zurückgeben werden, um ein Unentschieden zu signalsieren.
     *  Befinden wir uns in einem "ungeraden" Spielzug (1, 3, 5, 7, 9), so soll beim Klicken (mit der linken Maustaste) in ein leeres Feld in unserem playingField-Array an der jeweiligen Stelle eine '1' eingetragen werden.
     *  Befinden wir uns in einem "geraden" Spielzug (2, 4, 6, 8), so soll beim Klicken (mit der linken Maustaste) in ein leeres Feld in unserem playingField-Array an der jeweiligen Stelle eine '-1' eingetragen werden.
     *  Abschließend soll das Ergebnis der Methode 'getWinner()' zurückgegeben werden.
     *
     *  Anmerkungen: 
     *  Zum Plazieren eines Wertes in unserem Array kann die Methode placeOnField verwendet werden (siehe unten).
     *  Zum Ermitteln von Mausklicks und der Mouseposition vgl. https://processing.org/tutorials/interactivity/
     */
     if(turn > 9) {
       return 100;
     }
     if(mousePressed == true && mouseButton == LEFT) {
       if(turn % 2 == 1) {
         placeOnField(mouseX, mouseY, 1);
       }
       else {
         placeOnField(mouseX, mouseY, -1);
       }
     }
     return getWinner();
   }
   
   public void placeOnField(float posX, float posY, int val) {
     /*
     *  Erläuterungen zur placeOnField(...)-Methode:
     *  Diese Methode erwartet zwei Koordinaten auf unserem Spielfeld und einen Wert, der eingetragen werden soll.
     *  Anhand der Koordinaten soll ermittelt werden, an welche Stelle in 'playingField', der Wert plaziert werden soll.
     *  Der Wert darf nur eingetragen werden, wenn die Stelle in 'playingField' noch frei, also noch '0' ist.
     *  Wurde der Wert eingetragen, so muss 'turn' um '1' erhöht werden.
     *
     *  Anmerkung: Das Ergebnis x einer Berechnung mit floats kann mit '(int) x' in einen int umgewandelt werden (bei Fragen einfach an mich wenden)
     */
     int x = (int) (posX / (gameSize / 3));
     int y = (int) (posY / (gameSize / 3));
     if(playingField[x][y] == 0) {
       playingField[x][y] = val;
       turn++;
     }
   }
   
   public int getWinner() {
     /*
     *  Erläuterungen zur getWinner()-Methode:
     *  Es soll ermittelt werden, ob irgendwo auf dem Spielfeld eine Dreierreihe von gleichen Werten zu finden ist (vertikal, horizontal oder diagonal!).
     *  Ist dies der Fall, so soll der Wert aus dem diese Reihe gebildet wird zurückgegeben.
     *  Findet sich keine solche Reihe, so soll '0' zurückgegebne werden, wodurch signalisiert wird, dass das Spiel noch nicht vorbei ist.
     *  
     *  Das ist die schwierigste der Methoden, wer also hierbei nicht weiterkommt, kann sich bei mir melden und kriegt dann den Code von mir.
     */
     for(int i = 0; i < 3; i++) {
       if(playingField[i][0] == playingField[i][1] && playingField[i][1] == playingField[i][2]) {
         return playingField[i][0];
       }
       if(playingField[0][i] == playingField[1][i] && playingField[1][i] == playingField[2][i]) {
         return playingField[0][i];
       }
     }
     if(playingField[0][0] == playingField[1][1] && playingField[1][1] == playingField[2][2]) {
       return playingField[0][0];
     }
     if(playingField[0][2] == playingField[1][1] && playingField[1][1] == playingField[2][0]) {
       return playingField[0][2];
     }
     return 0;
   }
   
   // Gegeben
   public void declareWinner(int resCode) {
     textFont(font);
     textAlign(CENTER);
     if(resCode == 1) {
       fill(0, 255, 0); 
       text("X's won!", width/2, height/2);
     }
     else if(resCode == -1) {
       fill(255, 0, 0);
       text("O's won!", width/2, height/2);
     }
     else {
       fill(255, 255, 0);
       text("Draw!", width/2, height/2);
     }
     text("Press 'ENTER' to play again", width/2, height/2 + 60);
   }
   
   // Gegegeben
   // Zeichnet das Spielfeld anhand der Einträge in playingField, wobei '1' für ein 'X' steht und '-1' für ein 'O' steht
   public void render() {
     stroke(255);
     line(gameSize/3, 0, gameSize/3, gameSize);
     line((gameSize/3) * 2, 0, (gameSize/3) * 2, gameSize);
     line(0, gameSize/3, gameSize, gameSize/3);
     line(0, (gameSize/3) * 2, gameSize, (gameSize/3) * 2);
     for(int i = 0; i < playingField.length; i++) {
       for(int k = 0; k < playingField.length; k++) {
         if(playingField[i][k] == 1) {
           line(i * (gameSize/3) + (0.05 * gameSize), k * (gameSize/3) + (0.05 * gameSize), (i+1) * (gameSize/3) - (0.05 * gameSize), (k+1) * (gameSize/3) - (0.05 * gameSize));
           line((i+1) * (gameSize/3) - (0.05 * gameSize), k * (gameSize/3) + (0.05 * gameSize), i * (gameSize/3) + (0.05 * gameSize), (k+1) * (gameSize/3) - (0.05 * gameSize));
         }
         if(playingField[i][k] == -1) {
           float xPos = i * (gameSize/3) + 0.5 * (gameSize/3);
           float yPos = k * (gameSize/3) + 0.5 * (gameSize/3);
           fill(0);
           ellipse(xPos, yPos, (gameSize/3) - (0.05 * gameSize), (gameSize/3) - (0.05 * gameSize));
         }
       }
     }
   }
}
