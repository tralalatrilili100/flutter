// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:basketapp/screens/home_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 20,
          ),
          Image.asset(
            "images/home.png",
            height: 370,
            fit: BoxFit.cover,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Pengembangan Media Pembelajaran\n' 'Bola Basket',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Berbasis Multimedia Interaktif",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  margin: EdgeInsets.only(bottom: 5, right: 10, left: 10),
                  child: Text(
                    "Nama: Benny Aprial. M \n"
                    "Promotor: Prof. Dr. Tandiyo Rahayu, M.Pd.\n"
                    "Co Promotor: Dr. Sulaiman, M.Pd\n"
                    "Ang Promotor: Dr. Mugiyo Hartono, M.Pd. \n",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.black.withOpacity(0.6),
                    ),
                  ),
                ),
                SizedBox(height: 5), // Add spacing between text and button
                Material(
                  color: Color(0xFF57CCE6),
                  borderRadius: BorderRadius.circular(10),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ),
                      );
                    },
                    child: Container(
                      height: 40,
                      width: 150,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Center(
                        child: Text(
                          "Get Started",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
