package ch.cpln.psi.tournamentmanager;

/**
 * Created by Plinio on 29.10.2016.
 * Connecteur à une base de données
 * De type singleton pour n'avoir qu'un suel
 * objet qui se connecte.
 */
public class BaseTournament {

    /** Instance unique pré-initialisée */
    private static BaseTournament ourInstance = new BaseTournament();

    /** Point d'accès pour l'instance unique du singleton */
    public static BaseTournament getInstance(String ipString, String nom_bd, String pwd) {
        ip = ipString;
        bdName = nom_bd;
        password = pwd;
        return ourInstance;
    }

    /** Constructeur privé */
    private BaseTournament() {
    }

    private static String ip;
    private static String bdName;
    private static String password;

    public String[] getTournamentNames(){
        String[] listItems = {"Volley-ball M17", "Foot juniors D", "Tennis R6", "Volley Jeunesse"};
        return  listItems;
    }
}
