
import 'package:flutter/material.dart';

class InfoPage extends StatefulWidget {

  var illnessDetails;
  InfoPage(this.illnessDetails);

  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Information'),
      ),
      body: Center(
      child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children:[
        Container(
          margin: EdgeInsets.all(20),
          child: Align(
            alignment: Alignment.center,
            child:
             Text("${widget.illnessDetails['description']}",
                style: TextStyle(
                color: Colors.brown,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Container(
          child: RaisedButton(
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.green),
            ),
            child: Text('Back'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        )
      ],
    ),
      ),


    );
  }
}
