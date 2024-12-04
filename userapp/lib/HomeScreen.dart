import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Database database;
  List<Map<String, dynamic>> _userList = []; // Liste des utilisateurs.

  @override
  void initState() {
    super.initState();
    initializeDatabase().then((db) {
      database = db;
      fetchData();
    });
  }

  Future<Database> initializeDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'userapp.db');

    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE users (id INTEGER PRIMARY KEY, name TEXT)',
        );
      },
    );
  }

  Future<void> fetchData() async {
    final users = await database.query('users'); // Lecture des utilisateurs.
    setState(() {
      _userList = users;
    });
  }

  Future<void> insertUser(String name) async {
    await database.insert(
      'users',
      {'name': name},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    fetchData(); // Rafraîchit la liste après insertion.
  }

  Future<void> deleteUser(int id) async {
    await database.delete(
      'users',
      where: 'id = ?',
      whereArgs: [id],
    );
    fetchData(); // Rafraîchit la liste après suppression.
  }

  Future<void> updateUser(int id, String name) async {
    await database.update(
      'users',
      {'name': name},
      where: 'id = ?',
      whereArgs: [id],
    );
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User App'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: fetchData,
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () async {
              await database.delete('users');
              fetchData(); // Rafraîchit la liste apres suppression.
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _userList.length,
        itemBuilder: (context, index) {
          final user = _userList[index];
          return ListTile(
            title: Text(user['name'],
                style: const TextStyle(fontWeight: FontWeight.bold)),
            trailing: Row(
              mainAxisSize: MainAxisSize
                  .min, // Gère l'espace pour que le Row ne prenne que la place nécessaire
              children: [
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        final TextEditingController nameController =
                            TextEditingController(text: user['name']);
                        return AlertDialog(
                          title: const Text('Modifier l\'utilisateur'),
                          content: TextField(
                            controller: nameController,
                            decoration: const InputDecoration(labelText: 'Nom'),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('Annuler'),
                            ),
                            TextButton(
                              onPressed: () {
                                final newName = nameController.text;
                                if (newName.isNotEmpty) {
                                  updateUser(user['id'], newName);
                                }
                                Navigator.pop(context);
                              },
                              child: const Text('Modifier'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Suppression'),
                          content: const Text(
                              'Voulez-vous vraiment supprimer cet utilisateur ?'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('Annuler'),
                            ),
                            TextButton(
                              onPressed: () {
                                deleteUser(user['id']);
                                Navigator.pop(context);
                              },
                              child: const Text('Supprimer'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              String userName = '';
              return AlertDialog(
                title: const Text('Ajouter un utilisateur'),
                content: TextField(
                  onChanged: (value) => userName = value,
                  decoration: const InputDecoration(hintText: 'Enter un nom'),
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Annuler'),
                  ),
                  TextButton(
                    onPressed: () {
                      if (userName.isNotEmpty) {
                        insertUser(userName);
                      }
                      Navigator.pop(context);
                    },
                    child: const Text('Ajouter'),
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
