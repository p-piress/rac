import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class preset_screen extends StatefulWidget {
  @override
  _preset_ScreenState createState() => _preset_ScreenState();
}

class _preset_ScreenState extends State<preset_screen> {
  final padding = EdgeInsets.symmetric(horizontal: 60);

  @override
  Widget build(BuildContext context,) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text("Presets"),
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
            ]),
          )
        ),
      )
    );
  }
}