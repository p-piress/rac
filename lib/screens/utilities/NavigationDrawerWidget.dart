import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rac/screens/presets_screen.dart';
import 'package:rac/screens/utilities/constants.dart';
import 'package:social_login_buttons/social_login_buttons.dart';

class NavigationDrawerWidget extends StatelessWidget {
    final padding = EdgeInsets.symmetric(horizontal: 20);
    @override
    Widget build(BuildContext context){
      final String name = 'Filipe Pires Barbosa';
      final String email = 'filipepires1000@gmail.com';
      final String imagem = 'https://thumbs.dreamstime.com/b/default-avatar-profile-icon-vector-social-media-user-portrait-176256935.jpg';
      return Drawer(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Color(0xFF5969c9),
                        Color(0xFF3040a3),
                      ]
            )
          ),
          child: ListView(
            children: <Widget>[
              //Material(
                Padding(padding: padding),
                buildHeader(imagem, name, email),
                _Btn(),
                Divider(color: Color(0xFFffffff),),
                buildMenuItem('Configurações', Icons.settings, () => selectedItem(context, 0)),
                buildMenuItem('Bluetooth', Icons.bluetooth, () => selectedItem(context, 1)),
                buildMenuItem('Presets', Icons.handyman, () => selectedItem(context, 2)),
              //),
              
            ],

          ),
        ),
               
      );
    }
    Widget buildHeader(String Imagem, String Name, String Email){
      return InkWell(
        child: Container(
          padding: padding.add(EdgeInsets.symmetric(vertical: 50)),
          child: Row(
            children: [
              CircleAvatar(radius: 45, backgroundImage: NetworkImage(Imagem)),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Name,
                    style: kLabelStyleHeader,
                  ),
                  //SizedBox(height: 4),
                  Text(
                    Email,
                    style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'OpenSans',fontSize: 11.5),
                  )
                ],
              )
            ],
          ),
        ),
      );
    }
    Widget _Btn() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SocialLoginButton(
            height: 30,
            width: 150,
            borderRadius: 20,
            backgroundColor: Colors.white,
            text: "Sign out",
            textColor: const Color(0xFF3040a3),
            buttonType: SocialLoginButtonType.generalLogin,
            onPressed: () => () {},
          ),
          Padding(padding: padding.add(const EdgeInsets.fromLTRB(0, 0, 0, 13))),
        ],
      ),
    );
  }
  Widget buildMenuItem(String text, IconData icon, VoidCallback? onCicked){
    return ListTile(
      leading: Icon(icon,color: Colors.white,),
      title: Text(text),
      hoverColor: Colors.white70,
      onTap: onCicked,
    );
  }
  void selectedItem(BuildContext context, int index){
    switch(index){
      case 2:
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => preset_screen()));
        break;
    }
  }
}