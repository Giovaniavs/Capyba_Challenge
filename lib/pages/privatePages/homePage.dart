import 'package:flutter/material.dart';

import 'package:capyba_challenge/services/auth_service.dart';
import 'package:capyba_challenge/components/buttonComponent.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AuthService _auth = AuthService();
  String email = '';
  String password = '';

  void _closeDrawer() {
    Navigator.of(context).pop();
  }

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
              Container(
                child: Column(
                  children: [
                    ButtonComponent(
                      backgroundColor: Colors.greenAccent.shade700,
                      fontSize: 20,
                      height: 50,
                      onPressed: _closeDrawer,
                      width: double.infinity,
                      title: 'Meu Perfil',
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ButtonComponent(
                      backgroundColor: Colors.blueAccent.shade400,
                      fontSize: 20,
                      height: 50,
                      width: double.infinity,
                      title: 'Validar Email',
                      onPressed: _closeDrawer,
                    ),
                  ],
                ),
              ),
              ButtonComponent(
                backgroundColor: Colors.red.shade400,
                fontSize: 20,
                height: 50,
                width: double.infinity,
                title: 'Sair',
                onPressed: () async {
                  await _auth.signOut();
                  Navigator.of(context).pushReplacementNamed('/');
                },
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
