// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, library_private_types_in_public_api, prefer_const_literals_to_create_immutables, prefer_final_fields, deprecated_member_use, prefer_const_constructors_in_immutables, duplicate_ignore, unused_field

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
      home: ShootingScreen(), // Changed to PassingScreen
    );
  }
}

class ShootingScreen extends StatefulWidget {
  @override
  _ShootingScreenState createState() => _ShootingScreenState();
}

class _ShootingScreenState extends State<ShootingScreen>
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
          'Teknik Dasar Shooting',
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
            'images/shooting_image.png',
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
                    text: 'Shooting Free Throw',
                    width: 150),
                CustomTabWithIcon(
                    icon: Icons.sports_basketball, text: 'Lay Up', width: 100),
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
              indicatorColor: Colors.blue,
            ),
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
            'Shooting free throw merupakan salah satu dari jenis teknik shooting dalam permainan bola basket. Berikut adalah informasi terkait shooting free throw  yang terdiri dari tahapan, analisis biomekanika dan video praktek shooting free throw:',
            style: TextStyle(
              fontSize: 14,
              color: Colors.black,
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
                  fontWeight: FontWeight.bold,
                ),
              ),
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    // Content for the first expansion tile
                    '1) Badan tegak dengan kedua kaki dibuka selebar bahu dan sejajar. \n'
                    '2) Kedua lutut ditekuk dengan keseimbangan yang baik. \n'
                    '3) Bola dipegang dengan kedua tangan, jari-jari dibuka lebar agar bola dipegang dengan kuat. \n'
                    '4) Bola yang dipegang diletakkan didepan atas dahi dengan siku ditekuk dan pandangan mata ke arah ring basket.\n'
                    '5) Bola ditembakkan dengan cara bola didorong dengan kedua tangan ke arah ring basket, lengan (siku), badan, dan lutut diluruskan secara bersamaan.\n'
                    '6) Lepasnya bola diakhiri dengan gerakan aktif pergelangan tangan ke atas, ke depan dan ke bawah.\n',
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
                    fontSize: 15,
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
                    'Silahkan putar video di bawah ini untuk membantu Anda memahami praktek shooting free throw dalam permainan bola basket.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[800],
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: SizedBox(
                    width: 300,
                    height: 160,
                    child: WebView(
                      initialUrl:
                          'https://www.youtube.com/embed/49iJcXzYeBg?playsinline=1',
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
                        'images/shooting01.jpg', // Replace with your image path
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                      Text(
                        'Pada gambar diatas menjelaskan bahwa pelaksanaan fase awalan gerak free throw lengan fleksi membentuk besaran sudut 90⁰ , batang tubuh fleksi merendah hingga 124⁰ dan kaki menekuk dengan besaran sudut 111⁰. Pada posisi tersebut melakukan fase awalan untuk melakukan persiapan pelemparan bola basket. Disimpulkan bahwasanya pada menyiapkan posisi tubuhnya dengan menyiapkan posisi kuda-kuda kaki dan memposisikan lengan tangan untuk menstabilkan ruang pergelangan tangan dan jari-jari agar tetap rileks. Pada fase awalan ketiga sampel melakukan gerakan yang tidak jauh berbeda. Pada fase ini terdapat gerakan menjongkok untuk persiapan mendorong menembak bola basket. Saat melakukan fase awalan adanya fleksi ekstrimitas atas dilakukan agar beban pada sendi mengurang dengan cara memperpendek lengan torsi. Sangat penting bagi penembak melakukan fleksi bagian ekstrimitas atas guna meningkatkan pembebanan kaki. Beban lebih ditingkatkan pada tubuh bagian bawah untuk mendekati pusat gravitasi. Posisi ini akan berguna untuk persiapan transfer gaya yang bekerja tetap linear dan vertikal sehingga gerakan menjadi optimal dan diterima dibagian fase selanjutnya.',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[800],
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      Image.asset(
                        'images/shooting02.jpg', // Replace with your image path
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                      Text(
                        'Pada gambar diatas menjelaskan bahwa fase pelaksanaan free throw pertama diperoleh besaran sudut lengan 88⁰, batang tubuh ekstensi sebesar 161⁰ dan ekstensi kaki mencapai besaran sudut 136⁰. Pada fase pelaksanaan terdapat gaya memproduksi gerakan, ketiga sampel melakukan gerakan dengan sama yakni, bola di tempatkan didepan tubuh dengan tangan kanan memegang bola dan tangan kiri berada pada samping bola. Ketiga sampel memiliki sudut lengan rata-rata 85⁰- 93⁰. Bagian tubuh ekstrimitas atas dan lengan mengarah ke atas dan kedepan hinga mencapai posisi vertikal.',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[800],
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      Image.asset(
                        'images/shooting03.jpg', // Replace with your image path
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                      Text(
                        'Pada gambar diatas menjelaskan bahwa melaksanaan fase tindak lanjut lengan ekstensi maksimal dengan besaran sudut 179⁰, batang tubuh ekstensi mencapai 180⁰ dan lutut kaki melebar dengan besaran sudut 177⁰. Pada saat rilis fase follow through, ketiga sampel juga melakukannya dengan gerakan yang tidak jauh berbeda yakni lengan, lutut kaki dan ekstrimitas atas sepenuhnya ekstensi yang menandakan sudah menyodorkan sebuah kontribusi penuh terhadap pelepasan bola.',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[800],
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      Image.asset(
                        'images/shooting04.jpg', // Replace with your image path
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                      Text(
                        'Menjelaskan bahwa pergelangan tangan melakukan pronasi dengan sudut 90⁰, sudut bahu dengan 147⁰ dan sudut lengan ekstensi maksimal mencapai 180⁰. Fase follow through pada dasarnya ialah merentangkan lengan dan pergelangan tangan sepenuhnya untuk menciptakan trajectory of the ball yang ideal. Pada lengan RAM ekstensi maksimal dengan sudut 180⁰ tetapi pada fingger flick pada RAM kesempatan pertama dan ketiga memiliki sudut 90⁰ membuat spin pada bola yang maksimal. Bahu dan leher yang kelebihan ketegangan akan mengganggu lengkungan bahu yang mulus pada saat menembak. Itulah yang mengakibatkan lemparan bola basket menjadi kurang akurat pada sasaran. Keseimbangan yang tidak stabil akan mempengaruhi gaya dorongan karena kurangnya sinergi antara lengan dan tungkai.',
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
                SizedBox(height: 10),
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: 20), // Adjust the horizontal margin as needed
                  child: Text(
                    'Silahkan kirimkan pertanyaan Anda berkaitan dengan shooting free throw dengan memasukkan pertanyaan pada kolom yang tersedia di bawah.',
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
                    SizedBox(height: 10),
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
    const videoId = '49iJcXzYeBg';
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
        'subject': 'Pertanyaan tentang Teknik Shooting Free Throw',
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
            'Lay Up merupakan salah satu dari jenis teknik shooting dalam permainan bola basket. Berikut adalah informasi terkait bounce pass yang terdiri dari tahapan, analisis biomekanika dan video praktek lay up:',
            style: TextStyle(
              fontSize: 14,
              color: Colors.black,
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
                    '1) Bola diterima pada langkah pertama, saat menerima bola dilakukan dalam keadaan melayang dilanjutkan dengan dua langkah. \n'
                    '2) Langkah pertama sejauh mungkin untuk meninggalkan lawan dan mendapatkan jarak maju sejauh mungkin serta badan condong ke depan. \n'
                    '3) Langkah kedua pendek untuk awalan tolakan yang baik sehingga dapat melompat setinggi-tingginya. \n'
                    '4) Langkah ketiga dilakukan sekuat-kuatnya sebagai tolakan untuk melompat setinggi mungkin agar lebih dekat dengan ring basket dan menghilangkan kecepatan kedepan, pandangan mata fokus pada sasaran.\n'
                    '5) Tekuk tangan yang akan digunakan untuk menembak membentuk sudut 90° dengan posisi setinggi mungkin tangan satunya menopang bola.\n'
                    '6) Pada titik tertinggi luruskan tangan pemegang bola, dan saat berhenti lepaskan tangan yang menopang bola.\n'
                    '7) Bola dilepaskan dengan lecutan pergelangan tangan dan dengan kekuatan kecil agar bola tidak terlalu kuat saat memantul dari papan.\n',
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
                    'Silahkan putar video di bawah ini untuk memahami Anda dalam mempraktekkan lay up dalam permainan bola basket.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[800],
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: SizedBox(
                    width: 300,
                    height: 160,
                    child: WebView(
                      initialUrl:
                          'https://www.youtube.com/embed/dWWBZ_LPX0Y?playsinline=1',
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
                textAlign: TextAlign.justify,
              ),
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      // Content for the second expansion tile
                      Image.asset(
                        'images/layup01.jpg', // Replace with your image path
                        width: 280, height: 200,
                        fit: BoxFit.cover,
                      ),
                      Text(
                        'Pada gambar diatas menjelaskan bahwa bagian lengan melakukan pronasi dengan sudut 90⁰ sudut kaki tumpu 124⁰. Disimpulkan bahwasanya pada langkah awal lay up shoot posisi tubuhnya dengan menyiapkan posisi langkah kaki tumpuan dan memposisikan lengan tangan untuk menstabilkan ruang pergelangan tangan dan jari-jari agar tetap rileks dan memegang bola secara kokoh. Saat melakukan fase awalan adanya fleksi ekstrimitas atas dilakukan agar beban pada sendi mengurang dengan cara memperpendek lengan torsi. Sangat penting bagi penembak melakukan fleksi bagian ekstrimitas atas guna meningkatkan pembebanan kaki. Beban lebih ditingkatkan pada tubuh bagian bawah untuk mendekati pusat gravitasi. Posisi ini akan berguna untuk persiapan transfer gaya yang bekerja tetap linear dan vertikal sehingga gerakan menjadi optimal dan diterima dibagian fase selanjutnya.',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[800],
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      Image.asset(
                        'images/layup02.jpg', // Replace with your image path
                        width: 280,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                      Text(
                        'Pada gambar diatas menjelaskan bahwa bagian lengan melakukan pronasi dengan sudut 90⁰ sudut kaki tumpu 162⁰ dan kaki belakang membentuk sudut 1100. Disimpulkan bahwasanya pada langkah ini lay up shoot posisi tubuhnya dengan menyiapkan posisi langkah kaki belakang untuk menjadi kaki lompatan dan memposisikan lengan tangan untuk menstabilkan ruang pergelangan tangan dan jari-jari agar tetap rileks dan memegang bola secara kokoh. Saat melakukan fase ini adanya fleksi ekstrimitas atas dilakukan agar beban pada sendi mengurang dengan cara memperpendek lengan torsi. Sangat penting bagi penembak melakukan fleksi bagian ekstrimitas atas guna meningkatkan pembebanan kaki. Beban lebih ditingkatkan pada tubuh bagian bawah untuk mendekati pusat gravitasi. Posisi ini akan berguna untuk persiapan transfer gaya yang bekerja tetap linear dan vertikal sehingga gerakan menjadi optimal dan diterima dibagian fase selanjutnya.',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[800],
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      Image.asset(
                        'images/layup03.jpg', // Replace with your image path
                        width: 280,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                      Text(
                        'Pada gambar diatas menjelaskan bahwa bagian lengan melakukan pronasi dengan sudut 90⁰ sudut kaki tumpu 162⁰ dan kaki belakang membentuk sudut 1100. Disimpulkan bahwasanya pada langkah ini lay up shoot posisi tubuhnya dengan menyiapkan posisi langkah kaki belakang untuk menjadi kaki lompatan dan memposisikan lengan tangan untuk menstabilkan ruang pergelangan tangan dan jari-jari agar tetap rileks dan memegang bola secara kokoh. Saat melakukan fase ini adanya fleksi ekstrimitas atas dilakukan agar beban pada sendi mengurang dengan cara memperpendek lengan torsi. Sangat penting bagi penembak melakukan fleksi bagian ekstrimitas atas guna meningkatkan pembebanan kaki. Beban lebih ditingkatkan pada tubuh bagian bawah untuk mendekati pusat gravitasi. Posisi ini akan berguna untuk persiapan transfer gaya yang bekerja tetap linear dan vertikal sehingga gerakan menjadi optimal dan diterima dibagian fase selanjutnya.',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[800],
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      Image.asset(
                        'images/layup04.jpg', // Replace with your image path
                        width: 280,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                      Text(
                        'Pada gambar diatas menjelaskan bahwa bagian lengan melakukan pronasi dengan sudut 90⁰ sudut kaki tumpu 162⁰ dan kaki belakang membentuk sudut 1100. Disimpulkan bahwasanya pada langkah ini lay up shoot posisi tubuhnya dengan menyiapkan posisi langkah kaki belakang untuk menjadi kaki lompatan dan memposisikan lengan tangan untuk menstabilkan ruang pergelangan tangan dan jari-jari agar tetap rileks dan memegang bola secara kokoh. Saat melakukan fase ini adanya fleksi ekstrimitas atas dilakukan agar beban pada sendi mengurang dengan cara memperpendek lengan torsi. Sangat penting bagi penembak melakukan fleksi bagian ekstrimitas atas guna meningkatkan pembebanan kaki. Beban lebih ditingkatkan pada tubuh bagian bawah untuk mendekati pusat gravitasi. Posisi ini akan berguna untuk persiapan transfer gaya yang bekerja tetap linear dan vertikal sehingga gerakan menjadi optimal dan diterima dibagian fase selanjutnya.',
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
                SizedBox(height: 10),
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: 20), // Adjust the horizontal margin as needed
                  child: Text(
                    'Silahkan kirimkan pertanyaan Anda berkaitan dengan lay-up shoot dengan memasukkan pertanyaan pada kolom yang tersedia di bawah.',
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
                    SizedBox(height: 10),
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
    const videoId = 'dWWBZ_LPX0Y';
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

class AdditionalScreen extends StatefulWidget {
  @override
  _AdditionalScreenState createState() => _AdditionalScreenState();
}

class _AdditionalScreenState extends State<AdditionalScreen> {
  @override
  void initState() {
    super.initState();
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
              color: Colors.black,
            ),
            textAlign: TextAlign.justify,
          ),
        ),
        SizedBox(height: 20),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
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
                  color: Colors.grey[800],
                ),
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
        SizedBox(height: 10),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
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
                  color: Colors.grey[800],
                ),
              ),
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
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
                      ),
                      Image.asset(
                        'images/overheadpass03.jpg', // Replace with your image path
                        height: 200,
                        fit: BoxFit.cover,
                      ),
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
        SizedBox(height: 10),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: Colors.white, // Set the background color here
            ),
            child: ExpansionTile(
              leading: Icon(Icons.video_label_outlined),
              title: Text(
                'Video',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[800],
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
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
