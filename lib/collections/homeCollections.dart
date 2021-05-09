import 'package:flutter/material.dart';

class HomeCollection extends StatelessWidget {
  final String firstImageUrl;
  final String secondImageUrl;

  HomeCollection({Key key, this.firstImageUrl, this.secondImageUrl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.network(
            firstImageUrl,
            width: MediaQuery.of(context).size.width / 3,
            height: MediaQuery.of(context).size.height / 5,
          ),
          Image.network(
            secondImageUrl,
            width: MediaQuery.of(context).size.width / 3,
            height: MediaQuery.of(context).size.height / 5,
          ),
        ],
      ),
    );
  }
}
