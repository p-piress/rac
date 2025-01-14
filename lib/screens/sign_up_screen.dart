import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rac/screens/login_screen.dart';
import 'package:rac/utilities/constants.dart';
import 'package:social_login_buttons/social_login_buttons.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Email',
          style: TextStyle(color: Color(0xFFFFFFFF)),
        ),
        const SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 55.0,
          child: const TextField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.email,
                color: Colors.white,
              ),
              hintText: 'Digite seu Email',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Senha',
          style: kLabelStyle,
        ),
        const SizedBox(height: 10.0),
        Container(
          margin: const EdgeInsets.only(bottom: 50.0),
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 52.0,
          child: const TextField(
            obscureText: true,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              hintText: 'Digite sua senha',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSignUpBtn() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SocialLoginButton(
            borderRadius: 30,
            backgroundColor: Colors.white,
            text: "CADASTRAR",
            textColor: const Color(0xFF3040a3),
            buttonType: SocialLoginButtonType.generalLogin,
            onPressed: () => signInEmailPassword(),
          ),
        ],
      ),
    );
  }

  Widget _buildLoginBtn() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
        );
      },
      child: RichText(
        text: const TextSpan(
          children: [
            TextSpan(
              text: 'Já possui uma conta? ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: 'Login',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Color(0xFF5969c9),
                        Color(0xFF3040a3),
                      ]),
                ),
              ),
              SizedBox(
                height: double.infinity,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(
                    20,
                    40,
                    20,
                    10,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Image(
                        image: AssetImage(
                          'assets/logos/logo.png',
                        ),
                        width: 120,
                        height: 120,
                      ),
                      const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.0)),
                      const Text(
                        '______________  Sign Up  ______________',
                        style: TextStyle(
                          color: Color(0xffffffff),
                          fontFamily: 'OpenSans',
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      _buildEmailTF(),
                      const SizedBox(
                        height: 30.0,
                      ),
                      _buildPasswordTF(),
                      _buildSignUpBtn(),
                      _buildLoginBtn(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future signInEmailPassword() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());
      showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              content: Text('Bem vindo!'),
            );
          });
    } catch (e) {
      showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              content: Text("Email ou senha invalidos!"),
            );
          });
    }
  }
}
