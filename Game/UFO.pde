color CUFO = #D50000; // Colore UFO
final float VelocitaUFO = 3; // Velocità UFO
final float UFOWidth = 40;
final float UFOHeight = 15;

class UFO {
    boolean Bonus; // Easter Egg
    float X;
    float Y;
    int P; // Punteggio
    
    UFO(float _X, float _Y) {
        X = _X;
        Y = _Y;
        int I = int(random(0, 10));
        if (I == 0) {
            Bonus = true;
            P = 10000;
        }
        else {
            Bonus = false;
            P = int(random(0, 5));
            if (P == 0) P = 100;
            else if (P == 1) P = 150;
            else if (P == 2) P = 200;
            else if (P == 3) P = 250;
            else if (P == 4) P = 300;
        }
    }
    
    void Display() {
        if (Bonus) {
            fill(random(0, 255), random(0, 255), random(0, 255));
        }
        else {
            fill(CUFO);
        }
        ellipse(X, Y - UFOHeight / 2, UFOWidth / 3, UFOHeight);
        ellipse(X, Y, UFOWidth, UFOHeight);
        Move();
    }
    
    void Move() {
        X -= VelocitaUFO;
    }
    
    boolean CheckBullet(Bullet B) {
        if (dist(X, Y, B.X, B.Y) <= UFOHeight / 2 + B.H / 2) return true;
        return false;
    }
    
    int GetScore() {
        return P;
    }
}
