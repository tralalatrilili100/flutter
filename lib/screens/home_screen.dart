// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 1; // Default index for the "Beranda" screen

  final List<MenuData> menus = [
    MenuData(
        'images/learning_image.png',
        'Pembelajaran',
        'Strategi pembelajaran yang terdiri dari PBL dan PjBL',
        'pembelajaran_screen'),
    MenuData(
        'images/passing_image.png',
        'Teknik Dasar Passing',
        'Teknik dasar dalam mengoper bola dalam permainan bola basket',
        'passing_screen'),
    MenuData(
        'images/dribbling_image.png',
        'Teknik Dasar Dribbling',
        'Teknik dasar dalam menggiring bola dalam permainan bola basket',
        'dribbling_screen'),
    MenuData(
        'images/shooting_image.png',
        'Teknik Dasar Shooting',
        'Teknik dasar dalam menembak bola dalam permainan bola basket',
        'shooting_screen'),
    MenuData(
        'images/mcq_image.png',
        'Tes Pilihan Berganda',
        'Tes dalam bentuk pilihan berganda untuk memperdalam pengetahuan tentang bola basket',
        'pilber_screen'),
    MenuData(
        'images/essay_image.png',
        'Tes Esai',
        'Tes dalam bentuk esai untuk memperdalam pengetahuan tentang bola basket',
        'esai_screen'),
    MenuData('images/cv_image.png', 'Daftar Riwayat Hidup',
        'Biografi singkat dari peneliti', 'drh_screen'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Beranda',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        backgroundColor: Color(0xFF57CCE6), // Set the background color here
        iconTheme: IconThemeData(color: Colors.white),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: ListView.builder(
              itemCount: menus.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, menus[index].route);
                  },
                  child: Container(
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(255, 255, 255, 255),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 3,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    margin: EdgeInsets.only(bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Image.asset(
                            menus[index].imagePath,
                            height: 120,
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(
                                right: 10), // Adjust the value as needed
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  menus[index].title,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Colors.blueGrey[700],
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  menus[index].description,
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Color(0xFF57CCE6), // Set the background color here
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });

            // Navigate to the corresponding screen
            switch (index) {
              case 0:
                Navigator.pushNamed(context, 'pembelajaran_screen');
                break;
              case 1:
                // Do nothing as we are already on the "Beranda" screen
                break;
              case 2:
                Navigator.pushNamed(context, 'drh_screen');
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

class MenuData {
  final String imagePath;
  final String title;
  final String description;
  final String route;

  MenuData(this.imagePath, this.title, this.description, this.route);
}
