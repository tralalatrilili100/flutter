// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, avoid_print, deprecated_member_use

import 'package:basketapp/screens/drh_screen.dart';
import 'package:basketapp/screens/home_screen.dart';
import 'package:basketapp/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: EsaiScreen(),
    );
  }
}

class EsaiScreen extends StatefulWidget {
  @override
  _EsaiScreenState createState() => _EsaiScreenState();
}

class _EsaiScreenState extends State<EsaiScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    PembelajaranContentScreen('Pembelajaran Screen Content'),
    BerandaContentScreen('Beranda Screen Content'),
    BioContentScreen('Bio Screen Content'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tes Esai',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        backgroundColor:
            Color.fromARGB(255, 66, 176, 201), // Set the background color here
        iconTheme: IconThemeData(color: Colors.white),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
          ),
        ),
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: Container(
        color: Color.fromARGB(255, 66, 176, 201),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });

            // Navigate to the corresponding screen
            switch (index) {
              case 0:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WelcomeScreen()),
                );
                break;
              case 1:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
                break;
              case 2:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DrhScreen()),
                );
                break;
            }
          },
          backgroundColor: Colors.transparent,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          selectedIconTheme: IconThemeData(
            color: Colors.white,
          ),
          unselectedIconTheme: IconThemeData(
            color: Colors.white.withOpacity(0.6),
          ),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white.withOpacity(0.6),
          selectedLabelStyle: TextStyle(
            color: Colors.white,
          ),
          unselectedLabelStyle: TextStyle(
            color: Colors.white.withOpacity(0.6),
          ),
          selectedFontSize: 12,
          unselectedFontSize: 12,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: 'Aplikasi',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Beranda',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Bio',
            ),
          ],
        ),
      ),
    );
  }
}

class PembelajaranContentScreen extends StatelessWidget {
  final String content;

  PembelajaranContentScreen(this.content);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 50),
        Text(
          'Tes Esai',
          style: TextStyle(
              fontSize: 30,
              color: Colors.blueGrey[800],
              fontWeight: FontWeight.bold),
        ),
        Text(
          'Permainan Bola Basket',
          style: TextStyle(
              fontSize: 20,
              color: Colors.blueGrey[800],
              fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        Container(
          margin: EdgeInsets.only(left: 50, right: 50),
          child: Text(
            'Silahkan ikuti tes esai yang tersedia untuk menambah wawasan Anda mengenai teknik dalam permainan bola basket',
            style: TextStyle(
              fontSize: 15,
              color: Colors.blueGrey[800],
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Image.asset(
          'images/essay_image.png',
          height: 200,
          fit: BoxFit.cover,
        ),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            width: 200, // Adjust the width as needed
            child: ElevatedButton(
              onPressed: () async {
                const url = 'https://bit.ly/materibola_basket';
                await _launchURL(url);
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(
                    vertical: 10), // Adjust the vertical padding here
                backgroundColor:
                    Color.fromRGBO(21, 101, 192, 1), // Custom color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(30),
                    right: Radius.circular(30),
                  ),
                ),
              ),
              child: Text(
                'Tes Esai',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

Future<void> _launchURL(String url) async {
  try {
    await launcher.launch(url);
  } catch (e) {
    print('Error launching URL: $e');
  }
}

class BerandaContentScreen extends StatelessWidget {
  final String content;

  BerandaContentScreen(this.content);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(content),
    );
  }
}

class BioContentScreen extends StatelessWidget {
  final String content;

  BioContentScreen(this.content);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(content),
    );
  }
}
