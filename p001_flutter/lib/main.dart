//Importation de la bibliotheque material dart qui gere le disagn system et fourni des composants de base
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Whatsapp'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      if (_counter < 10) {
        _counter++;
      } else {
        _counter = -10;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.camera_alt),
            tooltip: 'Reset',
            onPressed: () {
              setState(() {
                _counter = 0;
              });
            },
          ),
          IconButton(
            icon: const Icon(Icons.search),
            tooltip: 'Delete',
            onPressed: () {
              setState(() {
                _counter = 0;
              });
            },
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            tooltip: 'Delete',
            onPressed: () {
              setState(() {
                _counter = 0;
              });
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //ajouter  des ListView.separated pour afficher la liste des contacts
            ListView.separated(
              shrinkWrap: true,
              itemCount: 7,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Contact $index'),
                  subtitle: Text('Phone number $index'),
                  leading: const Icon(Icons.person),
                  trailing: const Icon(Icons.call),
                );
              },
              separatorBuilder: (context, index) => const Divider(),
            )
          ],
        ),
      ),
      //ajouter un navigation bar pour naviguer entre les pages comme la bar de navigation de watchapp la bar doit avoir 4 boutons
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        iconSize: 20, // Réduit la taille des icônes
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.update),
            label: 'Update',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.groups),
            label: 'Communities',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.call),
            label: 'Calls',
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
