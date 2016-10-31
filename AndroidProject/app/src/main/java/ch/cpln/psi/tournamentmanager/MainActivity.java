package ch.cpln.psi.tournamentmanager;

import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity {
    //Récupère un objet en se connectant sur la base de données (de type Singleton)
    BaseTournament baseTournoi = BaseTournament.getInstance("ip", "nom_bd", "pwd");

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        //récupère la liste des tournoi depuis la base de donnée
        String[] listItems = baseTournoi.getTournamentNames();
        // initialise la liste du choix du tournoi
        initListViewTournament(listItems);

    }

    //Initialise the list view with the listItems values
    private void initListViewTournament(String[] listItems)
    {
        setListView(listItems);

        //Définir un évènement sur le changement
        ListView listView = (ListView) findViewById(R.id.listViewTournament);
        listView.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            public void onItemClick(AdapterView<?> parent, View view,
                                    int position, long id) {
                // When clicked, show a toast with the TextView text
                Toast.makeText(getApplicationContext(),
                        ((TextView) view).getText(), Toast.LENGTH_SHORT).show();
            }
        });

    }

    private void setListView(String[] listItems){

        // Create an ArrayAdapter using the string array and a default spinner layout
        ArrayAdapter adapter = new ArrayAdapter<String>(this, R.layout.list_item, listItems);

        //Faire coïncider la liste avec l'adapteur
        ListView listView = (ListView) findViewById(R.id.listViewTournament);
        listView.setAdapter(adapter);
    }
}
