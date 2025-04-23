import 'package:fasum_app/screens/home_screen.dart';
import 'package:fasum_app/screens/sign_up_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();

  String _errorMessage= '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(child: Column(children: [const SizedBox(height: 32,),
      TextField(
        controller: _emailcontroller,
        decoration: const InputDecoration(
          labelText: 'Email',border: OutlineInputBorder()
        ),
       
        
      ),
       const SizedBox(
          height: 16,
        ),
        TextField(
        controller: _passwordcontroller,
        decoration: const InputDecoration(
          labelText: 'Password',border: OutlineInputBorder()
        ),
        obscureText: true,
      ),
      const SizedBox(
        height: 16,
      ),
      ElevatedButton(onPressed: () async{
        try{
          await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _emailcontroller.text, password: _passwordcontroller.text);
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const HomeScreen())
          ); } catch (e){
 setState(() {
                    _errorMessage = e.toString();
                  });
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(_errorMessage)));
          }
        
      }, child: const Text("Sign Up")),
      const SizedBox(
        height: 32,
      ),
    
      ],
      ),
      ),
      ),
    );
  }
}