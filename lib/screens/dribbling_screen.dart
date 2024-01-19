// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, deprecated_member_use, prefer_const_constructors, prefer_final_fields, library_private_types_in_public_api, prefer_const_literals_to_create_immutables, duplicate_ignore, unused_field

import 'package:flutter/material.dart';
import 'package:basketapp/screens/drh_screen.dart';
import 'package:basketapp/screens/home_screen.dart';
import 'package:basketapp/screens/welcome_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DribblingScreen(),
    );
  }
}

class DribblingScreen extends StatefulWidget {
  @override
  _DribblingScreenState createState() => _DribblingScreenState();
}

class _DribblingScreenState extends State<DribblingScreen>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Teknik Dasar Dribbling',
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          children: [
            SizedBox(height: 30),
            Image.asset(
              'images/dribbling_image.png',
              fit: BoxFit.cover,
              height: 200,
            ),
            SizedBox(height: 30),
            TabBar(
              controller: _tabController,
              isScrollable: false, // Tabs won't scroll horizontally
              tabs: [
                CustomTabWithIcon(
                    icon: Icons.category, text: 'Tahapan', width: 80),
                CustomTabWithIcon(
                    icon: Icons.video_library, text: 'Video', width: 80),
                CustomTabWithIcon(
                    icon: Icons.build, text: 'Biomekanika', width: 80),
                CustomTabWithIcon(icon: Icons.help, text: 'FAQ', width: 80),
              ],
              labelPadding: EdgeInsets.symmetric(horizontal: 1),
              indicatorPadding: EdgeInsets.symmetric(horizontal: 1),
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorWeight: 5,
              labelColor: Colors.blue,
              unselectedLabelColor: Colors.grey[600],
              labelStyle: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  PBLScreen(),
                  PjBLScreen(),
                  AdditionalScreen(),
                  AdditionalScreen2(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Color(0xFF57CCE6),
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

class CustomTabWithIcon extends StatelessWidget implements PreferredSizeWidget {
  final IconData icon;
  final String text;
  final double width;

  const CustomTabWithIcon({
    required this.icon,
    required this.text,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 24), // Adjust the size as needed
          SizedBox(height: 4), // Adjust the spacing between icon and text
          Tab(text: text),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60); // Set the preferred height
}

class PBLScreen extends StatefulWidget {
  @override
  _PBLScreenState createState() => _PBLScreenState();
}

class _PBLScreenState extends State<PBLScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(height: 30),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildNumberedText(
                  'Sikap kaki kuda-kuda dengan lutut sedikit ditekuk.'),
              buildNumberedText(
                  'Titik berat badan diantara kedua kaki, badan sedikit condong ke depan.'),
              buildNumberedText(
                  'Gerakkan tangan keatas dan kebawah dengan sumbu gerak disiku, saat bola hasil pantulan keatas telapak tangan mengikuti seolah-olah melekat pada telapak tangan.'),
              buildNumberedText(
                  'Pandangan tidak melihat, melainkan melihat situasi sekitar.'),
              buildNumberedText(
                  'Apabila melakukan gerak maju atau mundur, posisi kaki benar-benar berhenti terlebih dahulu dengan cara seluruh telapak kaki menyentuh lantai, posisi lutut ditekuk dalam-dalam.'),
              buildNumberedText(
                  'Bola selalu dalam lindungan, dengan cara menutup badan atau menggiring dengan tangan yang jauh dari lawan.'),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildNumberedText(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '•', // Bullet point character
            style: TextStyle(
              color: Colors.grey[800],
              fontSize: 14,
            ),
          ),
          SizedBox(width: 8), // Adjust the spacing between bullet and text
          Expanded(
            child: Text(
              text,
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[800],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AdditionalScreen extends StatefulWidget {
  @override
  _AdditionalScreenState createState() => _AdditionalScreenState();
}

class _AdditionalScreenState extends State<AdditionalScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(height: 10),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              Image.asset(
                'images/dribbling01.jpg', // Replace with your image path
                height: 200,
                width: 250,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 15),
              Text(
                'Pada gambar diatas menjelaskan bahwa telah berlaku Hukum Newton III, pelaksanaan gerak dribbling kedua kaki dan togok tubuh membentuk sudut 900 dan lengan kiri dan kanan menekuk membentuk sudut 1200. Kenapa harus mempunya sudut-sudut diatas karena dapat diketahui bahwa hasil analisis gerak kinetik yang ditinjau dari aspek biomekanik yakni sudut lengan, sudut tubuh dan sudut kaki secara langsung menyiapkan posisi kuda-kuda kaki dan memposisikan lengan tangan untuk menstabilkan ruang pergelangan tangan dan jari-jari agar tetap rileks, saat melakukan fase awalan adanya fleksi ekstrimitas atas dilakukan agar beban pada sendi mengurang dengan cara memperpendek lengan torsi. Sangat penting melakukan fleksi bagian ekstrimitas atas guna meningkatkan pembebanan kaki. Beban lebih ditingkatkan pada tubuh bagian bawah untuk mendekati pusat gravitasi. Posisi ini akan berguna untuk persiapan transfer gaya yang bekerja tetap linear dan vertikal sehingga gerakan menjadi optimal dan diterima dibagian fase gerakan selanjutnya.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[800],
                ),
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
        SizedBox(height: 25),
      ],
    );
  }
}

class PjBLScreen extends StatefulWidget {
  @override
  _PjBLScreenState createState() => _PjBLScreenState();
}

class _PjBLScreenState extends State<PjBLScreen> {
  YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: 'af06KUNy80M', // Replace with your video ID
    flags: YoutubePlayerFlags(
      autoPlay: false,
      mute: false,
      forceHD: false,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(height: 10),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              // Content for the second expansion tile
              SizedBox(height: 40),
              Text(
                'Silahkan putar video di bawah ini membantu Anda memahami praktek teknik dasar dribbling dalam permainan bola basket',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[800],
                ),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: SizedBox(
                  width: 300,
                  child: YoutubePlayer(
                    controller: YoutubePlayerController(
                      initialVideoId:
                          'af06KUNy80M', // Replace with your video ID
                      flags: YoutubePlayerFlags(
                        autoPlay: false,
                        mute: false,
                      ),
                    ),
                    showVideoProgressIndicator: true,
                    progressIndicatorColor: Colors.blueAccent,
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class AdditionalScreen2 extends StatefulWidget {
  @override
  _AdditionalScreenState2 createState() => _AdditionalScreenState2();
}

class _AdditionalScreenState2 extends State<AdditionalScreen2> {
  TextEditingController _questionController2 = TextEditingController();

  @override
  void dispose() {
    _questionController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        SizedBox(height: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Silahkan kirimkan pertanyaan Anda berkaitan dengan teknik dribbling dengan memasukkan pertanyaan pada kolom yang tersedia di bawah.',
                style: TextStyle(color: Colors.grey[700]),
                textAlign: TextAlign.justify,
              ),
            ),
            SizedBox(height: 30),
            Container(
              margin: EdgeInsets.only(left: 20),
              child: Text(
                'Pertanyaan Anda:',
                style: TextStyle(
                    color: Colors.blue[600], fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: _questionController2,
                decoration: InputDecoration(
                  hintText: 'Masukkan pertanyaan Anda...',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton(
                onPressed: () {
                  try {
                    sendEmail(_questionController2.text);
                  } catch (e, stackTrace) {
                    print('Error sending email: $e\n$stackTrace');
                  }
                },
                child: Text('Kirim Pertanyaan'),
              ),
            ),
          ],
        ),
        SizedBox(height: 25),
      ],
    );
  }

  void sendEmail(String question) async {
    final gmailUri = Uri(
      scheme: 'mailto',
      path: 'bennyaprial.m@gmail.com',
      queryParameters: {
        'subject': 'Pertanyaan tentang Teknik Driblling',
        'body': 'Pertanyaan: $question',
      },
    );

    try {
      await launch(gmailUri.toString());
    } catch (e) {
      print('Error launching email: $e');
    }
  }
}

class PembelajaranContentScreen extends StatelessWidget {
  final String content;

  PembelajaranContentScreen(this.content);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(content),
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
