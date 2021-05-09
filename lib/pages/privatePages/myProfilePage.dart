import 'dart:io';
import 'package:image_picker/image_picker.dart';

import 'package:flutter/material.dart';

import 'package:capyba_challenge/services/authServices.dart';

import 'package:capyba_challenge/customWidgets/customLoading.dart';
import 'package:capyba_challenge/customWidgets/customButton.dart';
import 'package:capyba_challenge/customWidgets/customInput.dart';

class MyProfilePage extends StatefulWidget {
  @override
  _MyProfilePage createState() => _MyProfilePage();
}

class _MyProfilePage extends State<MyProfilePage> {
  final AuthService _auth = AuthService();
  var imageFile;

  bool loading = false;

  String name = '';
  String email = '';
  String photoUrl = '';
  String errorMessage = '';

  @override
  void initState() {
    getUserData().then((value) {
      setState(() {
        name = value[0];
        email = value[1];
        photoUrl = value[2];
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
    return loading
        ? CustomLoading(backgroundColor: Colors.blueAccent.shade400)
        : Scaffold(
            body: SingleChildScrollView(
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Edite suas informações!',
                          style: TextStyle(fontSize: 20),
                        ),
                        Column(
                          children: [
                            imageFile == null
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(100.0),
                                    child: Image.network(
                                      photoUrl,
                                      width: 180,
                                      height: 180,
                                      fit: BoxFit.fill,
                                    ),
                                  )
                                : ClipRRect(
                                    borderRadius: BorderRadius.circular(100.0),
                                    child: Image.file(
                                      imageFile,
                                      width: 180,
                                      height: 180,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                            SizedBox(
                              height: 15,
                            ),
                            CustomButton(
                              width: 120,
                              height: 40,
                              fontSize: 15,
                              title: 'Alterar foto',
                              onPressed: () async {
                                final pickedFile = await ImagePicker().getImage(
                                  preferredCameraDevice: CameraDevice.front,
                                  source: ImageSource.camera,
                                );
                                if (pickedFile != null) {
                                  setState(() {
                                    imageFile = File(pickedFile.path);
                                  });
                                }
                              },
                              backgroundColor: Colors.greenAccent.shade700,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            CustomInput(
                              typeOfInput: 'Name',
                              label: name,
                              onChanged: (namelValue) {
                                name = namelValue;
                              },
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            CustomInput(
                              typeOfInput: 'Email',
                              label: email,
                              onChanged: (emailValue) {
                                email = emailValue;
                              },
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            CustomButton(
                              width: double.infinity,
                              height: 50,
                              fontSize: 20,
                              title: 'Concluído',
                              backgroundColor: Colors.blueAccent.shade400,
                              onPressed: () async {
                                setState(() => loading = true);

                                if (imageFile != null) {
                                  dynamic result =
                                      await _auth.updateUserInformations(
                                    name,
                                    email,
                                    imageFile,
                                  );

                                  if (result == null) {
                                    setState(() {
                                      errorMessage =
                                          'Email inválido ou já em uso!';
                                      loading = false;
                                    });
                                  } else {
                                    Navigator.of(context)
                                        .pushReplacementNamed('/home');
                                  }
                                } else {
                                  dynamic result = await _auth
                                      .updateUserInformationsFromImageUrl(
                                    name,
                                    email,
                                    photoUrl,
                                  );

                                  if (result == null) {
                                    setState(() {
                                      errorMessage =
                                          'Email inválido ou já em uso!';
                                      loading = false;
                                    });
                                  } else {
                                    Navigator.of(context)
                                        .pushReplacementNamed('/home');
                                  }
                                }
                              },
                            ),
                            SizedBox(height: 12.0),
                            Text(
                              errorMessage,
                              style:
                                  TextStyle(color: Colors.red, fontSize: 14.0),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
  }
}
