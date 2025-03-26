import 'package:fasum_app/screens/home_screen.dart';
import 'package:fasum_app/screens/sign_up_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();

  String _errorMessage= '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign In"),
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
        controller: _emailcontroller,
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
          await FirebaseAuth.instance.signInWithEmailAndPassword(email: _emailcontroller.text, password: _passwordcontroller.text);
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const HomeScreen())
          );
        } catch (error){
          setState(() {
            _errorMessage = error.toString();
          });
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(_errorMessage),
          ),
          );
        }
      }, child: const Text("Sign In")),
      const SizedBox(
        height: 32,
      ),
      TextButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> const SignUpScreen()
      )
      );
      }, child: const Text("Don't have an account? Sign Up"), 
      ),
      ],
      ),
      ),
      ),
    );
  }
}