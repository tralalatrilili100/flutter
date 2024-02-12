// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, deprecated_member_use, prefer_const_constructors, prefer_final_fields, library_private_types_in_public_api, prefer_const_literals_to_create_immutables, duplicate_ignore, unused_field

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
      home: PassingScreen(), // Changed to PassingScreen
    );
  }
}

class PassingScreen extends StatefulWidget {
  @override
  _PassingScreenState createState() => _PassingScreenState();
}

class _PassingScreenState extends State<PassingScreen>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
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
          'Teknik Dasar Passing',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 66, 176,
            201), // Set the background color here color: Color(0xFF57CCE6)
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
            'images/passing_image.png',
            fit: BoxFit.cover,
            height: 200,
          ),
          SizedBox(height: 30),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 0.1),
            child: TabBar(
              controller: _tabController,
              isScrollable: false, // Tabs won't scroll horizontally
              tabs: [
                CustomTabWithIcon(
                    icon: Icons.sports_basketball,
                    text: 'Chest Pass',
                    width: 100),
                CustomTabWithIcon(
                    icon: Icons.sports_basketball,
                    text: 'Bounce Pass',
                    width: 100),
                CustomTabWithIcon(
                    icon: Icons.sports_basketball,
                    text: 'Overhead Pass',
                    width: 120),
              ],
              labelPadding: EdgeInsets.symmetric(horizontal: 1),
              indicatorPadding: EdgeInsets.symmetric(horizontal: 1),
              indicatorWeight: 5,
              labelColor: Colors.blue[800],
              unselectedLabelColor: Colors.grey[600],
              labelStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
              indicatorColor: Colors.blue[400],
            ),
          ),
          SizedBox(height: 30),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                PBLScreen(),
                PjBLScreen(),
                AdditionalScreen(),
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
            'Chest Pass merupakan salah satu dari jenis passing dalam permainan bola basket. Berikut adalah informasi terkait chest pass yang terdiri dari tahapan, analisis biomekanika dan video praktek chest pass:',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[800],
            ),
            textAlign: TextAlign.justify,
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 30),
          child: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: Colors.white, // Set the background color here
            ),
            child: ExpansionTile(
              leading: Icon(Icons.assignment),
              title: Text(
                'Tahapan',
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.blue[800],
                    fontWeight: FontWeight.bold),
              ),
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    // Content for the first expansion tile
                    '1) Bola dipegang menggunakan teknik memegang bola. \n'
                    '2) Siku ditekuk di samping badan sehingga bola medekati dada. \n'
                    '3) Posisi kaki dapat sejajar atau salah satu kaki terkuat di depan. \n'
                    '4) Tarik bola mendekati dada saat akan mendorong bola kedepan dengan dua tangan\n'
                    '5) Tolak/dorong bola kedepan hingga tangan lurus, saat tangan sudah benar-benar lurus lecutkan bola sehingga bola terlepas dari tangan dan tangan menghadap ke bawah\n'
                    '6) Bersamaan dengan mendorong bola langkahkan kaki terkuat kedepan untuk menambah daya dorong tangan dan pindahkan berat badan kedepan.\n'
                    '7) Arah lemparan setinggi dada penerima, pandangan mata fokus pada penerima bola.\n',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[800],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 30),
          child: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: Colors.white, // Set the background color here
            ),
            child: ExpansionTile(
              leading: Icon(Icons.video_label_outlined),
              title: Text(
                'Video Pelaksanaan',
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.blue[800],
                    fontWeight: FontWeight.bold),
              ),
              children: [
                //  Content for the second expansion tile
                SizedBox(height: 10),
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: 20), // Adjust the horizontal margin as needed
                  child: Text(
                    'Silahkan putar video di bawah ini untuk membantu Anda memahami praktek chest pass dalam permainan bola basket.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[800],
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: SizedBox(
                    height: 160,
                    width: 300,
                    child: WebView(
                      initialUrl:
                          'https://www.youtube.com/embed/wxKr_O92wi4?playsinline=1',
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
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    // Open video in fullscreen mode
                    launchYoutubeVideoInApp();
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromRGBO(21, 101, 192, 1),
                    ),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                  ),
                  child: Text('Buka Fullscreen Video'),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 30),
          child: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: Colors.white, // Set the background color here
            ),
            child: ExpansionTile(
              leading: Icon(Icons.analytics_rounded),
              title: Text(
                'Analisis Biomekanika',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.blue[800],
                  fontWeight: FontWeight.bold,
                ),
              ),
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      // Content for the second expansion tile
                      Image.asset(
                        'images/chestpass01.jpg', // Replace with your image path
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                      Text(
                        'Pada gambar diatas menjelaskan bahwa telah berlaku Hukum Newton I, pelaksanaan fase awalan gerak passing overhead pass lengan membentuk sudut 900 dan kaki menekuk membentuk sudut 1270, pada posisi tersebut melakukan fase awalan untuk melakukan persiapan gerakan selanjutnya. Kenapa harus mempunya sudut-sudut diatas karena dapat diketahui bahwa hasil analisis gerak kinetik yang ditinjau dari aspek biomekanik yakni sudut lengan, sudut tubuh dan sudut kaki secara langsung menyiapkan posisi kuda-kuda kaki dan memposisikan lengan tangan untuk menstabilkan ruang pergelangan tangan dan jari-jari agar tetap rileks, saat melakukan fase awalan adanya fleksi ekstrimitas atas dilakukan agar beban pada sendi mengurang dengan cara memperpendek lengan torsi. Sangat penting melakukan fleksi bagian ekstrimitas atas guna meningkatkan pembebanan kaki. Beban lebih ditingkatkan pada tubuh bagian bawah untuk mendekati pusat gravitasi. Posisi ini akan berguna untuk persiapan transfer gaya yang bekerja tetap linear dan vertikal sehingga gerakan menjadi optimal dan diterima dibagian fase gerakan selanjutnya.',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[800],
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      Image.asset(
                        'images/chestpass02.jpg', // Replace with your image path
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                      Text(
                        'Pada gambar diatas menjelaskan bahwa pelaksanaan fase selanjutnya gerak passing chest pass batang tubuh flexi membentuk besaran sudut 1750, dan kaki tumpuan menekuk membentuk sudut 1370, dan kaki belakang membentuk sudut 1220, pada posisi tersebut melakukan fase awalan untuk melakukan persiapan gerakan follow throught. Pada fase pelaksanaan terdapat gaya memproduksi gerakan dengan sama yakni, bola di tempatkan didepan tubuh dengan kedua tangan, bagian tubuh ekstrimitas atas dan lengan mengarah ke atas dan kedepan hinga mencapai posisi vertikal.',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[800],
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      Image.asset(
                        'images/chestpass03.jpg', // Replace with your image path
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                      Text(
                        'Pada gambar diatas menjelaskan bahwa telah berlaku Hukum Newton III, pelaksanaan fase awalan gerak passing chest pass pergelangan tangan membentuk sudut 900 untuk gerakan Follow Through dan kaki tumpu menekuk membentuk sudut 1360 dan kaki belakang membentuk sudut 1140, pada posisi tersebut melakukan fase awalan untuk melakukan persiapan gerakan selanjutnya. Pada saat rilis fase follow through juga melakukannya dengan gerakan yang tidak jauh berbeda yakni lengan, lutut kaki dan ekstrimitas atas sepenuhnya ekstensi yang menandakan sudah menyodorkan sebuah kontribusi penuh terhadap pelepasan bola, itulah kenapa harus membentuk sudut-sudut diatas karena Fase follow through pada dasarnya ialah merentangkan lengan dan pergelangan tangan sepenuhnya untuk menciptakan trajectory of the ball yang ideal.',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[800],
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 30),
          child: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: Colors.white, // Set the background color here
            ),
            child: ExpansionTile(
              leading: Icon(Icons.question_answer),
              title: Text(
                'Frequently Asked Question',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.blue[800],
                  fontWeight: FontWeight.bold,
                ),
              ),
              children: [
                //  Content for the second expansion tile
                SizedBox(height: 30),
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: 20), // Adjust the horizontal margin as needed
                  child: Text(
                    'Silahkan kirimkan pertanyaan Anda berkaitan dengan chest pass dengan memasukkan pertanyaan pada kolom yang tersedia di bawah.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[800],
                    ),
                    textAlign: TextAlign.justify,
                  ),
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
                            color: Colors.blue[600],
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
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: ElevatedButton(
                        onPressed: () {
                          try {
                            sendEmail(_questionController2.text);
                          } catch (e, stackTrace) {
                            print('Error sending email: $e\n$stackTrace');
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromRGBO(
                              21, 101, 192, 1), // Background color
                          onPrimary: Colors.white, // Text color
                        ),
                        child: Text('Kirim Pertanyaan'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void launchYoutubeVideoInApp() async {
    const videoId = 'wxKr_O92wi4';
    const youtubeUrl = 'https://www.youtube.com/watch?v=$videoId&t=0s&fs=1';

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
            'Bounce Pass merupakan salah satu dari jenis passing dalam permainan bola basket. Berikut adalah informasi terkait bounce pass yang terdiri dari tahapan, analisis biomekanika dan video praktek bounce pass:',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[800],
            ),
            textAlign: TextAlign.justify,
          ),
        ),
        SizedBox(height: 10),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 30),
          child: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: Colors.white, // Set the background color here
            ),
            child: ExpansionTile(
              leading: Icon(Icons.assignment),
              title: Text(
                'Tahapan',
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.blue[800],
                    fontWeight: FontWeight.bold),
              ),
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    // Content for the first expansion tile
                    '1) Sikap dan posisi bola sama seperti mengoper bola setinggi dada, dengan lengan bawah dalam posisi sedikit ke atas. \n'
                    '2) Bola dilepaskan dengan menolakkan bola dengan dua tangan dengan diakhiri lecutan pergelangan tangan mengarah ke bawah. \n'
                    '3) Pantulan dilakukan dengan posisi putaran bola atas (top spin). \n'
                    '4) Sudut pantulan sama antara sudut datang dengan sudut pergi.\n'
                    '5) Bola hasil pantulan diterima pada ketinggian antara lutut dan pinggang.\n',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[800],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 30),
          child: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: Colors.white, // Set the background color here
            ),
            child: ExpansionTile(
              leading: Icon(Icons.video_label_outlined),
              title: Text(
                'Video Pelaksanaan',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.blue[800],
                  fontWeight: FontWeight.bold,
                ),
              ),
              children: [
                //  Content for the second expansion tile
                SizedBox(height: 10),
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: 20), // Adjust the horizontal margin as needed
                  child: Text(
                    'Silahkan putar video di bawah ini untuk membantu Anda memahami praktek bounce pass dalam permainan bola basket.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[800],
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: SizedBox(
                    height: 160,
                    width: 300,
                    child: WebView(
                      initialUrl:
                          'https://www.youtube.com/embed/O5n3x_xtK7k?playsinline=1',
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
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    // Open video in fullscreen mode
                    launchYoutubeVideoInApp();
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromRGBO(21, 101, 192, 1),
                    ),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                  ),
                  child: Text('Buka Fullscreen Video'),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 30),
          child: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: Colors.white, // Set the background color here
            ),
            child: ExpansionTile(
              leading: Icon(Icons.analytics_rounded),
              title: Text(
                'Analisis Biomekanika',
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.blue[800],
                    fontWeight: FontWeight.bold),
              ),
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      // Content for the second expansion tile
                      Image.asset(
                        'images/bouncepass01.jpg', // Replace with your image path
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                      Text(
                        'Pada gambar diatas menjelaskan bahwa telah berlaku Hukum Newton I, pelaksanaan fase awalan gerak passing bounce pass lengan membentuk sudut 900 dan kaki menekuk membentuk sudut 1500, pada posisi tersebut melakukan fase awalan untuk melakukan persiapan gerakan selanjutnya. Kenapa harus mempunya sudut-sudut diatas karena dapat diketahui bahwa hasil analisis gerak kinetik yang ditinjau dari aspek biomekanik yakni sudut lengan dan sudut kaki secara langsung menyiapkan posisi kuda-kuda kaki dan memposisikan lengan tangan untuk menstabilkan ruang pergelangan tangan dan jari-jari agar tetap rileks, saat melakukan fase awalan adanya fleksi ekstrimitas atas dilakukan agar beban pada sendi mengurang dengan cara memperpendek lengan torsi. Sangat penting melakukan fleksi bagian ekstrimitas atas guna meningkatkan pembebanan kaki. Beban lebih ditingkatkan pada tubuh bagian bawah untuk mendekati pusat gravitasi. Posisi ini akan berguna untuk persiapan transfer gaya yang bekerja tetap linear dan vertikal sehingga gerakan menjadi optimal dan diterima dibagian fase gerakan selanjutnya.',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[800],
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      Image.asset(
                        'images/bouncepass02.jpg', // Replace with your image path
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                      Text(
                        'Pada gambar diatas menjelaskan bahwa pelaksanaan fase selanjutnya gerak passing bounce pass kaki tumpuan menekuk membentuk sudut 1720 pada posisi tersebut melakukan fase awalan untuk melakukan persiapan gerakan follow throught. Pada fase pelaksanaan terdapat gaya memproduksi gerakan dengan sama yakni, bola di tempatkan didepan tubuh dengan kedua tangan, bagian tubuh ekstrimitas atas dan lengan mengarah ke atas dan kedepan hinga mencapai posisi vertikal.',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[800],
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      Image.asset(
                        'images/bouncepass03.jpg', // Replace with your image path
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(height: 30),
                      Text(
                        'Pada gambar diatas menjelaskan bahwa telah berlaku Hukum Newton III, pelaksanaan fase awalan gerak passing bounce pass pergelangan tangan membentuk sudut 900 untuk gerakan Follow Through dan kaki tumpu menekuk membentuk sudut 1440 dan kaki belakang membentuk sudut 1450, pada posisi tersebut melakukan fase awalan untuk melakukan persiapan gerakan selanjutnya. Pada saat rilis fase follow through juga melakukannya dengan gerakan yang tidak jauh berbeda yakni lengan, lutut kaki dan ekstrimitas atas sepenuhnya ekstensi yang menandakan sudah menyodorkan sebuah kontribusi penuh terhadap pelepasan bola, itulah kenapa harus membentuk sudut-sudut diatas karena Fase follow through pada dasarnya ialah merentangkan lengan dan pergelangan tangan sepenuhnya untuk menciptakan trajectory of the ball yang ideal.',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[800],
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 30),
          child: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: Colors.white, // Set the background color here
            ),
            child: ExpansionTile(
              leading: Icon(Icons.question_answer),
              title: Text(
                'Frequently Asked Question',
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.blue[800],
                    fontWeight: FontWeight.bold),
              ),
              children: [
                //  Content for the second expansion tile
                SizedBox(height: 30),
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: 20), // Adjust the horizontal margin as needed
                  child: Text(
                    'Silahkan kirimkan pertanyaan Anda berkaitan dengan bounce pass dengan memasukkan pertanyaan pada kolom yang tersedia di bawah.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[800],
                    ),
                    textAlign: TextAlign.justify,
                  ),
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
                            color: Colors.blue[600],
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
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: ElevatedButton(
                        onPressed: () {
                          try {
                            sendEmail(_questionController2.text);
                          } catch (e, stackTrace) {
                            print('Error sending email: $e\n$stackTrace');
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromRGBO(
                              21, 101, 192, 1), // Background color
                          onPrimary: Colors.white, // Text color
                        ),
                        child: Text('Kirim Pertanyaan'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void launchYoutubeVideoInApp() async {
    const videoId = 'O5n3x_xtK7k';
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
        'subject': 'Pertanyaan tentang Teknik Bounce Pass',
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

class AdditionalScreen extends StatefulWidget {
  @override
  _AdditionalScreenState createState() => _AdditionalScreenState();
}

class _AdditionalScreenState extends State<AdditionalScreen> {
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
            'Overhead Pass merupakan salah satu dari jenis passing dalam permainan bola basket. Berikut adalah informasi terkait overhead pass yang terdiri dari tahapan, analisis biomekanika dan video praktek overhead pass:',
            style: TextStyle(
              fontSize: 15,
              color: Colors.grey[800],
            ),
            textAlign: TextAlign.justify,
          ),
        ),
        SizedBox(height: 10),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 30),
          child: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: Colors.white, // Set the background color here
            ),
            child: ExpansionTile(
              leading: Icon(Icons.assignment),
              title: Text(
                'Tahapan',
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.blue[800],
                    fontWeight: FontWeight.bold),
              ),
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    // Content for the first expansion tile
                    '1) Pegangan bola sama dengan posisi mengoper bola setinggi dada, hanya bola berada diatas kepala sedikit didepan dahi dengan siku agak ditekuk. \n'
                    '2) Awalan lemparan bola ditarik kebelakang hingga diatas kepala kemudian tangan diluruskan kedepan atas diakhiri dengan lecutan pergelangan tangan sehingga jari-jari menghadap ke bawah.\n'
                    '3) Arah lemparan setinggi jangkauan tangan di atas kepala sampai ke bahu penerima.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[800],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 30),
          child: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: Colors.white, // Set the background color here
            ),
            child: ExpansionTile(
              leading: Icon(Icons.video_label_outlined),
              title: Text(
                'Video Pelaksanaan',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.blue[800],
                  fontWeight: FontWeight.bold,
                ),
              ),
              children: [
                //  Content for the second expansion tile
                SizedBox(height: 30),
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: 20), // Adjust the horizontal margin as needed
                  child: Text(
                    'Silahkan putar video di bawah ini untuk membantu Anda memahami praktek overhead pass dalam permainan bola basket.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[800],
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: SizedBox(
                    width: 300,
                    height: 160,
                    child: WebView(
                      initialUrl:
                          'https://www.youtube.com/embed/ggLydspx0k4?playsinline=1',
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
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    // Open video in fullscreen mode
                    launchYoutubeVideoInApp();
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromRGBO(21, 101, 192, 1),
                    ),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                  ),
                  child: Text('Buka Fullscreen Video'),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 30),
          child: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: Colors.white, // Set the background color here
            ),
            child: ExpansionTile(
              leading: Icon(Icons.analytics_rounded),
              title: Text(
                'Analisis Biomekanika',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.blue[800],
                  fontWeight: FontWeight.bold,
                ),
              ),
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      // Content for the second expansion tile
                      Image.asset(
                        'images/overheadpass01.jpg', // Replace with your image path
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                      Text(
                        'Pada gambar diatas menjelaskan bahwa telah berlaku Hukum Newton I, pelaksanaan fase awalan gerak passing overhead pass lengan membentuk sudut 900 dan kaki menekuk membentuk sudut 1270, pada posisi tersebut melakukan fase awalan untuk melakukan persiapan gerakan selanjutnya. Kenapa harus mempunya sudut-sudut diatas karena dapat diketahui bahwa hasil analisis gerak kinetik yang ditinjau dari aspek biomekanik yakni sudut lengan, sudut tubuh dan sudut kaki secara langsung menyiapkan posisi kuda-kuda kaki dan memposisikan lengan tangan untuk menstabilkan ruang pergelangan tangan dan jari-jari agar tetap rileks, saat melakukan fase awalan adanya fleksi ekstrimitas atas dilakukan agar beban pada sendi mengurang dengan cara memperpendek lengan torsi. Sangat penting melakukan fleksi bagian ekstrimitas atas guna meningkatkan pembebanan kaki. Beban lebih ditingkatkan pada tubuh bagian bawah untuk mendekati pusat gravitasi. Posisi ini akan berguna untuk persiapan transfer gaya yang bekerja tetap linear dan vertikal sehingga gerakan menjadi optimal dan diterima dibagian fase gerakan selanjutnya.',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[800],
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      Image.asset(
                        'images/overheadpass02.jpg', // Replace with your image path
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                      Text(
                        'Pada gambar diatas menjelaskan bahwa pelaksanaan fase selanjutnya gerak passing overhead pass lengan membentuk sudut 800, kaki tumpuan menekuk membentuk sudut 1290 dan kaki belakang membentuk sudut 1400 pada posisi tersebut melakukan fase awalan untuk melakukan persiapan gerakan follow throught. Pada fase pelaksanaan terdapat gaya memproduksi gerakan dengan sama yakni, bola di tempatkan didepan tubuh dengan kedua tangan, bagian tubuh ekstrimitas atas dan lengan mengarah ke atas dan kedepan hinga mencapai posisi vertikal.',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[800],
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      Image.asset(
                        'images/overheadpass03.jpg', // Replace with your image path
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(height: 30),
                      Text(
                        'Pada gambar diatas menjelaskan bahwa telah berlaku Hukum Newton III, pelaksanaan fase awalan gerak passing overhead pass pergelangan tangan membentuk sudut 900 untuk gerakan Follow Through dan kaki tumpu menekuk membentuk sudut 1410 dan kaki belakang membentuk sudut 900 dari lantai, pada posisi tersebut melakukan fase awalan untuk melakukan persiapan gerakan selanjutnya. Pada saat rilis fase follow through juga melakukannya dengan gerakan yang tidak jauh berbeda yakni lengan, lutut kaki dan ekstrimitas atas sepenuhnya ekstensi yang menandakan sudah menyodorkan sebuah kontribusi penuh terhadap pelepasan bola, itulah kenapa harus membentuk sudut-sudut diatas karena Fase follow through pada dasarnya ialah merentangkan lengan dan pergelangan tangan sepenuhnya untuk menciptakan trajectory of the ball yang ideal.',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[800],
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 30),
          child: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: Colors.white, // Set the background color here
            ),
            child: ExpansionTile(
              leading: Icon(Icons.question_answer),
              title: Text(
                'Frequently Asked Question',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.blue[800],
                  fontWeight: FontWeight.bold,
                ),
              ),
              children: [
                //  Content for the second expansion tile
                SizedBox(height: 30),
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: 20), // Adjust the horizontal margin as needed
                  child: Text(
                    'Silahkan kirimkan pertanyaan Anda berkaitan dengan overhead pass dengan memasukkan pertanyaan pada kolom yang tersedia di bawah.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[800],
                    ),
                    textAlign: TextAlign.justify,
                  ),
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
                            color: Colors.blue[600],
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
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: ElevatedButton(
                        onPressed: () {
                          try {
                            sendEmail(_questionController2.text);
                          } catch (e, stackTrace) {
                            print('Error sending email: $e\n$stackTrace');
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromRGBO(
                              21, 101, 192, 1), // Background color
                          onPrimary: Colors.white, // Text color
                        ),
                        child: Text('Kirim Pertanyaan'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void launchYoutubeVideoInApp() async {
    const videoId = 'ggLydspx0k4';
    const youtubeUrl = 'https://www.youtube.com/watch?v=$videoId&t=0s&fs=1';

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
        'subject': 'Pertanyaan tentang Teknik Overhead Pass',
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
