final color CBullet = color(255); // Colore Bullet
final float SBullet = 7; // Velocità Bullet

class Bullet {
    float X;
    float Y;
    float W;
    float H;
    boolean B; // True = By Panzer False = By Alien
    
    Bullet(float _X, float _Y ,float _W, float _H, boolean _B) {
        X = _X;
        Y = _Y;
        W = _W;
        H = _H;
        B = _B;
    }
    
    void Display() {
        rectMode(CENTER);
        fill(255);
        rect(X, Y, W, H);
        Move();
    }
    
    void Move() {
        if (B) Y -= SBullet;
        else Y += SBullet;
    }
    
    boolean CheckAlien(Alien A) {
        if (dist(A.X, A.Y, X, Y) <= AlienWidth + W / 2 && A.Visible) return true;
        return false;
    }
    
    boolean CheckPanzer(Panzer P) {
        if (dist(P.X, P.Y, X, Y) <= PanzerWidth / 2 + W / 2) return true;
        return false;
    }
    
    boolean InPlace() {
        if (Y <= H / 2) return false;
        return true;
    }
    
    boolean Running() {
        if (InPlace()) return true;
        return false;
    }
}
