import 'package:flutter/material.dart';
import 'package:practice_project/main.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Dashboard",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("This is snackbar"),
                    duration: Duration(milliseconds: 1500),
                  ),
                );
              },
              icon: const Icon(Icons.person))
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.white,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      "Jose Vener Rafael",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                     Text(
                      "rafaeljosevener@gmail.com",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              title: const Text("Home"),
              leading: const Icon(Icons.home),
              onTap:() {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("This is Home"),
                    duration: Duration(milliseconds: 1500),
                  ),
                );
                Navigator.pop(context);
              },
            ),
             ListTile(
              title: const Text("Log Out"),
              leading: const Icon(Icons.home),
              onTap:() {
                Navigator.pop(context);
                Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => const HomePage())
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20,),
            const Text("This is dashboard page"),
            TextButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("You've clicked me!"),
                    duration: Duration(milliseconds: 500),
                  )
                );
              },
              child: const Text("Click Me"),
            ),
          ],
        ),
      ),
    );
  }
}
