import 'package:flutter/material.dart';

import 'package:capyba_challenge/services/authServices.dart';
import 'package:capyba_challenge/pages/publicPages/landingPage.dart';
import 'package:capyba_challenge/customWidgets/customCollection.dart';

class RestrictedPage extends StatefulWidget {
  @override
  _RestrictedPageState createState() => _RestrictedPageState();
}

class _RestrictedPageState extends State<RestrictedPage> {
  final AuthService _auth = AuthService();
  String name = '';
  String email = '';
  bool isEmailVerified = false;

  @override
  void initState() {
    getUserData().then((value) {
      setState(() {
        name = value[0];
        email = value[1];
        isEmailVerified = value[2];
      });
    });
    super.initState();
  }

  Future getUserData() async {
    dynamic userInformations = await _auth.getUserInformations();
    return userInformations;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(
          'Área restrita',
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(
                    email,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Divider(
                    height: 1,
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.account_box,
                      color: Colors.greenAccent.shade700,
                    ),
                    title: Text(
                      'Editar meu perfil',
                      style: TextStyle(fontSize: 16),
                    ),
                    onTap: () {},
                  ),
                  Divider(
                    height: 1,
                  ),
                  isEmailVerified
                      ? ListTile(
                          leading: Icon(
                            Icons.home,
                            color: Colors.greenAccent.shade700,
                          ),
                          title: Text('Voltar para a Home',
                              style: TextStyle(fontSize: 16)),
                          onTap: () {
                            Navigator.of(context).pushNamed('/home');
                          },
                        )
                      : ListTile(
                          leading: Icon(
                            Icons.email,
                            color: Colors.greenAccent.shade700,
                          ),
                          title: Text('Validar e-mail',
                              style: TextStyle(fontSize: 16)),
                          onTap: () {
                            _auth.sendVerification();
                          },
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
                      Navigator.of(context).pushNamedAndRemoveUntil(
                        '/landingPage',
                        (r) => false,
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomCollection(
              firstImageUrl:
                  'https://images.unsplash.com/photo-1552573449-1c180bcfe86d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1350&q=80',
              secondImageUrl:
                  'https://images.unsplash.com/photo-1553913861-c0fddf2619ee?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1350&q=80',
            ),
            CustomCollection(
              firstImageUrl:
                  'https://images.unsplash.com/photo-1553615738-d8e0829f1d61?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1489&q=80',
              secondImageUrl:
                  'https://images.unsplash.com/photo-1553773077-91673524aafa?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1351&q=80',
            ),
            CustomCollection(
              firstImageUrl:
                  'https://images.unsplash.com/photo-1553702446-a39d6fbee6cb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1351&q=80',
              secondImageUrl:
                  'https://images.unsplash.com/photo-1556684119-0c4f88c60d1c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1350&q=80',
            ),
            CustomCollection(
              firstImageUrl:
                  'https://images.unsplash.com/photo-1555231955-348aa2312e19?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1350&q=80',
              secondImageUrl:
                  'https://images.unsplash.com/photo-1554254648-2d58a1bc3fd5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1351&q=80',
            ),
            CustomCollection(
              firstImageUrl:
                  'https://images.unsplash.com/photo-1556379092-dca659792591?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1489&q=80',
              secondImageUrl:
                  'https://images.unsplash.com/photo-1555993539-1732b0258235?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1350&q=80',
            ),
            CustomCollection(
              firstImageUrl:
                  'https://images.unsplash.com/photo-1551573355-19727699d60a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=2700&q=80',
              secondImageUrl:
                  'https://images.unsplash.com/photo-1553449427-5be243bc1218?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1350&q=80',
            ),
          ],
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
        child: Icon(Icons.lock),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
