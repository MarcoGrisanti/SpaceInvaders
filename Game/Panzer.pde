final color CPanzer = #76FF03; // Colore Panzer
final float SPanzer = 6; // Velocità Panzer
final float PanzerWidth = 40;
final float PanzerHeight = 50;

// Costanti per il Movimento
final int Right = RIGHT;
final int Left = LEFT;
final int Stop = 0;

class Panzer {
    Bullet B;
    boolean Hit;
    float X;
    float Y;
    int A0; // Variabile per la Gestione del Tempo
    int B0; // Variabile per la Gestione del Tempo
    int Direction;
    
    Panzer(float _X, float _Y) {
        B = new Bullet(Width + 100, 0, 0, 0, true);
        Hit = false;
        X = _X;
        Y = _Y;
        A0 = 0;
        B0 = 0;
        Direction = Stop;
     }
    
    void Display() {
      
        // Quando il Panzer viene colpito si blocca l'esecuzione del programma per un secondo...
        if (Hit) {
            A0 = millis();
            while (B0 < A0 + 1000) {
                B0 = millis();
            }
            Hit = false;
        }
        
        strokeWeight(1);
        stroke(0);
        fill(CPanzer);
        ellipseMode(CENTER);
        quad(X - PanzerWidth / 2.5, Y - PanzerHeight / 15, X + PanzerWidth / 2.5, Y - PanzerHeight / 15, X + PanzerWidth / 4, Y - PanzerHeight / 4, X - PanzerWidth / 4, Y - PanzerHeight / 4);
        ellipse(X, Y, PanzerWidth, PanzerHeight / 5);
        rectMode(CENTER);
        rect(X, Y - PanzerHeight / 3, PanzerWidth / 8, PanzerHeight / 6);
        Move();
        B.Display();
    }
    
    void Move() {
        if (Direction == Right && X + PanzerWidth / 2 < Width - SPanzer) {
            X += SPanzer;
        }
        else if (Direction == Left && X > PanzerWidth / 2 + SPanzer) {
            X -= SPanzer;
        }
        else if (Direction == Stop) {
        
        }
    }
    
    void Shot() {
        if (!B.Running()) {
            B = new Bullet(X, Y - PanzerHeight / 3, PanzerWidth / 10, PanzerHeight / 8, true);
        }
    }
    
    void Hit() {
        Hit = true;
    }
}
