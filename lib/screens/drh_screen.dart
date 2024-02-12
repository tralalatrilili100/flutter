// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, avoid_unnecessary_containers

import 'package:basketapp/screens/home_screen.dart';
import 'package:basketapp/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DrhScreen(),
    );
  }
}

class DrhScreen extends StatefulWidget {
  @override
  _DrhScreenState createState() => _DrhScreenState();
}

class _DrhScreenState extends State<DrhScreen> {
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
          'Daftar Riwayat Hidup',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 66, 176, 201),
        iconTheme: IconThemeData(color: Colors.white),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(bottom: 20),
        child: _screens[_currentIndex],
      ),
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
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 30),
        Center(
          child: Container(
            child: CircleAvatar(
              backgroundImage: AssetImage('images/benny.jpg'),
              radius: 80,
            ),
          ),
        ),
        SizedBox(height: 20),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Benny Aprial. M. S.Pd., M.Pd.',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.grey[800],
                ),
              ),
              Text(
                'Pendidikan Olahraga',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey[800],
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Colors.grey[800],
                        size: 20,
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Medan',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[800],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 30),
                  Column(
                    children: [
                      Icon(
                        Icons.email,
                        color: Colors.grey[800],
                        size: 20,
                      ),
                      SizedBox(height: 5),
                      Text(
                        'bennyaprial.m@gmail.com',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[800],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 40),
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Benny Aprial, M.S.Pd., M.Pd., adalah seorang profesional yang berdedikasi dan berprestasi dalam bidang pendidikan olahraga. Lahir pada 25 April 1992, di Tanjung Balai, perjalanan akademis Benny mencerminkan ketertarikannya terhadap Pendidikan Olahraga. Saat ini, ia mengemban peran sebagai dosen di Sekolah Tinggi Olahraga Dan Kesehatan Bina Guna, di mana kontribusinya diakui dan dihargai. Bekerja di lingkungan akademis, Benny telah membawa pengalaman dan pengetahuannya ke dalam ruang kelas, membimbing dan menginspirasi para mahasiswa di bidang Pendidikan Jasmani Kesehatan Dan Rekreasi. Selain mengajar, ia juga terlibat aktif dalam kegiatan penelitian yang mendalam, mengeksplorasi inovasi dalam metode pengajaran olahraga. Perjalanan akademisnya dimulai di Universitas Negeri Medan, di mana ia mengejar gelar Sarjana dalam Pendidikan Jasmani Kesehatan Dan Rekreasi, lulus pada tahun 2014. Selanjutnya, ia terus meningkatkan pengetahuannya di Universitas Negeri Jakarta, memperoleh gelar Magister dalam Pendidikan Olahraga pada tahun 2018. Keahlian Benny tidak hanya terbatas pada ruang kelas, tetapi juga tercermin dalam keterlibatannya dalam pengembangan pendidikan olahraga di tingkat perguruan tinggi. Sebagai bagian dari Sekolah Tinggi Olahraga Dan Kesehatan Bina Guna, Benny Aprial menjadi salah satu pilar dalam membentuk masa depan pendidikan olahraga yang inovatif dan berkualitas.',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey[800],
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
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
