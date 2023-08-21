import 'package:flutter/material.dart';

class Resultpage extends StatelessWidget {
  final String result;
  final String bmi;
  final String disc;
  Resultpage({required this.bmi, required this.result, required this.disc});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI index'),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                  child: Text(
                'Your results',
                style: TextStyle(fontSize: 25),
              )),
            ),
            Expanded(
              flex: 5,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.lightBlue,
                    borderRadius: BorderRadius.circular(50)),
                margin: EdgeInsets.all(30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        result.toString(),
                        style: TextStyle(
                          fontSize: 40,
                        ),
                      ),
                    ),
                    Text(
                      bmi.toString(),
                      style: TextStyle(fontSize: 60),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        disc.toString(),
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                height: 100,
                width: double.infinity,
                color: Colors.red,
                child: Center(
                    child: Text(
                  'RE-Calculate',
                  style: TextStyle(fontSize: 20),
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
