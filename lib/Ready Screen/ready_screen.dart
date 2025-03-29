import 'package:carvizio/screens/bottom_nav.dart';
import 'package:flutter/material.dart';

class ReadyScreen extends StatefulWidget {
  const ReadyScreen({super.key});

  @override
  State<ReadyScreen> createState() => _ReadyScreenState();
}

class _ReadyScreenState extends State<ReadyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1E1E1E),
      body: LayoutBuilder(
        builder: (context, constraints) {
          double screenHeight = constraints.maxHeight;
          double screenWidth = constraints.maxWidth;
          double textSize = screenWidth * 0.10;
          return Stack(
            children: [

              Positioned(
                top: screenHeight * 0.175,
                left: 0,
                right: 0,
                child: Image.asset(
                  'images/ready_assets/car_logo.png',
                  width: screenWidth * 0.9,
                  fit: BoxFit.cover,
                ),
              ),

              Positioned(
                bottom: screenHeight * 0.040,
                left: 0,
                right: 8,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Find a perfect &\n'
                      'favourite car for\n'
                      '   you.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: textSize,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: screenHeight * 0.001),

                    Padding(
                      padding: EdgeInsets.only(left: 250),
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              // ignore: deprecated_member_use
                              color: Colors.blue.withOpacity(0.4),
                              blurRadius: 10,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: FloatingActionButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BottomNav(),
                              ),
                            );
                          },
                          shape: CircleBorder(),
                          backgroundColor: Colors.blue,
                          elevation: 8,
                          child: Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 28,
                          ),
                        ),
                      ),
                    ),
                    
                    SizedBox(height: screenHeight * 0.01),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
