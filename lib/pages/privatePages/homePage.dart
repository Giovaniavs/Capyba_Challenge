import 'package:flutter/material.dart';

import 'package:capyba_challenge/services/authServices.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AuthService _auth = AuthService();
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home Page',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 30.0,
            left: 8.0,
            right: 8.0,
            bottom: 8.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  ListTile(
                    leading: Icon(
                      Icons.account_box,
                      color: Colors.greenAccent.shade700,
                    ),
                    title: Text('Meu perfil', style: TextStyle(fontSize: 16)),
                    onTap: () {},
                  ),
                  Divider(
                    height: 1,
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.email,
                      color: Colors.greenAccent.shade700,
                    ),
                    title:
                        Text('Validar e-mail', style: TextStyle(fontSize: 16)),
                    onTap: () {},
                  ),
                  Divider(
                    height: 1,
                  ),
                ],
              ),
              Column(
                children: [
                  Divider(
                    height: 1,
                  ),
                  ListTile(
                    leading:
                        Icon(Icons.exit_to_app, color: Colors.red.shade400),
                    title: Text(
                      'Sair',
                      style: TextStyle(fontSize: 16),
                    ),
                    onTap: () async {
                      await _auth.signOut();
                      Navigator.of(context).pushReplacementNamed('/landingPage');
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 50.0,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.greenAccent.shade700,
        onPressed: () {},
        tooltip: 'Increment Counter',
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
