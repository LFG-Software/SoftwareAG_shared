// In dieser Klasse müsst ihr gar nix machen. Ihr solltet nur verstehen, was gemacht wird und wie hier die Methoden auf dem Game-Objekt
Game g;
int res;

// Diese Methode wird von Processing einmal ganz am Anfang ausgeführt
void setup() {
  // Größe des Fensters auf 720x720 Pixel setzen
  size(720, 720);
  // Hintergrund auf schwarz setzen
  background(0);
  // Objekt der Klasse 'Game' mithilfe des Konstruktors erstellen
  g = new Game(width);
  // Spiel initialisieren
  g.init();
  res = 0;
}

// Diese Methode wird von Processing automatisch in einer Endlosschleife immer wieder ausgeführt
void draw() {
  // Ist res noch '0', so ist das Spiel noch nicht vorbei, ansonsten muss das Ergebnis verkündet werden
  if(res == 0) {
    // Input entgeben nehmen und Spielstand ermitteln
    res = g.run();
    // Aktuellen Spielstand zeichnen
    g.render();
  }
  else {
    // Gewinner ausgeben
    g.declareWinner(res);
    // Spiel wird mittels 'ENTER'-Taste neugestartet
    if(keyPressed == true) {
      if(key == ENTER) {
        res = 0;
        clear();
        g.init();
      }

    }
  }
}
