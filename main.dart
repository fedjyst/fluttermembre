import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // List of people with their information
  final List<Map<String, dynamic>> people = [
    {
      'nom': 'Payen',
      'prenom': 'Sterlin',
      'laj': '22 ane ',
      'email': 'payenfedjy@gmail.com',
      'Inivesite': ['ESIH'],
      'Spesyalizasyon': ['web devlopment'],
    },
    {
      'nom': 'Blanc',
      'prenom': 'Jorry',
      'laj': '23 ane ',
      'email': 'jorryh2@gmail.com',
      'Inivesite': ['ESIH'],
      'Spesyalizasyon': ['web devlopment'],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Info Moun',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Manm gwoup lan',
            style: TextStyle(fontSize: 20.0),
          ),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: ListView.builder(
          itemCount: people.length,
          itemBuilder: (context, index) {
            final person = people[index];
            return ListTile(
              title: Text(
                '${person['nom']} ${person['prenom']}',
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PersonDetails(person: person),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class PersonDetails extends StatelessWidget {
  final Map<String, dynamic> person;

  PersonDetails({required this.person});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${person['nom']} ${person['prenom']}',
          style: TextStyle(fontSize: 20.0),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => InfoPersonel(person: person),
                    ),
                  );
                },
                child: Text('Info Pèsonèl'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(20.0),
                  textStyle: TextStyle(fontSize: 18.0),
                )),
            SizedBox(height: 20),
            
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FormasyonAkademik(person: person),
                    ),
                  );
                },
                child: Text(
                  'Fòmasyon Akademik'
                ),
                
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(20.0),
                  textStyle: TextStyle(fontSize: 18.0),
                  
                )),
          ],
        ),
      ),
    );
  }
}

class InfoPersonel extends StatelessWidget {
  final Map<String, dynamic> person;

  InfoPersonel({required this.person});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Info Pèsonèl',
          style: TextStyle(fontSize: 20.0),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text('Nom: ${person['nom']}'),
          ),
          ListTile(
            title: Text('Prenom: ${person['prenom']}'),
          ),
          ListTile(
            title: Text('Laj: ${person['laj']}'),
          ),
          ListTile(
            title: Text('Email: ${person['email']}'),
          ),
        ],
      ),
    );
  }
}

class FormasyonAkademik extends StatelessWidget {
  final Map<String, dynamic> person;

  FormasyonAkademik({required this.person});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Fòmasyon Akademik',
          style: TextStyle(fontSize: 20.0),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...List.generate(
            person['Inivesite'].length,
            (index) => ListTile(
              title: Text('Inivesite : ${person['Inivesite'][index]}'),
            ),
          ),
          ...List.generate(
            person['Spesyalizasyon'].length,
            (index) => ListTile(
              title:
                  Text('Spesyalizasyon : ${person['Spesyalizasyon'][index]}'),
            ),
          ),
        ],
      ),
    );
  }
}
