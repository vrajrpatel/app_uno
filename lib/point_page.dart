
import 'package:app_uno/symptom_page.dart';
import 'package:flutter/material.dart';

class PointPageDemo extends StatefulWidget {
  const PointPageDemo({Key? key, required String title}) : super(key: key);

  @override
  _PointPageDemoState createState() => _PointPageDemoState();
}

class _PointPageDemoState extends State<PointPageDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Welcome'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:[
            Image(
              image: NetworkImage('https://www.cdc.gov/diabetes/images/basics/Symptoms-twitter.jpg'),
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                  'Welcome to Diagnostapp! This app will allow you to select your symptoms and determine your illness with further information',
                  style: TextStyle(
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                    color: Colors.green,
                  )
              ),
            ),
            Container(
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.green),
                ),
                child: Text('Next'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SymptomPage(title: "Symptoms Page")),
                  );
                },

              ),
            )
          ],
        ),
      ),



    );

  }
}
