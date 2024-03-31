import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:chatbot/Screens/dialogflow.dart';
import 'package:chatbot/Screens/ml.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';

class MyPage extends StatelessWidget {
  int generateRandomSleepQuality() {
    return Random().nextInt(10) +
        1; // Generates a random integer between 1 and 10
  }

  // Function to generate random sleep duration between 4 and 9 hours
  int generateRandomSleepDuration() {
    return Random().nextInt(6) +
        4; // Generates a random integer between 4 and 9
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(FontAwesomeIcons.moon),
            SizedBox(width: 8),
            Text('GoodNight', style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Add your notification icon onPressed action here
            },
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // Add your settings icon onPressed action here
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/images/sliderbg.jpg'), // Different background for slider
            fit: BoxFit.cover,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.all(16),
                color: Colors.blueGrey
                    .withOpacity(0.2), // Background color for blog
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome to Goodnight !',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // Adjust color as per your design
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Where Sleep Transforms Lives!',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white, // Adjust color as per your design
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.blueGrey.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Lottie.asset(
                        'assets/Lottie/Animation - 1711659177872.json',
                        height: 300,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: CarouselSlider(
                options: CarouselOptions(
                  height: MediaQuery.of(context).size.height * 0.8,
                  enableInfiniteScroll: true,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  enlargeCenterPage: true,
                ),
                items: [
                  'assets/images/6.jpg',
                  'assets/images/5.jpg',
                  'assets/images/2.jpg',
                  'assets/images/image4.jpg',
                  'assets/images/image4.jpg',
                ].map((item) {
                  return Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(item),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 40, // Adjust the height as needed
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(FontAwesomeIcons.file),
                    onPressed: () {
                      // Add your home icon onPressed action here
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Home()),
                      );
                    },
                  ),
                  //   Text('Home'),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(FontAwesomeIcons.home),
                    onPressed: () {
                      // Add your chat icon onPressed action here
                    },
                  ),
                  //    Text('Chat'),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(FontAwesomeIcons.comments),
                    onPressed: () {
                      // Add your profile icon onPressed action here

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Chatbot()),
                      );
                    },
                  ),
                  //   Text('Profile'),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        margin: EdgeInsets.only(bottom: 60),
        child: FloatingActionButton.extended(
          onPressed: () {
            // Add your "Let's start a chat" onPressed action here

            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Chatbot()),
            );
          },
          label: Text("Let's start a chat"),
          icon: Icon(Icons.chat),
          backgroundColor:
              Color.fromARGB(255, 162, 210, 239), // Match with your color code
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}
