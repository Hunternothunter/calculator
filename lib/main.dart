import 'package:flutter/material.dart';
import 'package:practice_project/pages/dashboard.dart';
import 'package:practice_project/pages/calculator.dart';
// import 'package:firebase_auth/firebase_auth.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: const Calculator(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final TextEditingController _username;
  late final TextEditingController _password;

  final String userUsername = "admin123";
  final String userPassword = "admin123";

  @override
  void initState() {
    _username = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _username.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Login",
          style: TextStyle(color: Colors.white,),
        ),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Card(
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          children: [
                            TextField(
                              controller: _username,
                              decoration: const InputDecoration(
                                hintText: 'Username',
                              ),
                            ),
                            TextField(
                              controller: _password,
                              decoration: const InputDecoration(
                                hintText: 'Password',
                              ),
                              obscureText: true,
                              autocorrect: false,
                              enableSuggestions: false,
                            ),
                            const SizedBox(height: 20.0,),
                            TextButton(
                                onPressed: () async {
                                  final username = _username.text;
                                  final password = _password.text;

                                  // final userCredential = await FirebaseAuth.instance.createUserWithusernameAndPassword(
                                  //   username: username,
                                  //   password: password
                                  // );
                                  if(username == userUsername && password == userPassword){
                                      Navigator.pushReplacement(
                                        context, 
                                        MaterialPageRoute(builder: (context) => const Dashboard())
                                      );
                                    }
                                },
                                child: const Text("Login",)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
