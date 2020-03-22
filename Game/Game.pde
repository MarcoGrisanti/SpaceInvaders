import java.math.*;
import java.security.*;
import java.sql.*;
import java.util.*;

/* !!! */
RealGame GameToPlay;

int TestConnectionA = 0;
int TestConnectionB = 0;

static String GameName = "Space Invaders - Progetto di Marco Grisanti e Dario Tomasello";
static String GameVersion = "";

//Stringa IDUtente
String CurrentAccount = "";

static int Width = 800;
static int Height = 600;
final color BG = #B0BEC5;

boolean Connection;
String ConnectionYes = "Connesso al Server";
String ConnectionNo = "Connessione al Server Assente";
int ConnectionX = Width / 2;
int ConnectionY = Height - 30;

// Valori GUI Standard
static int StandardButtonWidth = 150;
static int StandardButtonHeight = 50;
static int StandardTextBoxWidth = 200;
static int StandardTextBoxHeight = 30;

// Button
ArrayList<Button> ButtonList;
Button Button_CreaAccount;
Button Button_UsaAccountEsistente;
Button Button_GiocaSenzaInternet;
Button Button_ConfermaCreazioneAccount;
Button Button_TornaAlMenuDaCreaAccount;
Button Button_Accesso;
Button Button_TornaAlMenuDaAccesso;
Button Button_Gioca;
Button Button_Classifiche;
Button Button_GestionAmici;
Button Button_TornaAlMenuDaAccessoEseguito;
Button Button_AggiungiAmico;
Button Button_RimuoviAmico;
Button Button_VediAmici;
Button Button_IndietroDaGestioneAmici;
Button Button_ClassificaGlobale;
Button Button_ClassificaContinentale;
Button Button_ClassificaNazionale;
Button Button_ClassificaRegionale;
Button Button_ClassificaProvinciale;
Button Button_ClassificaAmici;
Button Button_IndietroDaClassifiche;

// Proprieta Button
String Button_CreaAccountTesto = "Crea Account";
int Button_CreaAccountX =  Width / 2 - StandardButtonWidth / 2;
int Button_CreaAccountY =  Height / 2 - StandardButtonHeight / 2;
String Button_UsaAccountEsistenteTesto = "Usa Account Esistente";
int Button_UsaAccountEsistenteX =  Width / 2 - StandardButtonWidth / 2;
int Button_UsaAccountEsistenteY =  Height / 2 + StandardButtonHeight / 2 + 10;
String Button_GiocaSenzaInternetTesto = "Gioca Senza Internet";
int Button_GiocaSenzaInternetX = Width / 2 - StandardButtonWidth / 2;
int Button_GiocaSenzaInternetY = Height / 2 + StandardButtonHeight / 2 + StandardButtonHeight + 20;
String Button_ConfermaCreazioneAccountTesto = "Crea Account";
int Button_ConfermaCreazioneAccountX =  Width / 2 - StandardButtonWidth / 2;
int Button_ConfermaCreazioneAccountY =  Height - StandardButtonHeight * 3;
String Button_TornaAlMenuDaCreaAccountTesto = "Torna Al Menu";
int Button_TornaAlMenuDaCreaAccountX = Width / 2 - StandardButtonWidth / 2;
int Button_TornaAlMenuDaCreaAccountY = Height - StandardButtonHeight * 2 + 10;
String Button_AccessoTesto = "Accedi";
int Button_AccessoX = Width / 2 - StandardButtonWidth / 2;
int Button_AccessoY = Height - StandardButtonHeight * 3;
String Button_TornaAlMenuDaAccessoTesto = "Torna Al Menu";
int Button_TornaAlMenuDaAccessoX = Width / 2 - StandardButtonWidth / 2;
int Button_TornaAlMenuDaAccessoY = Height - StandardButtonHeight * 2 + 10;
String Button_GiocaTesto = "Gioca";
int Button_GiocaX = Width / 2 - StandardButtonWidth / 2;
int Button_GiocaY = Height - StandardButtonHeight * 5 - 30;
String Button_ClassificheTesto = "Classifiche";
int Button_ClassificheX = Width / 2 - StandardButtonWidth / 2;
int Button_ClassificheY = Height - StandardButtonHeight * 4 - 20;
String Button_GestionAmiciTesto = "Gestione Amici";
int Button_GestionAmiciX = Width / 2 - StandardButtonWidth / 2;
int Button_GestionAmiciY = Height - StandardButtonHeight * 3 - 10;
String Button_TornaAlMenuDaAccessoEseguitoTesto = "Torna Al Menu";
int Button_TornaAlMenuDaAccessoEseguitoX = Width / 2 - StandardButtonWidth / 2;
int Button_TornaAlMenuDaAccessoEseguitoY = Height - StandardButtonHeight * 2;
String Button_AggiungiAmicoTesto = "Aggiungi Amico";
int Button_AggiungiAmicoX = Width / 2 - StandardButtonWidth / 2;
int Button_AggiungiAmicoY = Height - StandardButtonHeight * 5 - 30;
String Button_RimuoviAmicoTesto = "Rimuovi Amico";
int Button_RimuoviAmicoX = Width / 2 - StandardButtonWidth / 2;
int Button_RimuoviAmicoY = Height - StandardButtonHeight * 4 - 20;
String Button_VediAmiciTesto = "Vedi Amici";
int Button_VediAmiciX = Width / 2 - StandardButtonWidth / 2;
int Button_VediAmiciY = Height - StandardButtonHeight * 3 - 10;
String Button_IndietroDaGestioneAmiciTesto = "Indietro";
int Button_IndietroDaGestioneAmiciX = Width / 2 - StandardButtonWidth / 2;
int Button_IndietroDaGestioneAmiciY = Height - StandardButtonHeight * 2;
String Button_ClassificaGlobaleTesto = "Classifica Globale";
int Button_ClassificaGlobaleX = Width / 2 - StandardButtonWidth / 2;
int Button_ClassificaGlobaleY = Height - StandardButtonHeight * 8 - 60;
String Button_ClassificaContinentaleTesto = "Classifica Continentale";
int Button_ClassificaContinentaleX = Width / 2 - StandardButtonWidth / 2;
int Button_ClassificaContinentaleY = Height - StandardButtonHeight * 7 - 50;
String Button_ClassificaNazionaleTesto = "Classifica Nazionale";
int Button_ClassificaNazionaleX = Width / 2 - StandardButtonWidth / 2;
int Button_ClassificaNazionaleY = Height - StandardButtonHeight * 6 - 40;
String Button_ClassificaRegionaleTesto = "Classifica Regionale";
int Button_ClassificaRegionaleX = Width / 2 - StandardButtonWidth / 2;
int Button_ClassificaRegionaleY = Height - StandardButtonHeight * 5 - 30;
String Button_ClassificaProvincialeTesto = "Classifica Provinciale";
int Button_ClassificaProvincialeX = Width / 2 - StandardButtonWidth / 2;
int Button_ClassificaProvincialeY = Height - StandardButtonHeight * 4 - 20;
String Button_ClassificaAmiciTesto = "Classifica Amici";
int Button_ClassificaAmiciX = Width / 2 - StandardButtonWidth / 2;
int Button_ClassificaAmiciY = Height - StandardButtonHeight * 3 - 10;
String Button_IndietroDaClassificheTesto = "Indietro";
int Button_IndietroDaClassificheX = Width / 2 - StandardButtonWidth / 2;
int Button_IndietroDaClassificheY = Height - StandardButtonHeight * 2;

// TextBox
ArrayList<TextBox> TextBoxList;
TextBox TextBox_Nome;
TextBox TextBox_Cognome;
TextBox TextBox_IDAccount;
TextBox TextBox_Email;
TextBox TextBox_Password;
TextBox TextBox_Provincia;
TextBox TextBox_IDAccountAccesso;
TextBox TextBox_PasswordAccesso;
TextBox TextBox_Amico;
TextBox TextBox_Classifiche;

