import 'package:flutter/material.dart';

import 'questions.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  var score = 0;
  var n = 0;
  List que_list = [
    Questions("1.Flutter is a framework", true),
    Questions("2.dart is programminglanguage", true),
    Questions('3.api call using http package', true),
    Questions('4.http dependency inbuild in flutter', false)
  ];

  void check(bool choice) {
    if (choice == que_list[n].ans) {
      debugPrint('correct');
      setState(() {
        score = score + 1;
      });
      //score = score + 1; normal declare panna work aagathu setstate la podanum
    } else {
      debugPrint('incorrect');
    }
    //qustion change
    setState(() {
      if (n < que_list.length - 1) {
        n = n + 1;
      } else {}
    });
  }

  void reset() {
    setState(() {
      n = 0;
      score = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text('Simple Quiz'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Score: $score/4',
                  style: TextStyle(
                      color: Colors.brown, fontWeight: FontWeight.bold),
                ),
                InkWell(
                  onTap: () {
                    reset();
                  },
                  child: Text(
                    'Reset',
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Container(
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  border: Border.all(color: Colors.brown)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    que_list[n].que,
                    style: TextStyle(fontSize: 15.0),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(
                  onPressed: () {
                    check(true);
                  },
                  child: Text(
                    'True',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  color: Colors.green,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
                RaisedButton(
                  onPressed: () {
                    check(false);
                  },
                  child: Text(
                    'False',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  color: Colors.red,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
