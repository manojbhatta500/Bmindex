import 'package:flutter/material.dart';

class Reuseablecard extends StatelessWidget {
  final Color rang;
  final IconData given_icon;
  final String gender;

  Reuseablecard(
      {required this.rang, required this.given_icon, required this.gender});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: rang,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            given_icon,
            size: 60,
          ),
          Text(
            gender,
            style: TextStyle(fontSize: 20),
          )
        ],
      ),
    );
  }
}
