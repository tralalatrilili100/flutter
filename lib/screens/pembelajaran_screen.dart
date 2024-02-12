// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors, deprecated_member_use, prefer_const_constructors, prefer_final_fields, library_private_types_in_public_api, prefer_const_declarations, prefer_const_literals_to_create_immutables, avoid_print, unused_field

import 'package:flutter/material.dart';
import 'package:basketapp/screens/drh_screen.dart';
import 'package:basketapp/screens/home_screen.dart';
import 'package:basketapp/screens/welcome_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PembelajaranScreen(),
    );
  }
}

class PembelajaranScreen extends StatefulWidget {
  @override
  _PembelajaranScreenState createState() => _PembelajaranScreenState();
}

class _PembelajaranScreenState extends State<PembelajaranScreen>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
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
          'Pembelajaran Bola Basket',
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
      body: Column(
        children: [
          Image.asset(
            'images/learning_image.png', // Replace with your image asset path
            fit: BoxFit.cover,
            height: 200, // Set the desired height
          ),
          SizedBox(height: 20),
          TabBar(
            controller: _tabController,
            tabs: [
              Tab(text: 'PBL'),
              Tab(text: 'PjBL'),
            ],
            labelColor: Colors.blue[800],
            unselectedLabelColor: Colors.grey[600],
            labelStyle: TextStyle(
              fontSize: 16, // Adjust the font size as needed
              fontWeight: FontWeight.bold,
            ),
            indicatorColor: Colors.blue[400],
          ),
          SizedBox(height: 30),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                PBLScreen(),
                PjBLScreen(),
              ],
            ),
          ),
        ],
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

class PBLScreen extends StatefulWidget {
  @override
  _PBLScreenState createState() => _PBLScreenState();
}

