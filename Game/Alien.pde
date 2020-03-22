final color CAlien = color(255); // Colore Alien
final int AlienWidth = 20;
final int AlienHeight = 20;

class Alien {
    ArrayList<Bullet> BulletList;
    boolean Temp; // Variabile per la "Animazione"
    boolean Visible;
    float X;
    float Y;
    float A; // Variabile per la Gestione del Tempo
    float B; // Variabile per la Gestione del Tempo
    float Level; // Il Level determina la Velocità
    int Type; // 0 = Cerchio, 1 = Quadrato, 2 = Triangolo
    int P; // Punteggio
    
    Alien(float _X, float _Y, int _T, float _Level) {
        BulletList = new ArrayList<Bullet>();
        Temp = false;
        Visible = true;
        X = _X;
        Y = _Y;
        A = 0;
        B = 0;
        Level = _Level;
        Type = _T;
        if (Type == 0) P = 10;
        else if (Type == 1) P = 20;
        else if (Type == 2) P = 40;        
    }
    
    void Display() {
        if (Visible) {
          
            // Animazione
            A = millis() - B;
            if (A > 1000 - abs(Level) * 100) {
                B = millis();
                Temp = !Temp;
            }
            
            if (Type == 0) {
                fill(CAlien);
                ellipseMode(CENTER);
                ellipse(X, Y, AlienWidth, AlienHeight);
                fill(GameBG);
                ellipse(X - AlienWidth / 4, Y - AlienHeight / 5, AlienWidth / 4, AlienHeight / 4);
                ellipse(X + AlienWidth / 4, Y - AlienHeight / 5, AlienWidth / 4, AlienHeight / 4);
                fill(CAlien);
                ellipse(X - AlienWidth / 3, Y + AlienHeight / 2 + AlienHeight / 4, AlienWidth / 4, AlienHeight / 4);
                ellipse(X + AlienWidth / 3, Y + AlienHeight / 2 + AlienHeight / 4, AlienWidth / 4, AlienHeight / 4);
                if (Temp) {
                    ellipse(X - AlienWidth / 2, Y + AlienHeight / 2 + AlienHeight / 4 + AlienHeight / 4, AlienWidth / 4, AlienHeight / 4);
                    ellipse(X + AlienWidth / 2, Y + AlienHeight / 2 + AlienHeight / 4 + AlienHeight / 4, AlienWidth / 4, AlienHeight / 4);
                }
                else {
                    ellipse(X - AlienWidth / 4, Y + AlienHeight / 2 + AlienHeight / 4 + AlienHeight / 4, AlienWidth / 4, AlienHeight / 4);
                    ellipse(X + AlienWidth / 4, Y + AlienHeight / 2 + AlienHeight / 4 + AlienHeight / 4, AlienWidth / 4, AlienHeight / 4);
                }
            }
            else if (Type == 1) {
                fill(CAlien);
                ellipseMode(CENTER);
                rect(X, Y, AlienWidth, AlienHeight);
                fill(GameBG);
                rect(X - AlienWidth / 4, Y - AlienHeight / 5, AlienWidth / 4, AlienHeight / 4);
                rect(X + AlienWidth / 4, Y - AlienHeight / 5, AlienWidth / 4, AlienHeight / 4);
                fill(CAlien);
                rect(X - AlienWidth / 3, Y + AlienHeight / 2 + AlienHeight / 4, AlienWidth / 4, AlienHeight / 4);
                rect(X + AlienWidth / 3, Y + AlienHeight / 2 + AlienHeight / 4, AlienWidth / 4, AlienHeight / 4);
                if (!Temp) {
                    rect(X - AlienWidth / 2, Y + AlienHeight / 2 + AlienHeight / 4 + AlienHeight / 4, AlienWidth / 4, AlienHeight / 4);
                    rect(X + AlienWidth / 2, Y + AlienHeight / 2 + AlienHeight / 4 + AlienHeight / 4, AlienWidth / 4, AlienHeight / 4);
                }
                else {
                    rect(X - AlienWidth / 4 , Y + AlienHeight / 2 + AlienHeight / 4 + AlienHeight / 4, AlienWidth / 4, AlienHeight / 4);
                    rect(X + AlienWidth / 4, Y + AlienHeight / 2 + AlienHeight / 4 + AlienHeight / 4, AlienWidth / 4, AlienHeight / 4);
                }
            }
            else if (Type == 2) {
                fill(CAlien);
                ellipseMode(CENTER);
                ellipse(X, Y, AlienWidth, AlienHeight);
                fill(GameBG);
                rect(X - AlienWidth / 4, Y - AlienHeight / 5, AlienWidth / 4, AlienHeight / 4);
                rect(X + AlienWidth / 4, Y - AlienHeight / 5, AlienWidth / 4, AlienHeight / 4);
                fill(CAlien);
                rect(X - AlienWidth / 3, Y + AlienHeight / 2 + AlienHeight / 4, AlienWidth / 4, AlienHeight / 4);
                rect(X + AlienWidth / 3, Y + AlienHeight / 2 + AlienHeight / 4, AlienWidth / 4, AlienHeight / 4);
                if (Temp) {
                    rect(X - AlienWidth / 2, Y + AlienHeight / 2 + AlienHeight / 4 + AlienHeight / 4, AlienWidth / 4, AlienHeight / 4);
                    rect(X + AlienWidth / 2, Y + AlienHeight / 2 + AlienHeight / 4 + AlienHeight / 4, AlienWidth / 4, AlienHeight / 4);
                }
                else {
                    rect(X - AlienWidth / 4, Y + AlienHeight / 2 + AlienHeight / 4 + AlienHeight / 4, AlienWidth / 4, AlienHeight / 4);
                    rect(X + AlienWidth / 4, Y + AlienHeight / 2 + AlienHeight / 4 + AlienHeight / 4, AlienWidth / 4, AlienHeight / 4);
                }
            }
        }
        
        // Velocità
        int O = int(random(0, 5000));
        if (O < Level * 0.5 && Visible) Shot();
        for (int I = 0; I < BulletList.size(); I++) BulletList.get(I).Display();
    }
    
    ArrayList<Bullet> GetBulletList() {
        return BulletList;
    }
    
    void Shot() {
        BulletList.add(new Bullet(X, Y + AlienHeight / 2, AlienWidth / 4, AlienHeight / 4, false));
    }
    
    void SetVisible(boolean B) {
        Visible = B;
    }
    
    void Move(float _X, float _Y) {
        X = _X;
        Y = _Y;
    }
    
    int GetScore() {
        return P;
    }
}
