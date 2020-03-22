color StandardButtonColor = #546E7A;
color StandardTextBoxColor = color(255, 255, 255);
color StandardTextColorButton = color(255, 255, 255);
color StandardTextColorTextBox = color(0);
int StandardTextSize = 10;

class Button {
    boolean Selected;
    boolean Visible;
    float X;
    float Y;
    float W;
    float H;
    String T;
    
    Button(int _X, int _Y, int _W, int _H, String _T) {
        Selected = false;  
        Visible = false;
        X = _X;
        Y = _Y;
        W = _W;
        H = _H;
        T = _T;
    }
    
    void Display() {
        if (Visible) {
          fill(StandardButtonColor);
          rect(X, Y, W, H);
          fill(StandardTextColorButton);
          textAlign(CENTER, CENTER);
          textSize(StandardTextSize);
          text(T, X + W / 2, Y + H / 2);       
        }
    }
    
    void SetVisible(boolean B) {
        Visible = B;
    }
    
    boolean IsVisible() {
        return Visible;
    }
    
    boolean MouseCheck() {
        if (mouseX > X && mouseX < X + W && mouseY > Y && mouseY < Y + H) {
            return true;
        }
        return false;
    }  
};

class TextBox {
    boolean Password;
    boolean Selected;
    boolean Visible;
    float X;
    float Y;
    float W;
    float H;
    String T;
    
    TextBox(int _X, int _Y, int _W, int _H) {
        Password = false;
        Selected = false;
        Visible = false;
        X = _X;
        Y = _Y;
        W = _W;
        H = _H;
        T = "";
    }
    
    // TextBox con Testo a Pallini
    TextBox(int _X, int _Y, int _W, int _H, boolean _Password) {
        Password = _Password;
        Selected = false;
        Visible = false;
        X = _X;
        Y = _Y;
        W = _W;
        H = _H;
        T = "";
    }
    
    void Display() {
        if (Visible) {
            if (!Password) {
                fill(StandardTextBoxColor);
                rect(X, Y, W, H);
                fill(StandardTextColorTextBox);
                textAlign(CENTER, CENTER);
                textSize(StandardTextSize);
                text(T, X + W / 2, Y + H / 2);
            }
            else {
                fill(StandardTextBoxColor);
                rect(X, Y, W, H);
                fill(StandardTextColorTextBox);
                textAlign(CENTER, CENTER);
                textSize(StandardTextSize);
                String T0 = "";
                for (int I = 0; I < T.length(); I++) {
                    T0 += '*';
                }
                text(T0, X + W / 2, Y + H / 2);
            }
        }
    }
    
    void SetVisible(boolean B) {                      
        Visible = B;
    }
    
    boolean IsVisible() {
        return Visible;
    }
    
    void SetSelected(boolean B) {
        Selected = B;
    }
    
    boolean IsSelected() {
        return Selected;
    }
    
    boolean MouseCheck() {
        if (mouseX > X && mouseX < X + W && mouseY > Y && mouseY < Y + H) {
            return true;
        }
        return false;
    }
    
    void SetText(String _T) {
        T = _T;
    }
    
    String GetText() {
        return T;
    }
};