class _PBLScreenState extends State<PBLScreen> {
  TextEditingController _questionController = TextEditingController();
  late WebViewController _webViewController;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(height: 10),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            'Selamat datang di strategi pembelajaran Problem Based Learning (PBL). PBL terdiri dari tiga tahapan: Pendahuluan, Penyajian dan Penutupan. Setiap tahapan terdiri dari uraian kegiatan pembelajaran, metode dan alat pembelajaran dan estimasi waktu',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[800],
            ),
            textAlign: TextAlign.justify,
          ),
        ),
        SizedBox(height: 25),
        Card(
          elevation: 5, // Add elevation for shadow effect
          margin: EdgeInsets.symmetric(horizontal: 30),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: ExpansionPanelList.radio(
            elevation:
                0, // Set elevation to 0 to prevent conflicts with Card's elevation
            children: [
              ExpansionPanelRadio(
                value: 0,
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return ListTile(
                    leading: Icon(Icons.inventory_outlined, size: 25),
                    title: Text(
                      'Pendahuluan',
                      style: TextStyle(
                          color: Colors.blue[800],
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  );
                },
                body: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Uraian Kegiatan Pembelajaran',
                        style: TextStyle(
                          color: Colors.blue[800],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '• Apersepsi materi pada pertemuan sebelumnya\n'
                        '• Tujuan\n'
                        '• Relevansi\n'
                        '• Deskripsi materi permainan\n',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      Text(
                        'Metode Pembelajaran, Media Pembelajaran, dan Alat',
                        style: TextStyle(
                          color: Colors.blue[800],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '• Metode: Ceramah\n'
                        '• Media: Aktivitas Peregangan dan Pemanasan\n'
                        '• Alat: Peluit, Stopwatch\n',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      Text(
                        'Estimasi Waktu',
                        style: TextStyle(
                          color: Colors.blue[800],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '15 menit',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ],
                  ),
                ),
                canTapOnHeader: true,
              ),
              ExpansionPanelRadio(
                value: 1,
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return ListTile(
                    leading: Icon(Icons.inventory_outlined, size: 25),
                    title: Text(
                      'Penyajian (Inti)',
                      style: TextStyle(
                          color: Colors.blue[800],
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  );
                },
                body: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Uraian Kegiatan Pembelajaran',
                        style: TextStyle(
                          color: Colors.blue[800],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '• Uraikan membagi kelompok dalam menyusun konsep problem sebagai berikut: Konsep Permainan berdasarkan teknik passing dan dribbling bola basket dan Konsep Permainan berdasarkan teknik shooting bola basket \n'
                        '• Contoh Peragaan Permainan yang dilakukan\n'
                        '• Latihan (Pelaksanaan) menerapkan jenis permainan menggunakan teknik bola basket sesuai hasil temuan (diskusi) kelompok masing-masing. (ini dilengkapi dengan manfaat perkembangan teknik bola basket)\n',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      Text(
                        'Metode Pembelajaran, Media Pembelajaran, dan Alat',
                        style: TextStyle(
                          color: Colors.blue[800],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '• Metode: Kelompok\n'
                        '• Media: Penerapan Permainan Bola Basket\n'
                        '• Alat: Stopwatch, Kun, Bola Besar\n',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      Text(
                        'Estimasi Waktu',
                        style: TextStyle(
                          color: Colors.blue[800],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '70 menit',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ],
                  ),
                ),
                canTapOnHeader: true,
              ),
              ExpansionPanelRadio(
                value: 2,
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return ListTile(
                    leading: Icon(Icons.inventory_outlined, size: 25),
                    title: Text(
                      'Penutup dan Tindak Lanjut',
                      style: TextStyle(
                          color: Colors.blue[800],
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  );
                },
                body: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Uraian Kegiatan Pembelajaran',
                        style: TextStyle(
                          color: Colors.blue[800],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '• Simpulan \n'
                        '• Memberikan umpan balik\n'
                        '• Menjelaskan tindak lanjut\n',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                      Text(
                        'Metode Pembelajaran, Media Pembelajaran, dan Alat',
                        style: TextStyle(
                          color: Colors.blue[800],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '• Metode: Ceramah\n'
                        '• Media: Pendinginan dan Rangkuman\n'
                        '• Alat: Peluit, Stopwatch\n',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      Text(
                        'Estimasi Waktu',
                        style: TextStyle(
                          color: Colors.blue[800],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '15 menit',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ],
                  ),
                ),
                canTapOnHeader: true,
              ),
              ExpansionPanelRadio(
                value: 3,
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return ListTile(
                    leading: Icon(Icons.inventory_outlined, size: 25),
                    title: Text(
                      'Frequently Asked Question (FAQ)',
                      style: TextStyle(
                          color: Colors.blue[800],
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  );
                },
                body: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Silahkan kirimkan pertanyaan Anda berkaitan dengan pelaksanaan PBL dengan memasukkan pertanyaan pada kolom yang tersedia di bawah.',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      SizedBox(height: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 20),
                            child: Text(
                              'Pertanyaan Anda:',
                              style: TextStyle(
                                  color: Colors.blue[800],
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            margin: EdgeInsets.only(left: 20),
                            child: TextField(
                              controller: _questionController,
                              decoration: InputDecoration(
                                hintText: 'Masukkan pertanyaan Anda...',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            margin: EdgeInsets.only(left: 20),
                            child: ElevatedButton(
                              onPressed: () {
                                try {
                                  sendEmail(_questionController.text);
                                } catch (e, stackTrace) {
                                  print('Error sending email: $e\n$stackTrace');
                                }
                              },
                              child: Text('Kirim Pertanyaan'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                canTapOnHeader: true,
              ),
              ExpansionPanelRadio(
                value: 4,
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return ListTile(
                    leading: Icon(Icons.inventory_outlined, size: 25),
                    title: Text(
                      'Video Pelaksanaan',
                      style: TextStyle(
                          color: const Color.fromRGBO(21, 101, 192, 1),
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  );
                },
                body: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Silahkan putar video di bawah ini untuk membantu Anda memahami Strategi Pembelajaran Problem Based Learning',
                        style: TextStyle(color: Colors.grey[700]),
                        textAlign: TextAlign.justify,
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 160,
                              width: 300, // Adjust the height as needed
                              child: WebView(
                                initialUrl:
                                    'https://www.youtube.com/embed/KNQ25Y6d3Xo?playsinline=1',
                                javascriptMode: JavascriptMode.unrestricted,
                                onPageFinished: (url) {
                                  _webViewController.evaluateJavascript('''
    // Hide controls except play, indicator, and progress bar
    var controls = document.querySelector(".ytp-chrome-bottom");
    if (controls != null) controls.style.display = "none";

    var topBar = document.querySelector(".ytp-chrome-top");
    if (topBar != null) topBar.style.display = "none";

    var progressBar = document.querySelector(".ytp-progress-bar-container");
    if (progressBar != null) progressBar.style.display = "block";

    var logo = document.querySelector(".ytp-watermark");
    if (logo != null) logo.style.display = "none"; // Hide YouTube logo

    var fullscreenButton = document.querySelector(".ytp-fullscreen-button");
    if (fullscreenButton != null) fullscreenButton.style.display = "none"; // Hide fullscreen button
  ''');
                                },
                                onWebViewCreated: (controller) {
                                  _webViewController = controller;
                                },
                              ),
                            ),
                            SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: () {
                                // Open video in fullscreen mode
                                launchYoutubeVideoInApp();
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                  Color.fromRGBO(21, 101, 192, 1),
                                ),
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                              ),
                              child: Text('Buka Fullscreen Video'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                canTapOnHeader: true,
              ),
            ],
            dividerColor: Colors.grey,
            expansionCallback: (int panelIndex, bool isExpanded) {
              setState(() {});
            },
          ),
        ),
      ],
    );
  }

  void sendEmail(String question) async {
    final gmailUri = Uri(
      scheme: 'mailto',
      path: 'bennyaprial.m@gmail.com',
      queryParameters: {
        'subject': 'Pertanyaan tentang PBL',
        'body': 'Pertanyaan: $question',
      },
    );

    try {
      await launch(gmailUri.toString());
    } catch (e) {
      print('Error launching email: $e');
    }
  }

  void launchYoutubeVideoInApp() async {
    final videoId = 'KNQ25Y6d3Xo';
    final youtubeUrl = 'https://www.youtube.com/watch?v=$videoId&t=0s&fs=1';

    try {
      await launch(youtubeUrl, forceSafariVC: false);
    } catch (e) {
      print('Error launching YouTube: $e');
    }
  }
}

class PjBLScreen extends StatefulWidget {
  @override
  _PjBLScreenState createState() => _PjBLScreenState();
}

class _PjBLScreenState extends State<PjBLScreen> {
  TextEditingController _questionController2 = TextEditingController();
  late WebViewController _webViewController;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(height: 10),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            'Selamat datang di strategi pembelajaran Project Based Learning (PjBL). PjBL terdiri dari tiga tahapan di bawah ini. Setiap tahapan terdiri dari uraian kegiatan pembelajaran, metode dan alat pembelajaran dan estimasi waktu',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[800],
            ),
            textAlign: TextAlign.justify,
          ),
        ),
        SizedBox(height: 25),
        Card(
          elevation: 5, // Add elevation for shadow effect
          margin: EdgeInsets.symmetric(horizontal: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: ExpansionPanelList.radio(
            elevation:
                0, // Set elevation to 0 to prevent conflicts with Card's elevation
            children: [
              ExpansionPanelRadio(
                value: 0,
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return ListTile(
                    leading: Icon(Icons.inventory_outlined, size: 25),
                    title: Text(
                      'Pendahuluan',
                      style: TextStyle(
                          color: Colors.blue[800],
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  );
                },
                body: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Uraian Kegiatan Pembelajaran',
                        style: TextStyle(
                          color: Colors.blue[800],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '• Apersepsi materi (pertemuan) yang lalu terkait Permainan Bola Basket. \n'
                        '• Tujuan\n'
                        '• Relevansi\n'
                        '• Deskripsi materi permainan\n',
                        style: TextStyle(color: Colors.grey[700]),
                        textAlign: TextAlign.justify,
                      ),
                      Text(
                        'Metode Pembelajaran, Media Pembelajaran, dan Alat',
                        style: TextStyle(
                          color: Colors.blue[800],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '• Metode: Ceramah\n'
                        '• Media: Aktivitas Peregangan dan Pemanasan\n'
                        '• Alat: Peluit, Stopwatch\n',
                        style: TextStyle(color: Colors.grey[700]),
                        textAlign: TextAlign.justify,
                      ),
                      Text(
                        'Estimasi Waktu',
                        style: TextStyle(
                          color: Colors.blue[800],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '15 menit',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ],
                  ),
                ),
                canTapOnHeader: true,
              ),
              ExpansionPanelRadio(
                value: 1,
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return ListTile(
                    leading: Icon(Icons.inventory_outlined, size: 25),
                    title: Text(
                      'Penyajian (Inti)',
                      style: TextStyle(
                          color: Colors.blue[800],
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  );
                },
                body: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Uraian Kegiatan Pembelajaran',
                        style: TextStyle(
                          color: Colors.blue[800],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '• Uraikan Membagi Kelompok \n'
                        '• Contoh Peragaan Permainan yang dilakukan\n'
                        '• Latihan (Pelaksanaan) menerapkan jenis permainan menggunakan bola basket sesuai hasil temuan (diskusi) kelompok masing-masing. (ini dilengkapi dengan manfaat perkembangan teknik bola basket)\n',
                        style: TextStyle(color: Colors.grey[700]),
                        textAlign: TextAlign.justify,
                      ),
                      Text(
                        'Metode Pembelajaran, Media Pembelajaran, dan Alat',
                        style: TextStyle(
                          color: Colors.blue[800],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '• Metode: Kelompok\n'
                        '• Media: Penerapan Permainan Bola Basket\n'
                        '• Alat: Stopwatch, Kun, Bola Besar\n',
                        style: TextStyle(color: Colors.grey[700]),
                        textAlign: TextAlign.justify,
                      ),
                      Text(
                        'Estimasi Waktu',
                        style: TextStyle(
                          color: Colors.blue[800],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '70 menit',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ],
                  ),
                ),
                canTapOnHeader: true,
              ),
              ExpansionPanelRadio(
                value: 2,
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return ListTile(
                    leading: Icon(Icons.inventory_outlined, size: 25),
                    title: Text(
                      'Penutup dan Tindak Lanjut',
                      style: TextStyle(
                          color: Colors.blue[800],
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  );
                },
                body: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Uraian Kegiatan Pembelajaran',
                        style: TextStyle(
                          color: Colors.blue[800],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '• Simpulan \n'
                        '• Memberikan umpan balik\n'
                        '• Menjelaskan tindak lanjut\n',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      Text(
                        'Metode Pembelajaran, Media Pembelajaran, dan Alat',
                        style: TextStyle(
                          color: Colors.blue[800],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '• Metode: Ceramah\n'
                        '• Media: Pendinginan dan Rangkuman\n'
                        '• Alat: Peluit, Stopwatch\n',
                        style: TextStyle(color: Colors.grey[700]),
                        textAlign: TextAlign.justify,
                      ),
                      Text(
                        'Estimasi Waktu',
                        style: TextStyle(
                          color: Colors.blue[800],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '15 menit',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
                canTapOnHeader: true,
              ),
              ExpansionPanelRadio(
                value: 3,
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return ListTile(
                    leading: Icon(Icons.inventory_outlined, size: 25),
                    title: Text(
                      'Frequently Asked Question (FAQ)',
                      style: TextStyle(
                          color: Colors.blue[800],
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  );
                },
                body: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Silahkan kirimkan pertanyaan Anda berkaitan dengan pelaksanaan PjBL dengan memasukkan pertanyaan pada kolom yang tersedia di bawah.',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      SizedBox(height: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 20),
                            child: Text(
                              'Pertanyaan Anda:',
                              style: TextStyle(
                                  color: Colors.blue[800],
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            margin: EdgeInsets.only(left: 20),
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
                            margin: EdgeInsets.only(left: 20),
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
                    ],
                  ),
                ),
                canTapOnHeader: true,
              ),
              ExpansionPanelRadio(
                value: 4,
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return ListTile(
                    leading: Icon(Icons.inventory_outlined, size: 25),
                    title: Text(
                      'Video Pelaksanaan',
                      style: TextStyle(
                          color: Colors.blue[800],
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  );
                },
                body: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Silahkan putar video di bawah ini untuk membantu Anda memahami Strategi Pembelajaran Project Based Learning',
                        style: TextStyle(color: Colors.grey[700]),
                        textAlign: TextAlign.justify,
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 170,
                              width: 300, // Adjust the height as needed
                              child: WebView(
                                initialUrl:
                                    'https://www.youtube.com/embed/mzNAnBW1x50?playsinline=1',
                                javascriptMode: JavascriptMode.unrestricted,
                                onPageFinished: (url) {
                                  _webViewController.evaluateJavascript('''
    // Hide controls except play, indicator, and progress bar
    var controls = document.querySelector(".ytp-chrome-bottom");
    if (controls != null) controls.style.display = "none";

    var topBar = document.querySelector(".ytp-chrome-top");
    if (topBar != null) topBar.style.display = "none";

    var progressBar = document.querySelector(".ytp-progress-bar-container");
    if (progressBar != null) progressBar.style.display = "block";

    var logo = document.querySelector(".ytp-watermark");
    if (logo != null) logo.style.display = "none"; // Hide YouTube logo

    var fullscreenButton = document.querySelector(".ytp-fullscreen-button");
    if (fullscreenButton != null) fullscreenButton.style.display = "none"; // Hide fullscreen button
  ''');
                                },
                                onWebViewCreated: (controller) {
                                  _webViewController = controller;
                                },
                              ),
                            ),
                            SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: () {
                                // Open video in fullscreen mode
                                launchYoutubeVideoInApp();
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                  Color.fromRGBO(21, 101, 192, 1),
                                ),
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                              ),
                              child: Text('Buka Fullscreen Video'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                canTapOnHeader: true,
              ),
            ],
            dividerColor: Colors.grey,
            expansionCallback: (int panelIndex, bool isExpanded) {
              setState(() {});
            },
          ),
        ),
      ],
    );
  }

  void launchYoutubeVideoInApp() async {
    final videoId = 'mzNAnBW1x50';
    final youtubeUrl = 'https://www.youtube.com/watch?v=$videoId&t=0s&fs=1';

    try {
      await launch(youtubeUrl, forceSafariVC: false);
    } catch (e) {
      print('Error launching YouTube: $e');
    }
  }

  void sendEmail(String question) async {
    final gmailUri = Uri(
      scheme: 'mailto',
      path: 'bennyaprial.m@gmail.com',
      queryParameters: {
        'subject': 'Pertanyaan tentang PBL',
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
