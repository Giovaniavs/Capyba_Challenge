import 'package:flutter/material.dart';

import 'package:capyba_challenge/services/authServices.dart';
import 'package:capyba_challenge/pages/publicPages/landingPage.dart';
import 'package:capyba_challenge/customWidgets/customCollection.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AuthService _auth = AuthService();
  IconData validateEmailIcon = Icons.email;

  bool isEmailVerified = false;
  bool shoudlSendEmail = true;

  String name = '';
  String email = '';
  String photoUrl = '';
  String validateEmailText = 'Validar e-mail';

  @override
  void initState() {
    getUserData().then((value) {
      setState(() {
        name = value[0];
        email = value[1];
        photoUrl = value[2];
        isEmailVerified = value[3];
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
          'Página Home',
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
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100.0),
                    child: Image.network(
                      photoUrl,
                      width: 80,
                      height: 80,
                      fit: BoxFit.fill,
                    ),
                  ),
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
                    title: Text('Meu perfil', style: TextStyle(fontSize: 16)),
                    onTap: () {
                      Navigator.of(context).pushNamed('/myProfile');
                    },
                  ),
                  Divider(
                    height: 1,
                  ),
                  isEmailVerified
                      ? ListTile(
                          leading: Icon(
                            Icons.lock,
                            color: Colors.greenAccent.shade700,
                          ),
                          title: Text('Acessar área restrita',
                              style: TextStyle(fontSize: 16)),
                          onTap: () {
                            Navigator.of(context).pushNamed('/restrictedPage');
                          },
                        )
                      : ListTile(
                          leading: Icon(
                            validateEmailIcon,
                            color: Colors.greenAccent.shade700,
                          ),
                          title: Text(validateEmailText,
                              style: TextStyle(fontSize: 16)),
                          onTap: () {
                            if (shoudlSendEmail == true) {
                              _auth.sendVerification();
                              shoudlSendEmail = false;
                              setState(() {
                                validateEmailText = 'E-mail enviado!';
                                validateEmailIcon = Icons.check;
                              });
                            }
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
                  'https://images.unsplash.com/photo-1551801841-ecad875a5142?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=968&q=80',
              secondImageUrl:
                  'https://images.unsplash.com/photo-1554223090-7e482851df45?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=992&q=80',
            ),
            CustomCollection(
              firstImageUrl:
                  'https://images.unsplash.com/photo-1552727408-5d0599032dfb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=931&q=80',
              secondImageUrl:
                  'https://images.unsplash.com/photo-1551757102-2caaa44c37f8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1350&q=80',
            ),
            CustomCollection(
              firstImageUrl:
                  'https://images.unsplash.com/photo-1551573355-19727699d60a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=2700&q=80',
              secondImageUrl:
                  'https://images.unsplash.com/photo-1553449427-5be243bc1218?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1350&q=80',
            ),
            CustomCollection(
              firstImageUrl:
                  'https://images.unsplash.com/photo-1551801841-ecad875a5142?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=968&q=80',
              secondImageUrl:
                  'https://images.unsplash.com/photo-1554223090-7e482851df45?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=992&q=80',
            ),
            CustomCollection(
              firstImageUrl:
                  'https://images.unsplash.com/photo-1552727408-5d0599032dfb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=931&q=80',
              secondImageUrl:
                  'https://images.unsplash.com/photo-1551757102-2caaa44c37f8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1350&q=80',
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
        tooltip: 'Home button',
        child: Icon(Icons.home),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