// Proprieta TextBox
int TextBox_NomeX = Width - StandardTextBoxWidth - 10;
int TextBox_NomeY = 10 + (StandardTextBoxHeight * 1 + 10);
int TextBox_CognomeX = Width - StandardTextBoxWidth - 10;
int TextBox_CognomeY = 10 + (StandardTextBoxHeight * 2 + 20);
int TextBox_IDAccountX = Width - StandardTextBoxWidth - 10;
int TextBox_IDAccountY = 10 + (StandardTextBoxHeight * 3 + 30);
int TextBox_EmailX = Width - StandardTextBoxWidth - 10;
int TextBox_EmailY = 10 + (StandardTextBoxHeight * 4 + 40);
int TextBox_PasswordX = Width - StandardTextBoxWidth - 10;
int TextBox_PasswordY = 10 + (StandardTextBoxHeight * 5 + 50);
int TextBox_ProvinciaX = Width - StandardTextBoxWidth - 10;
int TextBox_ProvinciaY = 10 + (StandardTextBoxHeight * 6 + 60);
int TextBox_IDAccountAccessoX = Width - StandardTextBoxWidth - 10;
int TextBox_IDAccountAccessoY = 10 + (StandardTextBoxHeight * 3 + 30);
int TextBox_PasswordAccessoX = Width - StandardTextBoxWidth - 10;
int TextBox_PasswordAccessoY = 10 + (StandardTextBoxHeight * 4 + 40);
int TextBox_AmicoX = Width / 2 - StandardTextBoxWidth / 2;
int TextBox_AmicoY = Height - StandardButtonHeight * 6 - 40;
int TextBox_ClassificheX = Width / 2 - StandardTextBoxWidth / 2;
int TextBox_ClassificheY = Height - StandardButtonHeight * 9 - 70;

// Schermate
boolean SchermataMenu = true;
boolean SchermataCreaAccount = false;
boolean SchermataAccesso = false;
boolean SchermataAccessoEseguito = false;
boolean SchermataGioco = false;
boolean SchermataGestioneAmici = false;
boolean SchermataClassifiche = false;
boolean SchermataGioco0 = false; // Senza Internet

void settings() {
    size(Width, Height);
    noSmooth();
}

void setup() {
    // Inizializzazione Button
    ButtonList = new ArrayList<Button>();
    Button_CreaAccount = new Button(Button_CreaAccountX, Button_CreaAccountY, StandardButtonWidth, StandardButtonHeight, Button_CreaAccountTesto);
    Button_UsaAccountEsistente = new Button(Button_UsaAccountEsistenteX, Button_UsaAccountEsistenteY, StandardButtonWidth, StandardButtonHeight, Button_UsaAccountEsistenteTesto);
    Button_ConfermaCreazioneAccount = new Button(Button_ConfermaCreazioneAccountX, Button_ConfermaCreazioneAccountY, StandardButtonWidth, StandardButtonHeight, Button_ConfermaCreazioneAccountTesto);
    Button_TornaAlMenuDaCreaAccount = new Button(Button_TornaAlMenuDaCreaAccountX, Button_TornaAlMenuDaCreaAccountY, StandardButtonWidth, StandardButtonHeight, Button_TornaAlMenuDaCreaAccountTesto);
    Button_Accesso = new Button(Button_AccessoX, Button_AccessoY, StandardButtonWidth, StandardButtonHeight ,Button_AccessoTesto);
    Button_TornaAlMenuDaAccesso = new Button(Button_TornaAlMenuDaAccessoX, Button_TornaAlMenuDaAccessoY, StandardButtonWidth, StandardButtonHeight, Button_TornaAlMenuDaAccessoTesto);
    Button_Gioca = new Button(Button_GiocaX, Button_GiocaY, StandardButtonWidth, StandardButtonHeight, Button_GiocaTesto);
    Button_Classifiche = new Button(Button_ClassificheX, Button_ClassificheY, StandardButtonWidth, StandardButtonHeight, Button_ClassificheTesto);
    Button_GestionAmici = new Button(Button_GestionAmiciX, Button_GestionAmiciY, StandardButtonWidth, StandardButtonHeight, Button_GestionAmiciTesto);
    Button_TornaAlMenuDaAccessoEseguito = new Button(Button_TornaAlMenuDaAccessoEseguitoX, Button_TornaAlMenuDaAccessoEseguitoY, StandardButtonWidth, StandardButtonHeight, Button_TornaAlMenuDaAccessoEseguitoTesto);
    Button_AggiungiAmico = new Button(Button_AggiungiAmicoX, Button_AggiungiAmicoY, StandardButtonWidth, StandardButtonHeight, Button_AggiungiAmicoTesto);
    Button_RimuoviAmico = new Button(Button_RimuoviAmicoX, Button_RimuoviAmicoY, StandardButtonWidth, StandardButtonHeight, Button_RimuoviAmicoTesto);
    Button_IndietroDaGestioneAmici = new Button(Button_IndietroDaGestioneAmiciX, Button_IndietroDaGestioneAmiciY, StandardButtonWidth, StandardButtonHeight, Button_IndietroDaGestioneAmiciTesto);
    Button_VediAmici = new Button(Button_VediAmiciX, Button_VediAmiciY, StandardButtonWidth, StandardButtonHeight, Button_VediAmiciTesto);
    Button_ClassificaGlobale = new Button(Button_ClassificaGlobaleX, Button_ClassificaGlobaleY, StandardButtonWidth, StandardButtonHeight, Button_ClassificaGlobaleTesto);
    Button_ClassificaContinentale = new Button(Button_ClassificaContinentaleX, Button_ClassificaContinentaleY, StandardButtonWidth, StandardButtonHeight, Button_ClassificaContinentaleTesto);
    Button_ClassificaNazionale = new Button(Button_ClassificaNazionaleX, Button_ClassificaNazionaleY, StandardButtonWidth, StandardButtonHeight, Button_ClassificaNazionaleTesto);
    Button_ClassificaRegionale = new Button(Button_ClassificaRegionaleX, Button_ClassificaRegionaleY, StandardButtonWidth, StandardButtonHeight, Button_ClassificaRegionaleTesto);
    Button_ClassificaProvinciale = new Button(Button_ClassificaProvincialeX, Button_ClassificaProvincialeY, StandardButtonWidth, StandardButtonHeight, Button_ClassificaProvincialeTesto);
    Button_ClassificaAmici = new Button(Button_ClassificaAmiciX, Button_ClassificaAmiciY, StandardButtonWidth, StandardButtonHeight, Button_ClassificaAmiciTesto);
    Button_IndietroDaClassifiche = new Button(Button_IndietroDaClassificheX, Button_IndietroDaClassificheY, StandardButtonWidth, StandardButtonHeight, Button_IndietroDaClassificheTesto);
    Button_GiocaSenzaInternet = new Button(Button_GiocaSenzaInternetX, Button_GiocaSenzaInternetY, StandardButtonWidth, StandardButtonHeight, Button_GiocaSenzaInternetTesto);
    ButtonList.add(Button_CreaAccount);
    ButtonList.add(Button_UsaAccountEsistente);
    ButtonList.add(Button_ConfermaCreazioneAccount);
    ButtonList.add(Button_TornaAlMenuDaCreaAccount);
    ButtonList.add(Button_Accesso);
    ButtonList.add(Button_TornaAlMenuDaAccesso);
    ButtonList.add(Button_Gioca);
    ButtonList.add(Button_Classifiche);
    ButtonList.add(Button_GestionAmici);
    ButtonList.add(Button_TornaAlMenuDaAccessoEseguito);
    ButtonList.add(Button_AggiungiAmico);
    ButtonList.add(Button_RimuoviAmico);
    ButtonList.add(Button_VediAmici);
    ButtonList.add(Button_IndietroDaGestioneAmici);
    ButtonList.add(Button_ClassificaGlobale);
    ButtonList.add(Button_ClassificaContinentale);
    ButtonList.add(Button_ClassificaNazionale);
    ButtonList.add(Button_ClassificaRegionale);
    ButtonList.add(Button_ClassificaProvinciale);
    ButtonList.add(Button_ClassificaAmici);
    ButtonList.add(Button_IndietroDaClassifiche);
    ButtonList.add(Button_GiocaSenzaInternet);
    // Inizializzazione TextBox
    TextBoxList = new ArrayList<TextBox>();
    TextBox_Nome = new TextBox(TextBox_NomeX, TextBox_NomeY, StandardTextBoxWidth, StandardTextBoxHeight);
    TextBox_Cognome = new TextBox(TextBox_CognomeX, TextBox_CognomeY, StandardTextBoxWidth, StandardTextBoxHeight);
    TextBox_IDAccount = new TextBox(TextBox_IDAccountX, TextBox_IDAccountY, StandardTextBoxWidth, StandardTextBoxHeight);
    TextBox_Email = new TextBox(TextBox_EmailX, TextBox_EmailY, StandardTextBoxWidth, StandardTextBoxHeight);
    TextBox_Password = new TextBox(TextBox_PasswordX, TextBox_PasswordY, StandardTextBoxWidth, StandardTextBoxHeight, true);
    TextBox_Provincia = new TextBox(TextBox_ProvinciaX, TextBox_ProvinciaY, StandardTextBoxWidth, StandardTextBoxHeight);
    TextBox_IDAccountAccesso = new TextBox(TextBox_IDAccountAccessoX, TextBox_IDAccountAccessoY, StandardTextBoxWidth, StandardTextBoxHeight);
    TextBox_PasswordAccesso = new TextBox(TextBox_PasswordAccessoX, TextBox_PasswordAccessoY, StandardTextBoxWidth, StandardTextBoxHeight, true);
    TextBox_Amico = new TextBox(TextBox_AmicoX, TextBox_AmicoY, StandardTextBoxWidth, StandardTextBoxHeight);
    TextBox_Classifiche = new TextBox(TextBox_ClassificheX, TextBox_ClassificheY, StandardTextBoxWidth, StandardTextBoxHeight);
    TextBoxList.add(TextBox_Nome);
    TextBoxList.add(TextBox_Cognome);
    TextBoxList.add(TextBox_IDAccount);
    TextBoxList.add(TextBox_Email);
    TextBoxList.add(TextBox_Password);
    TextBoxList.add(TextBox_Provincia);
    TextBoxList.add(TextBox_IDAccountAccesso);
    TextBoxList.add(TextBox_PasswordAccesso);
    TextBoxList.add(TextBox_Amico);
    TextBoxList.add(TextBox_Classifiche);
    frameRate(60);
    Menu();
}

