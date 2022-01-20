
import 'package:app_uno/point_page.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'info_page.dart';



class SymptomPage extends StatefulWidget {
  const SymptomPage({Key? key, required String title}) : super(key: key);


  @override
  _SymptomPageState createState() => _SymptomPageState();
}

class _SymptomPageState extends State<SymptomPage> {

//final List<String> entries = <String>['allergies', 'cold', 'flu'];



  var illnessList = [];
  var illController = TextEditingController();
  var resultList = new Map();
  var infoList = [
    {
      'description' : 'There are various kinds of allergies like food, drug, and insect. If you are having symptoms of an allergic reaction, please seek help from a medical professional for proper diagnosis and treatment.',
    },
    {
      'description' : 'Ear infections are more common in children. Antibiotics can be used to clear up the infection. It is important to see a doctor if ear infection or pain persists, especially in children if it is bothering them.',
    },
    {
      'description' : 'There are different types of UTIs that can affect the kidney, bladder, or urethra. UTI usually occur when bacteria enters urinary tract through urethra and multiplies in bladder.',
    },
    {
      'description' : 'Common cold is a viral infection of a person\u0027s upper respiratory tract. Colds are mostly harmless and will go away in a few days to a week but time period can be dependant on various factors',
    },
    {
      'description' : 'There are many types of headaches such as: migraine, sinus, episodic tension, chronic tension, or cluster. The best way to diagnose your headache may be to visit a medical professional, especially if pain persists.',
    },
    {
      'description' : 'Inflammation of conjunctiva can indicate this disease. It is highly contagious, but it is not serious in most cases. The condition typically resolves itself within a few days.',
    },
    {
      'description' : 'Diarrhea has a multitude of causes such as: viruses, bacteria/parasites, meds, lactose intolerance, surgery, or other digestive disorders. It is important to watch out for dehydration during diarrhea episodes as they can be potentially serious. ',
    },
    {
      'description' : 'The best way to treat the flu is to: get plenty of rest, stay hydrated, and avoid contact with others. Doctors can provide you with antivirals if you are at risk of other complications. Most people who are otherwise healthy will be able to make a full recovery most of the time.',
    },
    {
      'description' : 'It is important to know an treat vitamin D deficiency because it can result in further complications such as increased risk of death from cardiovascular disease, asthma in children, cancer, or cognitive impairment in older adults.',
    },
  ];



  _SymptomPageState() {
    FirebaseDatabase.instance.reference().child('illness').once()
        .then((data) {
      //print('successful');
      //print(data);
      //print("Key: ");
      //print(data.key);
      //print("Value: ");
      //print(data.value);
      //print("Iterating the value map: ");
      var illnessTmpList = [];

      data.value.forEach((k, v) {
       // print(k);
       // print(v);
        illnessTmpList.add(k);
        resultList[k] = v;
      });
      //print("Final Symptom List: ");
      //print(illnessTmpList);
      illnessList = illnessTmpList;
      setState(() {

      });
    }).catchError((error) {
        //print('failed');
        print(error.toString());
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Select Symptoms'),


      ),
      resizeToAvoidBottomInset: false,
      body: Center(

      child: Column(

      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: RaisedButton(
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.green),
            ),
            child: Text('Refresh'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SymptomPage(title: "Symptoms Page")), //
              );
            },
          ),
        ),

        TextField(

      controller: illController,
      obscureText: false,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Symptoms',
        suffixIcon: ElevatedButton(
          onPressed: () {
            print(illController.text);
            illnessList = [];
            resultList.forEach((key, value) {
              if (value.toString().contains(illController.text)) {
                illnessList.add(key);
              }
            });
            setState(() => resultList);
            print(resultList.keys);
            print(resultList.values);
          }, child: null,
        ),
      ),
    ),



        ListView.builder(
            scrollDirection: Axis.vertical, //
            shrinkWrap: true, //
          itemCount: illnessList.length,
          itemBuilder:(BuildContext context, int index) {
            return ListTile(
              onTap: (){
                print("The item is clicked");
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  InfoPage(infoList[index])),
                );
              },

              title: Container(
            height: 40,
            color: Colors.lightBlueAccent,
            margin: EdgeInsets.only(top: 4, bottom: 4),
            child: Center(
                child: Text(
                    '${illnessList[index]}'
                )
            ),
              ),

            );
    })
        ],
    ),
    ),

    );

  }
  
}


