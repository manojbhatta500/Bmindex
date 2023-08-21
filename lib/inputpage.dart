import 'package:bmindex/brain.dart';
import 'package:bmindex/resultpage.dart';
import 'package:flutter/material.dart';
import 'package:bmindex/widgets/reuseablecard.dart';

Color activecolor = Colors.lightBlue;
Color inactivecolor = Color(0xff1D1E33);

class Inputpage extends StatefulWidget {
  const Inputpage({super.key});

  @override
  State<Inputpage> createState() => _InputpageState();
}

class _InputpageState extends State<Inputpage> {
  int height = 180;
  int weight = 60;
  int age = 20;

  Color malecolor = inactivecolor;
  Color femalecolor = inactivecolor;

  void updatecolor(int i) {
    if (i == 1) {
      if (malecolor == inactivecolor) {
        malecolor = activecolor;
        femalecolor = inactivecolor;
      } else {
        malecolor = inactivecolor;
      }
    } else {
      if (femalecolor == inactivecolor) {
        femalecolor = activecolor;
        malecolor = inactivecolor;
      } else {
        femalecolor = inactivecolor;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Index'),
        centerTitle: true,
      ),
      body: Column(children: [
        Expanded(
            child: Row(
          children: [
            Expanded(
              child: GestureDetector(
                  onTap: () {
                    setState(() {
                      updatecolor(1);
                    });
                  },
                  child: Reuseablecard(
                      rang: malecolor, given_icon: Icons.male, gender: 'male')),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    updatecolor(2);
                  });
                },
                child: Reuseablecard(
                    rang: femalecolor,
                    given_icon: Icons.female,
                    gender: 'female'),
              ),
            ),
          ],
        )),
        Expanded(
          child: Container(
              width: double.infinity,
              margin: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: inactivecolor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Height',
                    style: TextStyle(fontSize: 30),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        height.toString(),
                        style: TextStyle(fontSize: 50),
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Text(
                        'cm',
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                  Slider(
                      max: 220,
                      min: 100,
                      activeColor: Colors.red,
                      inactiveColor: Colors.blueAccent,
                      value: height.toDouble(),
                      onChanged: (double svalue) {
                        setState(() {
                          height = svalue.round();
                        });
                      })
                ],
              )),
        ),
        Expanded(
            child: Row(children: [
          Expanded(
            child: Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: inactivecolor,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Weight',
                      style: TextStyle(fontSize: 30),
                    ),
                    Text(
                      weight.toString(),
                      style: TextStyle(fontSize: 50),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        FloatingActionButton(
                          onPressed: () {
                            setState(() {
                              weight--;
                            });
                          },
                          child: Icon(Icons.minimize),
                        ),
                        FloatingActionButton(
                          onPressed: () {
                            setState(() {
                              weight++;
                            });
                          },
                          child: Icon(Icons.add),
                        )
                      ],
                    )
                  ],
                )),
          ),
          Expanded(
            child: Container(
                margin: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: inactivecolor,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Age',
                      style: TextStyle(fontSize: 30),
                    ),
                    Text(
                      age.toString(),
                      style: TextStyle(fontSize: 50),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        FloatingActionButton(
                          onPressed: () {
                            setState(() {
                              age--;
                            });
                          },
                          child: Icon(Icons.minimize),
                        ),
                        FloatingActionButton(
                          onPressed: () {
                            setState(() {
                              age++;
                            });
                          },
                          child: Icon(Icons.add),
                        )
                      ],
                    )
                  ],
                )),
          ),
        ])),
        GestureDetector(
          onTap: () {
            Brain conductor = Brain(height: height, weight: weight);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Resultpage(
                        bmi: conductor.getbmi(),
                        result: conductor.getresult(),
                        disc: conductor.getdisc())));
          },
          child: Container(
            height: 60,
            width: double.infinity,
            color: Colors.red,
            child: Center(child: Text('Calculate')),
          ),
        )
      ]),
    );
  }
}
