import 'package:flutter/material.dart';

import 'package:capyba_challenge/components/buttonComponent.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String email = '';
  String password = '';

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openDrawer() {
    _scaffoldKey.currentState.openDrawer();
  }

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
                      onPressed: _closeDrawer,
                      width: double.infinity,
                      title: 'Validar Email',
                    ),
                  ],
                ),
              ),
              ButtonComponent(
                backgroundColor: Colors.red.shade400,
                fontSize: 20,
                height: 50,
                onPressed: _closeDrawer,
                width: double.infinity,
                title: 'Sair',
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