void draw() {
    background(BG);
    rectMode(CORNER);
    fill(0, 0, 0);
    textAlign(LEFT);
    textSize(10);
    text(GameName + " " + GameVersion, 0, 10);
    // Visualizzazione Button
    for (int I = 0; I < ButtonList.size(); I++) {
        ButtonList.get(I).Display();
    }
    // Visualizzazione TextBox
    for (int I = 0; I < TextBoxList.size(); I++) {
        TextBoxList.get(I).Display();
    }
    // Gestione Testi && Altro
    if (SchermataMenu) {
        textSize(20);
        if (Connection) {
            fill(#388E3C);
            text(ConnectionYes, ConnectionX, ConnectionY);
        }
        else {
            fill(#E53935);
            text(ConnectionNo, ConnectionX, ConnectionY);
        }   
        // Test Periodico Connection
        TestConnectionA = millis() - TestConnectionB;
        if (TestConnectionA > 5000){
            TestConnectionB = millis();
            Connection = TestConnection();
        }
    }
    else if (SchermataCreaAccount) {
        fill(0);
        textSize(20);
        text("Nome: ", 100, TextBox_NomeY + StandardTextBoxHeight / 2);
        text("Cognome: ", 100, TextBox_CognomeY + StandardTextBoxHeight / 2);
        text("Nome Account: ", 100, TextBox_IDAccountY + StandardTextBoxHeight / 2);
        text("Email: ", 100, TextBox_EmailY + StandardTextBoxHeight / 2);
        text("Password: ", 100, TextBox_PasswordY + StandardTextBoxHeight / 2);
        text("Provincia: ", 100, TextBox_ProvinciaY + StandardTextBoxHeight / 2);
    }
    else if (SchermataAccesso) {
        fill(0);
        textSize(20);
        text("Nome Account: ", 100, TextBox_IDAccountAccessoY + StandardTextBoxHeight / 2);
        text("Password: ", 100, TextBox_PasswordAccessoY + StandardTextBoxHeight / 2);
    }
    else if (SchermataAccessoEseguito) {
        fill(0);
        textSize(20);
        text(CurrentAccount, Width - 100, 25);
    }
    else if (SchermataGioco) {
        GameToPlay.Run();
        if (GameToPlay.IsEnd()) {
            AggiungiPunteggio(GameToPlay.GetScore());
            AccessoEseguito();
        }
    }
    else if (SchermataGestioneAmici) {
        fill(0);
        textSize(20);
        text(CurrentAccount, Width - 100, 25);
        textSize(12);
        text("ID Amico da Aggiungere/Rimuovere:", Width / 2, TextBox_AmicoY - 30);
    }
    else if (SchermataClassifiche) {
        fill(0);
        textSize(12);
        text("Nome Continete/Nazione/Regione/Provincia da Filtrare", Width / 2, TextBox_ClassificheY - 30);
    }
    else if (SchermataGioco0) {
        GameToPlay.Run();
        if (GameToPlay.IsEnd()) {
            Menu();
        }
    }
}

void Menu() {
    background(BG);
    Button_CreaAccount.SetVisible(true);
    Button_UsaAccountEsistente.SetVisible(true);
    Button_GiocaSenzaInternet.SetVisible(true);
    Button_ConfermaCreazioneAccount.SetVisible(false);
    Button_TornaAlMenuDaCreaAccount.SetVisible(false);
    Button_Accesso.SetVisible(false);
    Button_TornaAlMenuDaAccesso.SetVisible(false);
    Button_Gioca.SetVisible(false);
    Button_Classifiche.SetVisible(false);
    Button_GestionAmici.SetVisible(false);
    Button_TornaAlMenuDaAccessoEseguito.SetVisible(false);
    Button_AggiungiAmico.SetVisible(false);
    Button_RimuoviAmico.SetVisible(false);
    Button_VediAmici.SetVisible(false);
    Button_IndietroDaGestioneAmici.SetVisible(false);
    Button_ClassificaGlobale.SetVisible(false);
    Button_ClassificaContinentale.SetVisible(false);
    Button_ClassificaNazionale.SetVisible(false);
    Button_ClassificaRegionale.SetVisible(false);
    Button_ClassificaProvinciale.SetVisible(false);
    Button_ClassificaAmici.SetVisible(false);
    Button_IndietroDaClassifiche.SetVisible(false);
    TextBox_Nome.SetVisible(false);
    TextBox_Cognome.SetVisible(false);
    TextBox_IDAccount.SetVisible(false);
    TextBox_Email.SetVisible(false);
    TextBox_Password.SetVisible(false);
    TextBox_Provincia.SetVisible(false);
    TextBox_IDAccountAccesso.SetVisible(false);
    TextBox_PasswordAccesso.SetVisible(false);
    TextBox_Amico.SetVisible(false);
    TextBox_Classifiche.SetVisible(false);
    SchermataMenu = true;
    SchermataCreaAccount = false;
    SchermataAccesso = false;
    SchermataAccessoEseguito = false;
    SchermataGioco = false;
    SchermataGestioneAmici = false;
    SchermataClassifiche = false;
    SchermataGioco0 = false;
    Connection = TestConnection();
}

void CreaAccount() {
    background(BG);
    Button_CreaAccount.SetVisible(false);
    Button_UsaAccountEsistente.SetVisible(false);
    Button_GiocaSenzaInternet.SetVisible(false);
    Button_TornaAlMenuDaCreaAccount.SetVisible(true);
    Button_ConfermaCreazioneAccount.SetVisible(true);
    Button_Accesso.SetVisible(false);
    Button_TornaAlMenuDaAccesso.SetVisible(false);
    Button_Gioca.SetVisible(false);
    Button_Classifiche.SetVisible(false);
    Button_GestionAmici.SetVisible(false);
    Button_TornaAlMenuDaAccessoEseguito.SetVisible(false);
    Button_AggiungiAmico.SetVisible(false);
    Button_RimuoviAmico.SetVisible(false);
    Button_VediAmici.SetVisible(false);
    Button_IndietroDaGestioneAmici.SetVisible(false);
    Button_ClassificaGlobale.SetVisible(false);
    Button_ClassificaContinentale.SetVisible(false);
    Button_ClassificaNazionale.SetVisible(false);
    Button_ClassificaRegionale.SetVisible(false);
    Button_ClassificaProvinciale.SetVisible(false);
    Button_ClassificaAmici.SetVisible(false);
    Button_IndietroDaClassifiche.SetVisible(false);
    TextBox_Nome.SetVisible(true);
    TextBox_Cognome.SetVisible(true);
    TextBox_IDAccount.SetVisible(true);
    TextBox_Email.SetVisible(true);
    TextBox_Password.SetVisible(true);
    TextBox_Provincia.SetVisible(true);
    TextBox_IDAccountAccesso.SetVisible(false);
    TextBox_PasswordAccesso.SetVisible(false);
    TextBox_Amico.SetVisible(false);
    TextBox_Classifiche.SetVisible(false);
    SchermataMenu = false;
    SchermataCreaAccount = true;
    SchermataAccesso = false;
    SchermataAccessoEseguito = false;
    SchermataGioco = false;
    SchermataGestioneAmici = false;
    SchermataClassifiche = false;
    SchermataGioco0 = false;
}

void Accesso() {
    background(BG);
    Button_CreaAccount.SetVisible(false);
    Button_UsaAccountEsistente.SetVisible(false);
    Button_GiocaSenzaInternet.SetVisible(false);
    Button_TornaAlMenuDaCreaAccount.SetVisible(false);
    Button_ConfermaCreazioneAccount.SetVisible(false);
    Button_Accesso.SetVisible(true);
    Button_TornaAlMenuDaAccesso.SetVisible(true);
    Button_Gioca.SetVisible(false);
    Button_Classifiche.SetVisible(false);
    Button_GestionAmici.SetVisible(false);
    Button_TornaAlMenuDaAccessoEseguito.SetVisible(false);
    Button_AggiungiAmico.SetVisible(false);
    Button_RimuoviAmico.SetVisible(false);
    Button_VediAmici.SetVisible(false);
    Button_IndietroDaGestioneAmici.SetVisible(false);
    Button_ClassificaGlobale.SetVisible(false);
    Button_ClassificaContinentale.SetVisible(false);
    Button_ClassificaNazionale.SetVisible(false);
    Button_ClassificaRegionale.SetVisible(false);
    Button_ClassificaProvinciale.SetVisible(false);
    Button_ClassificaAmici.SetVisible(false);
    Button_IndietroDaClassifiche.SetVisible(false);
    TextBox_Nome.SetVisible(false);
    TextBox_Cognome.SetVisible(false);
    TextBox_IDAccount.SetVisible(false);
    TextBox_Email.SetVisible(false);
    TextBox_Password.SetVisible(false);
    TextBox_Provincia.SetVisible(false);
    TextBox_IDAccountAccesso.SetVisible(true);
    TextBox_PasswordAccesso.SetVisible(true);
    TextBox_Amico.SetVisible(false);
    TextBox_Classifiche.SetVisible(false);
    SchermataMenu = false;
    SchermataCreaAccount = false;
    SchermataAccesso = true;
    SchermataAccessoEseguito = false;
    SchermataGioco = false;
    SchermataGestioneAmici = false;
    SchermataClassifiche = false;
    SchermataGioco0 = false;
}

void AccessoEseguito() {
    background(BG);
    Button_CreaAccount.SetVisible(false);
    Button_UsaAccountEsistente.SetVisible(false);
    Button_GiocaSenzaInternet.SetVisible(false);
    Button_TornaAlMenuDaCreaAccount.SetVisible(false);
    Button_ConfermaCreazioneAccount.SetVisible(false);
    Button_Accesso.SetVisible(false);
    Button_TornaAlMenuDaAccesso.SetVisible(false);
    Button_Gioca.SetVisible(true);
    Button_Classifiche.SetVisible(true);
    Button_GestionAmici.SetVisible(true);
    Button_TornaAlMenuDaAccessoEseguito.SetVisible(true);
    Button_AggiungiAmico.SetVisible(false);
    Button_RimuoviAmico.SetVisible(false);
    Button_VediAmici.SetVisible(false);
    Button_IndietroDaGestioneAmici.SetVisible(false);
    Button_ClassificaGlobale.SetVisible(false);
    Button_ClassificaContinentale.SetVisible(false);
    Button_ClassificaNazionale.SetVisible(false);
    Button_ClassificaRegionale.SetVisible(false);
    Button_ClassificaProvinciale.SetVisible(false);
    Button_ClassificaAmici.SetVisible(false);
    Button_IndietroDaClassifiche.SetVisible(false);
    TextBox_Nome.SetVisible(false);
    TextBox_Cognome.SetVisible(false);
    TextBox_IDAccount.SetVisible(false);
    TextBox_Email.SetVisible(false);
    TextBox_Password.SetVisible(false);
    TextBox_Provincia.SetVisible(false);
    TextBox_IDAccountAccesso.SetVisible(false);
    TextBox_PasswordAccesso.SetVisible(false);
    TextBox_Amico.SetVisible(false);
    TextBox_Classifiche.SetVisible(false);
    SchermataMenu = false;
    SchermataCreaAccount = false;
    SchermataAccesso = false;
    SchermataAccessoEseguito = true;
    SchermataGioco = false;
    SchermataGestioneAmici = false;
    SchermataClassifiche = false;
    SchermataGioco0 = false;
}

void Gioco() {
    background(BG);
    Button_CreaAccount.SetVisible(false);
    Button_UsaAccountEsistente.SetVisible(false);
    Button_GiocaSenzaInternet.SetVisible(false);
    Button_TornaAlMenuDaCreaAccount.SetVisible(false);
    Button_ConfermaCreazioneAccount.SetVisible(false);
    Button_Accesso.SetVisible(false);
    Button_TornaAlMenuDaAccesso.SetVisible(false);
    Button_Gioca.SetVisible(false);
    Button_Classifiche.SetVisible(false);
    Button_GestionAmici.SetVisible(false);
    Button_TornaAlMenuDaAccessoEseguito.SetVisible(false);
    Button_AggiungiAmico.SetVisible(false);
    Button_RimuoviAmico.SetVisible(false);
    Button_VediAmici.SetVisible(false);
    Button_IndietroDaGestioneAmici.SetVisible(false);
    Button_ClassificaGlobale.SetVisible(false);
    Button_ClassificaContinentale.SetVisible(false);
    Button_ClassificaNazionale.SetVisible(false);
    Button_ClassificaRegionale.SetVisible(false);
    Button_ClassificaProvinciale.SetVisible(false);
    Button_ClassificaAmici.SetVisible(false);
    Button_IndietroDaClassifiche.SetVisible(false);
    TextBox_Nome.SetVisible(false);
    TextBox_Cognome.SetVisible(false);
    TextBox_IDAccount.SetVisible(false);
    TextBox_Email.SetVisible(false);
    TextBox_Password.SetVisible(false);
    TextBox_Provincia.SetVisible(false);
    TextBox_IDAccountAccesso.SetVisible(false);
    TextBox_PasswordAccesso.SetVisible(false);
    TextBox_Amico.SetVisible(false);
    TextBox_Classifiche.SetVisible(false);
    SchermataMenu = false;
    SchermataCreaAccount = false;
    SchermataAccesso = false;
    SchermataAccessoEseguito = false;
    SchermataGioco = true;
    SchermataGestioneAmici = false;
    SchermataClassifiche = false;
    SchermataGioco0 = false;
    GameToPlay = new RealGame();
}

void GestioneAmici() {
    background(BG);
    Button_CreaAccount.SetVisible(false);
    Button_UsaAccountEsistente.SetVisible(false);
    Button_GiocaSenzaInternet.SetVisible(false);
    Button_TornaAlMenuDaCreaAccount.SetVisible(false);
    Button_ConfermaCreazioneAccount.SetVisible(false);
    Button_Accesso.SetVisible(false);
    Button_TornaAlMenuDaAccesso.SetVisible(false);
    Button_Gioca.SetVisible(false);
    Button_Classifiche.SetVisible(false);
    Button_GestionAmici.SetVisible(false);
    Button_TornaAlMenuDaAccessoEseguito.SetVisible(false);
    Button_AggiungiAmico.SetVisible(true);
    Button_RimuoviAmico.SetVisible(true);
    Button_VediAmici.SetVisible(true);
    Button_IndietroDaGestioneAmici.SetVisible(true);
    Button_ClassificaGlobale.SetVisible(false);
    Button_ClassificaContinentale.SetVisible(false);
    Button_ClassificaNazionale.SetVisible(false);
    Button_ClassificaRegionale.SetVisible(false);
    Button_ClassificaProvinciale.SetVisible(false);
    Button_ClassificaAmici.SetVisible(false);
    Button_IndietroDaClassifiche.SetVisible(false);
    TextBox_Nome.SetVisible(false);
    TextBox_Cognome.SetVisible(false);
    TextBox_IDAccount.SetVisible(false);
    TextBox_Email.SetVisible(false);
    TextBox_Password.SetVisible(false);
    TextBox_Provincia.SetVisible(false);
    TextBox_IDAccountAccesso.SetVisible(false);
    TextBox_PasswordAccesso.SetVisible(false);
    TextBox_Amico.SetVisible(true);
    TextBox_Classifiche.SetVisible(false);
    SchermataMenu = false;
    SchermataCreaAccount = false;
    SchermataAccesso = false;
    SchermataAccessoEseguito = false;
    SchermataGioco = false;
    SchermataGestioneAmici = true;
    SchermataClassifiche = false;
    SchermataGioco0 = false;
}

void Classifiche() {
    background(BG);
    Button_CreaAccount.SetVisible(false);
    Button_UsaAccountEsistente.SetVisible(false);
    Button_GiocaSenzaInternet.SetVisible(false);
    Button_TornaAlMenuDaCreaAccount.SetVisible(false);
    Button_ConfermaCreazioneAccount.SetVisible(false);
    Button_Accesso.SetVisible(false);
    Button_TornaAlMenuDaAccesso.SetVisible(false);
    Button_Gioca.SetVisible(false);
    Button_Classifiche.SetVisible(false);
    Button_GestionAmici.SetVisible(false);
    Button_TornaAlMenuDaAccessoEseguito.SetVisible(false);
    Button_AggiungiAmico.SetVisible(false);
    Button_RimuoviAmico.SetVisible(false);
    Button_VediAmici.SetVisible(false);
    Button_IndietroDaGestioneAmici.SetVisible(false);
    Button_ClassificaGlobale.SetVisible(true);
    Button_ClassificaContinentale.SetVisible(true);
    Button_ClassificaNazionale.SetVisible(true);
    Button_ClassificaRegionale.SetVisible(true);
    Button_ClassificaProvinciale.SetVisible(true);
    Button_ClassificaAmici.SetVisible(true);
    Button_IndietroDaClassifiche.SetVisible(true);
    TextBox_Nome.SetVisible(false);
    TextBox_Cognome.SetVisible(false);
    TextBox_IDAccount.SetVisible(false);
    TextBox_Email.SetVisible(false);
    TextBox_Password.SetVisible(false);
    TextBox_Provincia.SetVisible(false);
    TextBox_IDAccountAccesso.SetVisible(false);
    TextBox_PasswordAccesso.SetVisible(false);
    TextBox_Amico.SetVisible(false);
    TextBox_Classifiche.SetVisible(true);
    SchermataMenu = false;
    SchermataCreaAccount = false;
    SchermataAccesso = false;
    SchermataAccessoEseguito = false;
    SchermataGioco = false;
    SchermataGestioneAmici = false;
    SchermataClassifiche = true;
    SchermataGioco0 = false;
}

void Gioco0 () {
    background(BG);
    Button_CreaAccount.SetVisible(false);
    Button_UsaAccountEsistente.SetVisible(false);
    Button_GiocaSenzaInternet.SetVisible(false);
    Button_TornaAlMenuDaCreaAccount.SetVisible(false);
    Button_ConfermaCreazioneAccount.SetVisible(false);
    Button_Accesso.SetVisible(false);
    Button_TornaAlMenuDaAccesso.SetVisible(false);
    Button_Gioca.SetVisible(false);
    Button_Classifiche.SetVisible(false);
    Button_GestionAmici.SetVisible(false);
    Button_TornaAlMenuDaAccessoEseguito.SetVisible(false);
    Button_AggiungiAmico.SetVisible(false);
    Button_RimuoviAmico.SetVisible(false);
    Button_VediAmici.SetVisible(false);
    Button_IndietroDaGestioneAmici.SetVisible(false);
    Button_ClassificaGlobale.SetVisible(false);
    Button_ClassificaContinentale.SetVisible(false);
    Button_ClassificaNazionale.SetVisible(false);
    Button_ClassificaRegionale.SetVisible(false);
    Button_ClassificaProvinciale.SetVisible(false);
    Button_ClassificaAmici.SetVisible(false);
    Button_IndietroDaClassifiche.SetVisible(false);
    TextBox_Nome.SetVisible(false);
    TextBox_Cognome.SetVisible(false);
    TextBox_IDAccount.SetVisible(false);
    TextBox_Email.SetVisible(false);
    TextBox_Password.SetVisible(false);
    TextBox_Provincia.SetVisible(false);
    TextBox_IDAccountAccesso.SetVisible(false);
    TextBox_PasswordAccesso.SetVisible(false);
    TextBox_Amico.SetVisible(false);
    TextBox_Classifiche.SetVisible(false);
    SchermataMenu = false;
    SchermataCreaAccount = false;
    SchermataAccesso = false;
    SchermataAccessoEseguito = false;
    SchermataGioco = false;
    SchermataGestioneAmici = false;
    SchermataClassifiche = false;
    SchermataGioco0 = true;
    GameToPlay = new RealGame();
}

void mouseReleased() {
    // Click Button
    for (int I = 0; I < ButtonList.size(); I++) {
        if (ButtonList.get(I).IsVisible() && ButtonList.get(I).MouseCheck()) {
            if (ButtonList.get(I) == Button_CreaAccount) {
                if (Connection) {
                    CreaAccount();
                }
                break;
            }
            else if (ButtonList.get(I) == Button_UsaAccountEsistente) {
                if (Connection) {
                    Accesso();
                }
                break;
            }
            else if (ButtonList.get(I) == Button_GiocaSenzaInternet) {
                Gioco0();
                break;
            }
            else if (ButtonList.get(I) == Button_ConfermaCreazioneAccount) {
                if (TextBox_IDAccount.GetText() != "" && TextBox_Email.GetText() != "" && TextBox_Password.GetText() != "" && TextBox_Provincia.GetText() != "") { // Valori Non NULL
                    boolean UniqueAccountID;
                    boolean UniqueEmail;
                    boolean ExistingProvince;
                    try {
                        java.sql.Connection MyConnection = DriverManager.getConnection("jdbc:mysql://localhost:3306/Progetto", "root", "");
                        java.sql.Statement MyStatement = MyConnection.createStatement();  
                        String Temp;
                        // Verica IDUtente Univoco
                        Temp = "Select IDUtente From Utente Where IDUtente = \"" + TextBox_IDAccount.GetText() + "\"";
                        java.sql.ResultSet MyResult = MyStatement.executeQuery(Temp);
                        if (MyResult.next()) { //<>//
                            UniqueAccountID = false;                          
                        }
                        else {
                            UniqueAccountID = true;
                        }
                        // Nome Account non Univoco
                        if (!UniqueAccountID) {
                            javax.swing.JOptionPane.showMessageDialog(null, "Nome Account già Esistente");
                        }
                        // Verifica Email Univoca
                        Temp = "Select Email From Utente Where Email = \"" + TextBox_Email.GetText() + "\"";
                        MyResult = MyStatement.executeQuery(Temp);
                        if (MyResult.next()) {
                            UniqueEmail = false;
                        }
                        else {
                            UniqueEmail = true;
                        }
                        // Email non Univica
                        if (!UniqueEmail) {
                            javax.swing.JOptionPane.showMessageDialog(null, "Email già Esistente");
                        }
                        // Verifica Esistenza Provincia
                        Temp = "Select Nome From Provincia Where Nome = \"" + TextBox_Provincia.GetText() + "\"";
                        MyResult = MyStatement.executeQuery(Temp);
                        if (MyResult.next()) {
                            ExistingProvince = true;
                        }
                        else {
                            ExistingProvince = false;
                        }
                        // Provincia Inesistente
                        if (!ExistingProvince) {
                            javax.swing.JOptionPane.showMessageDialog(null, "Provincia non Esistente");
                        }
                        // Inserimento Permesso
                        if (UniqueAccountID && UniqueEmail && ExistingProvince) {   
                            // Calcolo ID Provincia
                            MyResult = MyStatement.executeQuery("Select IDProvincia From Provincia Where Nome = \"" + TextBox_Provincia.GetText() + "\"");
                            int TempIDProvincia = 0;
                            while (MyResult.next()) {
                                TempIDProvincia = MyResult.getInt("IDProvincia");
                            }
                            // Cifratura Password MD5
                            String Password = TextBox_Password.GetText();
                            MessageDigest M = MessageDigest.getInstance("MD5");
                            M.update(Password.getBytes(), 0, Password.length());
                            String PasswordCifrata = new BigInteger(1, M.digest()).toString(16);
                            // Inserimento
                            MyStatement.executeUpdate("Insert Into Utente Values (\"" + TextBox_IDAccount.GetText() + "\", \"" + TextBox_Nome.GetText() + "\", \"" + TextBox_Cognome.GetText() + "\", \"" + TextBox_Email.GetText() + "\", \"" + PasswordCifrata + "\", " + TempIDProvincia + ")");
                            javax.swing.JOptionPane.showMessageDialog(null, "Account Creato");
                            Menu();
                        }
                        MyResult.close();
                        MyStatement.close();
                        MyConnection.close();
                    }
                    catch (Exception MyException){
                        MyException.printStackTrace();
                    }                  
                }
                else {
                    javax.swing.JOptionPane.showMessageDialog(null, "Nome Account, Email, Password & Provincia sono obbligatori...");
                }
                break; 
            }
            else if (ButtonList.get(I) == Button_TornaAlMenuDaCreaAccount) {
                Menu();
                break;
            }
            else if (ButtonList.get(I) == Button_Accesso) {
                if (TextBox_IDAccountAccesso.GetText() != "" && TextBox_PasswordAccesso.GetText() != "") {
                    try {
                        java.sql.Connection MyConnection = DriverManager.getConnection("jdbc:mysql://localhost:3306/Progetto", "root", "");
                        java.sql.Statement MyStatement = MyConnection.createStatement();
                        // Verifica Esistenza Nome Account
                        java.sql.ResultSet MyResult = MyStatement.executeQuery("Select IDUtente From Utente Where IDUtente = \"" + TextBox_IDAccountAccesso.GetText() + "\"");
                        if (MyResult.next()) {
                            // Cifratura Password MD5
                            String Password = TextBox_PasswordAccesso.GetText();
                            MessageDigest M = MessageDigest.getInstance("MD5");
                            M.update(Password.getBytes(), 0, Password.length());
                            String PasswordCifrata = new BigInteger(1, M.digest()).toString(16);
                            MyResult = MyStatement.executeQuery("Select IDUtente From Utente Where Password = \"" + PasswordCifrata + "\"");
                            if (MyResult.next()) {
                                javax.swing.JOptionPane.showMessageDialog(null, "Accesso Eseguito");
                                CurrentAccount = TextBox_IDAccountAccesso.GetText();
                                AccessoEseguito();
                            }
                            else {
                                javax.swing.JOptionPane.showMessageDialog(null, "Password Errata!");
                            }
                        }
                        else {
                            javax.swing.JOptionPane.showMessageDialog(null, "Nome Account non Esistente!");
                        }
                        MyResult.close();
                        MyStatement.close();
                        MyConnection.close();
                    }
                    catch (Exception MyException) {
                        MyException.printStackTrace();
                    }
                }
                else {
                    javax.swing.JOptionPane.showMessageDialog(null, "Non è possibile lasciare vuoti i campi Nome Account e/o Password!");
                }
                break;
            }
            else if (ButtonList.get(I) == Button_TornaAlMenuDaAccesso) {
                Menu();
                break;
            }
            else if (ButtonList.get(I) == Button_Gioca) {
                Gioco();
                break;
            }
            else if (ButtonList.get(I) == Button_Classifiche) {
                Classifiche();
                break;
            }
            else if (ButtonList.get(I) == Button_GestionAmici) {
                GestioneAmici();
                break;
            }
            else if (ButtonList.get(I) == Button_TornaAlMenuDaAccessoEseguito) {
                Menu();
                break;
            }
            else if (ButtonList.get(I) == Button_AggiungiAmico) {
                if (!TextBox_Amico.GetText().equals("")) {
                    if (!TextBox_Amico.GetText().equals(CurrentAccount)) {
                        try {
                            java.sql.Connection MyConnection = DriverManager.getConnection("jdbc:mysql://localhost:3306/Progetto", "root", "");
                            java.sql.Statement MyStatement = MyConnection.createStatement();
                            // Verifica Esistenza Utente
                            java.sql.ResultSet MyResult = MyStatement.executeQuery("Select IDUtente From Utente Where IDUtente = \"" + TextBox_Amico.GetText() + "\"");
                            if (MyResult.next()) {
                                // Verifica Amicizia Esistente
                                MyResult = MyStatement.executeQuery("Select IDAmicizia From UtentiAmici Where KSUtente1 = \"" + CurrentAccount + "\" And KSUtente2 = \"" + TextBox_Amico.GetText() + "\"");
                                if (MyResult.next()) {
                                    javax.swing.JOptionPane.showMessageDialog(null, "Tu e " + TextBox_Amico.GetText() + " siete già amici....");
                                }
                                else {
                                    // Verifica Contatore IDAmicizia
                                    MyResult = MyStatement.executeQuery("Select Max(IDAmicizia) From UtentiAmici");
                                    int C = 1;
                                    if (MyResult.next()) {
                                        C = MyResult.getInt("Max(IDAmicizia)");
                                        C++;
                                    }
                                    MyStatement.executeUpdate("Insert Into UtentiAmici Values ( " + C + ", \"" + CurrentAccount + "\", \"" + TextBox_Amico.GetText() + "\")");
                                    javax.swing.JOptionPane.showMessageDialog(null, "Amico Aggiunto!");
                                }
                            }
                            else {
                                javax.swing.JOptionPane.showMessageDialog(null, "Utente non Esistente!");
                            }
                            MyResult.close();
                            MyStatement.close();
                            MyConnection.close();
                        }
                        catch(Exception MyException) {
                            MyException.printStackTrace();
                        }
                    }
                    else {
                        javax.swing.JOptionPane.showMessageDialog(null, "Non è necessario diventare amici di se stessi...");
                    }
                }
                else {
                    javax.swing.JOptionPane.showMessageDialog(null, "Devi inserire un ID di un Utente!");
                }
                break;
            }
            else if (ButtonList.get(I) == Button_RimuoviAmico) {
                if (!TextBox_Amico.GetText().equals("")) {
                    if (!TextBox_Amico.GetText().equals(CurrentAccount)) {
                        try {
                            java.sql.Connection MyConnection = DriverManager.getConnection("jdbc:mysql://localhost:3306/Progetto", "root", "");
                            java.sql.Statement MyStatement = MyConnection.createStatement();
                            // Verifica Esistenza Utente
                            java.sql.ResultSet MyResult = MyStatement.executeQuery("Select IDUtente From Utente Where IDUtente = \"" + TextBox_Amico.GetText() + "\"");
                            if (MyResult.next()) {
                                // Verifica Amicizia Esistente
                                MyResult = MyStatement.executeQuery("Select IDAmicizia From UtentiAmici Where KSUtente1 = \"" + CurrentAccount + "\" And KSUtente2 = \"" + TextBox_Amico.GetText() + "\"");
                                if (MyResult.next()) {
                                    MyStatement.executeUpdate("Delete From UtentiAmici Where KSUtente1 = \"" + CurrentAccount + "\" And KSUtente2 = \"" + TextBox_Amico.GetText() + "\"");
                                    javax.swing.JOptionPane.showMessageDialog(null, "Amico Rimosso");
                                }
                                else {
                                    javax.swing.JOptionPane.showMessageDialog(null, "Tu e " + TextBox_Amico.GetText() + " non siete amici....");
                                }
                            }
                            else {
                                javax.swing.JOptionPane.showMessageDialog(null, "Utente non Esistente!");
                            }
                            MyResult.close();
                            MyStatement.close();
                            MyConnection.close();
                        }
                        catch(Exception MyException) {
                            MyException.printStackTrace();
                        }
                    }
                    else {
                        javax.swing.JOptionPane.showMessageDialog(null, "Perchè?");
                    }
                }
                else {
                    javax.swing.JOptionPane.showMessageDialog(null, "Devi inserire un ID di un Utente!");
                }
                break;
            }
            else if (ButtonList.get(I) == Button_VediAmici) {
                String FriendsList = "";
                try {
                    java.sql.Connection MyConnection = DriverManager.getConnection("jdbc:mysql://localhost:3306/Progetto", "root", "");
                    java.sql.Statement MyStatement = MyConnection.createStatement();
                    java.sql.ResultSet MyResult = MyStatement.executeQuery("Select KSUtente2 From UtentiAmici Where KSUtente1 = \"" + CurrentAccount + "\"");
                    while (MyResult.next()) {
                        FriendsList = FriendsList + "\n" + MyResult.getString("KSUtente2");
                    }
                    javax.swing.JOptionPane.showMessageDialog(null, FriendsList);
                    MyResult.close();
                    MyStatement.close();
                    MyConnection.close();
                }
                catch (Exception MyException){
                    MyException.printStackTrace();
                }
                break;
            }
            else if (ButtonList.get(I) == Button_IndietroDaGestioneAmici) {
                AccessoEseguito();
                break;
            }
            else if (ButtonList.get(I) == Button_ClassificaGlobale) {
                try {
                    java.sql.Connection MyConnection = DriverManager.getConnection("jdbc:mysql://localhost:3306/Progetto", "root", "");
                    java.sql.Statement MyStatement = MyConnection.createStatement();
                    java.sql.ResultSet MyResult = MyStatement.executeQuery("Select IDUtente, Punteggio From Partita Order By Punteggio Desc");
                    String ClassificaGlobale = "Classifica Globale - Top 10\n ";
                    for (int K = 0; K < 10 && MyResult.next(); K++) {
                        ClassificaGlobale += K + 1 + ". " + MyResult.getString("IDUtente") + ": " + MyResult.getInt("Punteggio") + "\n ";
                    }
                    javax.swing.JOptionPane.showMessageDialog(null, ClassificaGlobale);
                    MyResult.close();
                    MyStatement.close();
                    MyConnection.close();
                }
                catch (Exception MyException) {
                    MyException.printStackTrace();
                }
                break;
            }
            else if (ButtonList.get(I) == Button_ClassificaContinentale) {
                try {
                    if (!TextBox_Classifiche.GetText().equals("")) {
                        java.sql.Connection MyConnection = DriverManager.getConnection("jdbc:mysql://localhost:3306/Progetto", "root", "");
                        java.sql.Statement MyStatement = MyConnection.createStatement();
                        java.sql.ResultSet MyResult = MyStatement.executeQuery("Select IDContinente, Nome From Continente Where Nome = \"" + TextBox_Classifiche.GetText() + "\"");
                        if (MyResult.next()) {
                            int ID = MyResult.getInt("IDContinente");
                            String T = MyResult.getString("Nome");
                            MyResult = MyStatement.executeQuery("Select Partita.IDUtente, Partita.Punteggio From Partita, Utente, Provincia, Regione, Nazione Where Partita.IDUtente = Utente.IDUtente And Utente.KSProvincia = Provincia.IDProvincia And Provincia.KSRegione = Regione.IDRegione And Regione.KSNazione = Nazione.IDNazione And KSContinente = " + ID + " Order By Partita.Punteggio Desc");
                            String ClassificaContinentale = "Classifica Continentale (" + T + ") - Top 10\n ";
                            for (int K = 0; K < 10 && MyResult.next(); K++) {
                                ClassificaContinentale += K + 1 + ". " + MyResult.getString("Partita.IDUtente") + ": " + MyResult.getInt("Partita.Punteggio") + "\n ";
                            }
                            javax.swing.JOptionPane.showMessageDialog(null, ClassificaContinentale);
                        }
                        else {
                            javax.swing.JOptionPane.showMessageDialog(null, "Continente non Esistente");
                        }
                        MyResult.close();
                        MyStatement.close();
                        MyConnection.close();
                    }
                    else {
                        javax.swing.JOptionPane.showMessageDialog(null, "Inserire il Continente");
                    }                    
                }
                catch (Exception MyException) {
                    MyException.printStackTrace();
                }
                break;
            }
            else if (ButtonList.get(I) == Button_ClassificaNazionale) {
                try {
                    if (!TextBox_Classifiche.GetText().equals("")) {
                        java.sql.Connection MyConnection = DriverManager.getConnection("jdbc:mysql://localhost:3306/Progetto", "root", "");
                        java.sql.Statement MyStatement = MyConnection.createStatement();
                        java.sql.ResultSet MyResult = MyStatement.executeQuery("Select IDNazione From Nazione Where Nome = \"" + TextBox_Classifiche.GetText() + "\"");
                        if (MyResult.next()) {
                            int ID = MyResult.getInt("IDNazione");
                            String T = MyResult.getString("Nome");
                            MyResult = MyStatement.executeQuery("Select Partita.IDUtente, Partita.Punteggio From Partita, Utente, Provincia, Regione Where Partita.IDUtente = Utente.IDUtente And Utente.KSProvincia = Provincia.IDProvincia And Provincia.KSRegione = Regione.IDRegione And KSNazione = " + ID + " Order By Partita.Punteggio Desc");
                            String ClassificaNazionale = "Classifica Nazionale (" + T + ") - Top 10\n ";
                            for (int K = 0; K < 10 && MyResult.next(); K++) {
                                ClassificaNazionale += K + 1 + ". " + MyResult.getString("Partita.IDUtente") + ": " + MyResult.getInt("Partita.Punteggio") + "\n ";
                            }
                            javax.swing.JOptionPane.showMessageDialog(null, ClassificaNazionale);
                        }
                        else {
                            javax.swing.JOptionPane.showMessageDialog(null, "Nazione non Esistente");
                        }
                        MyResult.close();
                        MyStatement.close();
                        MyConnection.close();
                    }
                    else {
                        javax.swing.JOptionPane.showMessageDialog(null, "Inserire la Nazione");
                    }                    
                }
                catch (Exception MyException) {
                    MyException.printStackTrace();
                }
                break;
            }
            else if (ButtonList.get(I) == Button_ClassificaRegionale) {
              try {
                    if (!TextBox_Classifiche.GetText().equals("")) {
                        java.sql.Connection MyConnection = DriverManager.getConnection("jdbc:mysql://localhost:3306/Progetto", "root", "");
                        java.sql.Statement MyStatement = MyConnection.createStatement();
                        java.sql.ResultSet MyResult = MyStatement.executeQuery("Select IDRegione From Regione Where Nome = \"" + TextBox_Classifiche.GetText() + "\"");
                        if (MyResult.next()) {
                            int ID = MyResult.getInt("IDRegione");
                            String T = MyResult.getString("Nome");
                            MyResult = MyStatement.executeQuery("Select Partita.IDUtente, Partita.Punteggio From Partita, Utente, Provincia Where Partita.IDUtente = Utente.IDUtente And Utente.KSProvincia = Provincia.IDProvincia And KSRegione = " + ID + " Order By Partita.Punteggio Desc");
                            String ClassificaRegionale = "Classifica Regionale (" + T + ") - Top 10\n ";
                            for (int K = 0; K < 10 && MyResult.next(); K++) {
                                ClassificaRegionale += K + 1 + ". " + MyResult.getString("Partita.IDUtente") + ": " + MyResult.getInt("Partita.Punteggio") + "\n ";
                            }
                            javax.swing.JOptionPane.showMessageDialog(null, ClassificaRegionale);
                        }
                        else {
                            javax.swing.JOptionPane.showMessageDialog(null, "Regione non Esistente");
                        }
                        MyResult.close();
                        MyStatement.close();
                        MyConnection.close();
                    }
                    else {
                        javax.swing.JOptionPane.showMessageDialog(null, "Inserire la Regione");
                    }                    
                }
                catch (Exception MyException) {
                    MyException.printStackTrace();
                }
                break;
            }
            else if (ButtonList.get(I) == Button_ClassificaProvinciale) {
                try {
                    if (!TextBox_Classifiche.GetText().equals("")) {
                        java.sql.Connection MyConnection = DriverManager.getConnection("jdbc:mysql://localhost:3306/Progetto", "root", "");
                        java.sql.Statement MyStatement = MyConnection.createStatement();
                        java.sql.ResultSet MyResult = MyStatement.executeQuery("Select IDProvincia From Provincia Where Nome = \"" + TextBox_Classifiche.GetText() + "\"");
                        if (MyResult.next()) {
                            int ID = MyResult.getInt("IDProvincia");
                            String T = MyResult.getString("Nome");
                            MyResult = MyStatement.executeQuery("Select Partita.IDUtente, Partita.Punteggio From Partita, Utente Where Partita.IDUtente = Utente.IDUtente And KSProvincia = " + ID + " Order By Partita.Punteggio Desc");
                            String ClassificaProvinciale = "Classifica Provinciale (" + T + ") - Top 10\n ";
                            for (int K = 0; K < 10 && MyResult.next(); K++) {
                                ClassificaProvinciale += K + 1 + ". " + MyResult.getString("Partita.IDUtente") + ": " + MyResult.getInt("Partita.Punteggio") + "\n ";
                            }
                            javax.swing.JOptionPane.showMessageDialog(null, ClassificaProvinciale);
                        }
                        else {
                            javax.swing.JOptionPane.showMessageDialog(null, "Provincia non Esistente");
                        }
                        MyResult.close();
                        MyStatement.close();
                        MyConnection.close();
                    }
                    else {
                        javax.swing.JOptionPane.showMessageDialog(null, "Inserire la Provincia");
                    }                    
                }
                catch (Exception MyException) {
                    MyException.printStackTrace();
                }
                break;
            }
            else if (ButtonList.get(I) == Button_ClassificaAmici) {
                try {
                    java.sql.Connection MyConnection = DriverManager.getConnection("jdbc:mysql://localhost:3306/Progetto", "root", "");
                    java.sql.Statement MyStatement = MyConnection.createStatement();
                    MyStatement.executeUpdate("Create View Amici As Select KSUtente2 From UtentiAmici Where KSUtente1 = \"" + CurrentAccount + "\"");
                    java.sql.ResultSet MyResult = MyStatement.executeQuery("Select IDUtente, Punteggio From Partita, Amici Where IDUtente = \"" + CurrentAccount + "\" Or IDUtente = Amici.KSUtente2 Order By Punteggio Desc");
                    String ClassificaAmici = "Classifica Amici - Top 10\n ";
                    for (int K = 0; K < 10 && MyResult.next(); K++) {
                        ClassificaAmici += K + 1 + ". " + MyResult.getString("IDUtente") + ": " + MyResult.getInt("Punteggio") + "\n ";
                    }
                    MyStatement.executeUpdate("Drop View Amici");
                    javax.swing.JOptionPane.showMessageDialog(null, ClassificaAmici);
                    MyResult.close();
                    MyStatement.close();
                    MyConnection.close();                 
                }
                catch (Exception MyException) {
                    MyException.printStackTrace();
                }
                break;
            }
            else if (ButtonList.get(I) == Button_IndietroDaClassifiche) {
                AccessoEseguito();
                break;
            }
        }
    }
    // Click TextBox
    for (int I = 0; I < TextBoxList.size(); I++) {
        if (TextBoxList.get(I).IsVisible() && TextBoxList.get(I).MouseCheck()) {
            TextBoxList.get(I).SetSelected(true);
            TextBox Temp = TextBoxList.get(I);
            for (int J = 0; J < TextBoxList.size(); J++) {
                if (TextBoxList.get(I) != Temp) {
                    TextBoxList.get(I).SetSelected(false);
                }
            }
        }
        else {
            TextBoxList.get(I).SetSelected(false);
        }
    }
}

void keyPressed() {
    // Scrittura TextBox
    TextBox Temp;
    for (int I = 0; I < TextBoxList.size(); I++) {
        if (TextBoxList.get(I).IsSelected()) {
            Temp = TextBoxList.get(I);
            if (key == BACKSPACE) {
                String A = Temp.GetText();
                if (A.length() > 0) {
                    String B = A.substring(0, A.length() - 1);
                    Temp.SetText(B);
                }
            }
            // Tasti Concessi
            String A = Temp.GetText();
            int K = char(key);
            if (K >= 48 && K <= 57 || K >= 65 && K <= 90 || K >= 97 && K <= 122) {
                String B = A + char(K);
                Temp.SetText(B);
            }            
            else if (char(K) == '.' || char(K) == '-' || char(K) == '_' || char(K) == '@' || char(K) == ' '){
                String B = A + char(K);
                Temp.SetText(B);
            }
            break;
        }
    }
   // Tasti del Gioco
   if (keyCode == LEFT && (SchermataGioco || SchermataGioco0)) {
       GameToPlay.MyPanzer.Direction = Left;
   }
   else if (keyCode == RIGHT && (SchermataGioco || SchermataGioco0)) {
       GameToPlay.MyPanzer.Direction = Right;
   }
   else if (keyCode == UP && (SchermataGioco || SchermataGioco0)) {
       GameToPlay.MyPanzer.Shot();
   }
}

void keyReleased() {
   // Tasti del Gioco
   if (keyCode == LEFT && (SchermataGioco || SchermataGioco0) && GameToPlay.MyPanzer.Direction != RIGHT) {
       GameToPlay.MyPanzer.Direction = Stop;
   }
   else if (keyCode == RIGHT && (SchermataGioco || SchermataGioco0) && GameToPlay.MyPanzer.Direction != LEFT) {
       GameToPlay.MyPanzer.Direction = Stop;
   }
}

boolean TestConnection() {
    try {
        java.sql.Connection MyConnection = DriverManager.getConnection("jdbc:mysql://localhost:3306/Progetto", "root", "");
        MyConnection.close();
        return true;
    }
    catch (Exception MyException) {
        return false;
    }
}

void AggiungiPunteggio (int _Punteggio) {
    try {
        java.sql.Connection MyConnection = DriverManager.getConnection("jdbc:mysql://localhost:3306/Progetto", "root", "");
        java.sql.Statement MyStatement = MyConnection.createStatement();
        java.sql.ResultSet MyResult;
        MyResult = MyStatement.executeQuery("Select Max(IDPartita) From Partita");
        int C = 1;
        if (MyResult.next()) {
            C = MyResult.getInt("Max(IDPartita)");
            C++;
        }
        String StringaAggiuntaPartita = "Insert Into Partita Values (" + C +  ", \"" + CurrentAccount + "\", " + _Punteggio + ")"; 
        MyStatement.executeUpdate(StringaAggiuntaPartita);
        MyResult.close();
        MyStatement.close();
        MyConnection.close();
    }
    catch (Exception MyException){
        MyException.printStackTrace();
    }
}
