final color GameBG = #000000;
final float PanzerX = Width / 2; // Posizione Iniziale Panzer
final float PanzerY = Height - PanzerHeight; // Posizione Iniziale Panzer
final float DistanceAliensX = AlienWidth * 6 / 2; // Distanza tra gli Alieni
final float DistanceAliensY = AlienWidth * 7 / 3; // Distanza tra gli Alieni
final float DescentSpeedAliens = 10; // Velocita Discesa Alieni

class RealGame {
    ArrayList<Alien> AlienList;
    boolean End; // Verifica Fine del Gioco
    int Score;
    int Level;
    int PanzerLives;
    Panzer MyPanzer;
    UFO MyUFO;
    
    RealGame() {
        AlienList = new ArrayList<Alien>();
        End = false;
        Score = 0;
        Level = 1;
        PanzerLives = 3;
        MyPanzer = new Panzer(PanzerX, PanzerY);
        MyUFO = new UFO(Width + UFOWidth / 2, - 1000);
        
        // Generazione Alieni
        int RowLenght = Width / (AlienWidth + 50);
        for (int I = 0, H = 0; I < 5; I++, H += DistanceAliensY) {
            for (int J = 0, K = 0; J < RowLenght; J++, K+= DistanceAliensX) {
                if (I == 0) AlienList.add(new Alien(AlienWidth / 2 + 20 + K, AlienHeight / 2 + 50 + H, 2, Level));
                else if (I == 1 || I == 2) AlienList.add(new Alien(AlienWidth / 2 + 20 + K, AlienHeight / 2 + 50 + H, 1, Level));
                else if (I == 3 || I == 4) AlienList.add(new Alien(AlienWidth / 2 + 20 + K, AlienHeight / 2 + 50 + H, 0, Level));
            }
        }
    }
    
    void Run() {
        if (!End) {
            background(GameBG);
            stroke(CPanzer);
            line(0, Height - PanzerHeight + 10, Width, Height - PanzerHeight + 10);
            fill(255);
            textSize(20);
            textAlign(CENTER, CENTER);
            text("Vite: " + PanzerLives, 50, Height - 20);
            text("Punteggio: " + Score, Width / 2, Height - 20);
            text("Livello: " + abs(int(Level)), Width - 100, Height - 20);
            
            MyPanzer.Display();
            
            boolean Reset = true;
            
            for (int I = 0; I < AlienList.size(); I++) {
                AlienList.get(I).Display(); // Visualizzazione Alieni
                if (AlienList.get(I).Visible) Reset = false; // Verifica se ci sono ancora Alieni in Vita...
            }
            
            if (Reset) {
                int RowLenght = Width / (AlienWidth + 50);                
                for (int I = 0, H = 0; I < 5; I++, H += DistanceAliensY) {
                    for (int J = 0, K = 0; J < RowLenght; J++, K += DistanceAliensX) {
                        if (I == 0) AlienList.set(J, new Alien(AlienWidth / 2 + 20 + K, AlienHeight / 2 + 50 + H, 2, Level));
                        else if (I == 1) AlienList.set(J + RowLenght, new Alien(AlienWidth / 2 + 20 + K, AlienHeight / 2 + 50 + H, 1, Level));
                        else if (I == 2) AlienList.set(J + RowLenght * 2, new Alien(AlienWidth / 2 + 20 + K, AlienHeight / 2 + 50 + H, 1, Level));
                        else if (I == 3) AlienList.set(J + RowLenght * 3, new Alien(AlienWidth / 2 + 20 + K, AlienHeight / 2 + 50 + H, 0, Level));
                        else if (I == 4) AlienList.set(J + RowLenght * 4, new Alien(AlienWidth / 2 + 20 + K, AlienHeight / 2 + 50 + H, 0, Level));
                    }
                }
                PanzerLives = 3;
                Level = abs(Level);
                Level++;
            }
            
            // Verifica Alieni a Terra
            for (int I = 0; I < AlienList.size(); I++) {
                if (AlienList.get(I).Y + AlienHeight / 2 > MyPanzer.Y - PanzerHeight && AlienList.get(I).Visible) {
                    GameOver();
                    break;
                }
            }
            
            // Rimbalzo
            if (AlienList.get(AlienList.size() - 1).X + Level >= Width - AlienWidth / 2 || AlienList.get(0).X + Level <= AlienWidth / 2) {
                Level = - Level;
                for (int I = 0; I < AlienList.size(); I++) {
                    AlienList.get(I).Move(AlienList.get(I).X, AlienList.get(I).Y + DescentSpeedAliens);
                }
            }
            
            for (int I = 0; I < AlienList.size(); I++) {
                AlienList.get(I).Move(AlienList.get(I).X + Level * 0.5, AlienList.get(I).Y); // Movimento Alieni
                
                // Shot agli Alieni
                if (MyPanzer.B.CheckAlien(AlienList.get(I))) {
                    AlienList.get(I).SetVisible(false);
                    MyPanzer.B.Y = - 2000;
                    Score += AlienList.get(I).GetScore();
                }
                
                // Shot al Panzer
                for (int J = 0; J < AlienList.get(I).GetBulletList().size(); J++) {
                    if (AlienList.get(I).GetBulletList().get(J).CheckPanzer(MyPanzer)) {
                        AlienList.get(I).GetBulletList().get(J).Y = Height + 2000;
                        PanzerLives--;
                        if (PanzerLives == - 1) {
                            GameOver();
                        }
                        MyPanzer.Hit();
                    }
                }
            }
            
            // Spawn UFO
            int I = int(random(0, 200));
            if (I < 1 && MyUFO.X < -100) {
                MyUFO = new UFO(Width + UFOWidth / 2, 30);
            }
            MyUFO.Display();
            if (MyUFO.CheckBullet(MyPanzer.B)) {
                Score += MyUFO.GetScore();
                MyUFO.X = - 100;
            }   
        }
    }
    
    void GameOver() {
        javax.swing.JOptionPane.showMessageDialog(null, "Gioco Terminato! Punteggio: " + Score);
        PanzerLives = 3;
        End = true;
    }
    
    boolean IsEnd() {
        return End;
    }
    
    int GetScore() {
        return Score;
    }
}
