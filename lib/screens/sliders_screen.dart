import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rac/screens/utilities/NavigationDrawerWidget.dart';
import 'package:rac/screens/utilities/constants.dart';
//import 'package:splashscreen/splashscreen.dart';

class sliders_Screen extends StatefulWidget {
  @override
  _sliders_ScreenState createState() => _sliders_ScreenState();
}

class _sliders_ScreenState extends State<sliders_Screen> {
  final padding = EdgeInsets.symmetric(horizontal: 60);

  double value1 = 50;
  double value2 = 50;
  double value3 = 50;
  double value4 = 50;
  double value5 = 50;
  double value6 = 50;

  Widget _Sliders()
  {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(padding: padding),
        const Text(
          'Motor 1',
          style: kLabelStyleDark,
        ),
        Slider(
        activeColor: Color(0xFF5969c9),
        value: value1,
        onChanged: (newRating){
          setState(() => value1 = newRating );
        },
        max: 100,
      ),
      const Text(
          'Motor 2',
          style: kLabelStyleDark,
        ),
      Slider(
        activeColor: Color(0xFF5969c9),
        value: value2,
        onChanged: (newRating){
          setState(() => value2 = newRating );
        },
        max: 100,
      ),
      const Text(
          'Motor 3',
          style: kLabelStyleDark,
        ),
      Slider(
        activeColor: Color(0xFF5969c9),
        value: value3,
        onChanged: (newRating){
          setState(() => value3 = newRating );
        },
        max: 100,
      ),
      const Text(
          'Motor 4',
          style: kLabelStyleDark,
        ),
      Slider(
        activeColor: Color(0xFF5969c9),
        value: value4,
        onChanged: (newRating){
          setState(() => value4 = newRating );
        },
        max: 100,
      ),
      const Text(
          'Motor 5',
          style: kLabelStyleDark,
        ),
      Slider(
        activeColor: Color(0xFF5969c9),
        value: value5,
        onChanged: (newRating){
          setState(() => value5 = newRating );
        },
        max: 100,
      ),
      const Text(
          'Motor 6',
          style: kLabelStyleDark,
        ),
      Slider(
        activeColor: Color(0xFF5969c9),
        value: value6,
        onChanged: (newRating){
          setState(() => value6 = newRating );
        },
        max: 100,
      ),
      ],
      
    );
  }

  @override
  Widget build(BuildContext context,) {
    
    return Scaffold(
      endDrawer: NavigationDrawerWidget(),
      appBar: AppBar(
        title: const Text("RAC"),
        centerTitle: true ,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        
                        Color(0xFF3040a3),
                        Color(0xFF5969c9),
                      ]
            )
          ),
        ),
      ),
      floatingActionButton:FloatingActionButton.extended(  
        onPressed:  () => {}, 
        backgroundColor: Color(0xFF3040a3),  
        icon: Icon(Icons.save),  
        label: Text("Save"),),  
      backgroundColor: Colors.white,
        body: Container(
          height: double.infinity,
          width: double.infinity,
        //  decoration: const BoxDecoration(
        //    gradient: LinearGradient(
        //      begin: Alignment.topRight,
        //              end: Alignment.bottomLeft,
        //              colors: [
        //                Color(0xFF3040a3),
        //                Color(0xFF5969c9),
        //                
        //              ]
        //    )
        //  ),

          child: SizedBox(
            height: double.infinity,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(
                    20,
                    100,
                    20,
                    10,
                  ),
            child: Column(children: <Widget> [
              _Sliders(),
              //IconButton(),  
            ]),
          )
        ),
      )
    );
  }
}