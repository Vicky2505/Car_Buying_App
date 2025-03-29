import 'package:carvizio/screens/Car%20Detail%20Screen/car_detail_screen.dart';
import 'package:carvizio/screens/Home%20Screen/drawer.dart';
import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String selectedCategory = "All";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.only(left: 15),
          child: IconButton(
            icon: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(height: 3, width: 22, color: Colors.black),
                SizedBox(height: 5),
                Container(height: 3, width: 22, color: Colors.black),
                SizedBox(height: 5),
                Row(
                  children: [
                    Container(height: 3, width: 12, color: Colors.black),
                  ],
                ),
              ],
            ),
            onPressed: () {
              _scaffoldKey.currentState?.openDrawer();
            },
          ),
        ),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.location_on, color: Colors.black),
            SizedBox(width: 5),
            Text(
              "Bangalore",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            Icon(Icons.keyboard_arrow_down, color: Colors.black),
          ],
        ),
        centerTitle: true,
        actions: [
          CircleAvatar(
            backgroundImage: AssetImage(
              'images/home_assets/default_avatar.jpg',
            ),
            radius: 22,
          ),
          SizedBox(width: 15),
        ],
      ),
      drawer: CustomDrawer(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          double screenWidth = constraints.maxWidth;
          double screenHeight = constraints.maxHeight;

          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.05,
                vertical: screenWidth * 0.01,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AnimatedSwitcher(
                    duration: const Duration(seconds: 10),
                    transitionBuilder:
                        (child, animation) => FadeTransition(
                          opacity: animation,
                          child: SizeTransition(
                            sizeFactor: animation,
                            child: child,
                          ),
                        ),
                    child:
                        selectedCategory == "All"
                            ? Column(
                              key: ValueKey("ExploreTexts"),
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Explore",
                                  style: TextStyle(
                                    fontSize: screenWidth * 0.07,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  "The best & favourite car",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: screenWidth * 0.035,
                                  ),
                                ),
                              ],
                            )
                            : SizedBox.shrink(),
                  ),
                  SizedBox(
                    height:
                        selectedCategory == "All"
                            ? screenHeight * 0.02
                            : screenHeight * 0.01,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.05,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildCategory(
                          "All",
                          isSelected: selectedCategory == "All",
                          fontSize: screenWidth * 0.040,
                        ),
                        _buildCategory(
                          "SUV",
                          isSelected: selectedCategory == "SUV",
                          fontSize: screenWidth * 0.040,
                        ),
                        _buildCategory("ELC", fontSize: screenWidth * 0.040),
                        _buildCategory("VAN", fontSize: screenWidth * 0.040),
                        _buildCategory("SDN", fontSize: screenWidth * 0.040),
                      ],
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.05,
                    ),
                    child: AnimatedSwitcher(
                      duration: const Duration(seconds: 10),
                      switchInCurve: Curves.easeIn,
                      switchOutCurve: Curves.easeOut,
                      transitionBuilder:
                          (child, animation) => SizeTransition(
                            sizeFactor: animation,
                            child: child,
                          ),
                      child:
                          selectedCategory == "All"
                              ? Container(
                                height: 330,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Color(0xFFF6F8F8),
                                  borderRadius: BorderRadius.circular(50),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 4,
                                    ),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: screenHeight * 0.010,
                                        left: screenWidth * 0.09,
                                        right: screenWidth * 0.09,
                                        bottom: screenHeight * 0.001,
                                      ),
                                      child: Container(
                                        color: Color(0xFFF6F8F8),
                                        height: 250,
                                        width: 280,
                                        child: ModelViewer(
                                          src:
                                              'images/home_assets/ford_mustang.glb',
                                          autoRotate: true,
                                          cameraControls: true,
                                          disableZoom: false,
                                          cameraOrbit: "-150deg 85deg",
                                          fieldOfView: "33deg",
                                          interactionPrompt:
                                              InteractionPrompt.none,
                                        ),
                                      ),
                                    ),

                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: screenHeight * 0.001,
                                        left: screenWidth * 0.05,
                                        right: screenWidth * 0.05,
                                        bottom: screenHeight * 0.02,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Ford Mustang GT 2022",
                                                style: TextStyle(
                                                  fontSize: screenWidth * 0.05,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              SizedBox(
                                                height: screenHeight * 0.005,
                                              ),
                                              Text(
                                                "₹ 74,00,000",
                                                style: TextStyle(
                                                  fontSize: screenWidth * 0.038,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ],
                                          ),
                                          IconButton(
                                            icon: Icon(
                                              Icons.arrow_forward_ios,
                                              color: Colors.black,
                                              size: screenWidth * 0.05,
                                            ),
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder:
                                                      (context) =>
                                                          CarDetailScreen(),
                                                ),
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                              : Container(key: ValueKey("OtherContainer")),
                    ),
                  ),
                  SizedBox(
                    height:
                        selectedCategory == "All"
                            ? screenHeight * 0.05
                            : screenHeight * 0.001,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.05,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Popular Brands",
                          style: TextStyle(
                            fontSize: screenWidth * 0.055,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "See all",
                          style: TextStyle(
                            color: Color(0xFF928B8B),
                            fontSize: screenWidth * 0.036,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.025),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.05,
                      vertical: 8.0,
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildBrand(
                              "images/home_assets/benz.png",
                              "Mercedes",
                              screenWidth * 1.2,
                            ),
                            _buildBrand(
                              "images/home_assets/audi.png",
                              "Audi",
                              screenWidth * 1.2,
                            ),
                            _buildBrand(
                              "images/home_assets/jaguar.png",
                              "Jaguar",
                              screenWidth * 1.2,
                            ),
                          ],
                        ),
                        SizedBox(
                          height:
                              selectedCategory == "All"
                                  ? screenHeight * 0.01
                                  : screenHeight * 0.03,
                        ),
                        selectedCategory == "All"
                            ? SizedBox.shrink()
                            : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _buildBrand(
                                  "images/home_assets/Hyundai.png",
                                  "Hyundai",
                                  screenWidth * 1.2,
                                ),
                                _buildBrand(
                                  "images/home_assets/Tata.png",
                                  "TATA",
                                  screenWidth * 1.2,
                                ),
                                _buildBrand(
                                  "images/home_assets/Mahindra.png",
                                  "Mahindra",
                                  screenWidth * 1.2,
                                ),
                              ],
                            ),
                        SizedBox(
                          height:
                              selectedCategory == "All"
                                  ? screenHeight * 0.01
                                  : screenHeight * 0.04,
                        ),
                        selectedCategory == "All"
                            ? SizedBox.shrink()
                            : Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                _buildCarCard(
                                  screenWidth,
                                  screenHeight,
                                  "images/home_assets/mercedes-benz_maybach_2022.glb",
                                  "Mercedes-Benz",
                                  "S-Class 4MATIC",
                                  "₹2.69 Cr - 4Cr",
                                  "550 bhp",
                                  "3982 cc",
                                  "Automatic (9-speed)",
                                ),
                                SizedBox(height: screenHeight * 0.04),
                                _buildCarCard(
                                  screenWidth,
                                  screenHeight,
                                  "images/home_assets/toyota_fortuner_2021.glb",
                                  "Toyota Fortuner 2021",
                                  "Legender 4x4 Diesel",
                                  "₹35L - 50L",
                                  "204 bhp",
                                  "2755 cc",
                                  "Manual & Automatic",
                                ),
                                SizedBox(height: screenHeight * 0.04),
                                _buildCarCard(
                                  screenWidth,
                                  screenHeight,
                                  "images/home_assets/hyundai_creta.glb",
                                  "Hyundai Creta",
                                  "SX (O) Turbo Petrol",
                                  "₹13L - 20L",
                                  "160 bhp",
                                  "1497 cc",
                                  "Manual & Automatic",
                                ),
                                SizedBox(height: screenHeight * 0.04),
                                _buildCarCard(
                                  screenWidth,
                                  screenHeight,
                                  "images/home_assets/volkswagen_virtus.glb",
                                  "Volkswagen Virtus",
                                  "GT Plus 1.5L TSI",
                                  "₹11L - 19L",
                                  "150 bhp",
                                  "1498 cc",
                                  "Manual & Automatic",
                                ),
                                SizedBox(height: screenHeight * 0.02),
                              ],
                            ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  // Category Button Widget
  Widget _buildCategory(
    String title, {
    bool isSelected = false,
    double fontSize = 14,
  }) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = title;
        });
      },
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: fontSize,
              color: isSelected ? Colors.black : Colors.grey,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          if (isSelected)
            Container(
              margin: EdgeInsets.only(top: 3),
              width: 5,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
            ),
        ],
      ),
    );
  }

  // Brand Logo Widget
  Widget _buildBrand(String imagePath, String name, double screenWidth) {
    return Column(
      children: [
        Container(
          height: screenWidth * 0.18,
          width: screenWidth * 0.18,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Image.asset(imagePath, height: screenWidth * 0.12),
          ),
        ),
        SizedBox(height: 5),
        Text(
          name,
          style: TextStyle(
            color: Color(0xFF928B8B),
            fontSize: screenWidth * 0.033,
          ),
        ),
      ],
    );
  }
}

// Car Detail Widget
Widget _buildCarCard(
  double screenWidth,
  double screenHeight,
  String modelPath,
  String carName,
  String carVariant,
  String price,
  String bhp,
  String cc,
  String transmission,
) {
  return Container(
    width: screenWidth * 0.9,
    decoration: BoxDecoration(
      color: Color(0xFFF6F8F8),
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(color: Colors.black12, blurRadius: 4, spreadRadius: 2),
      ],
    ),
    padding: EdgeInsets.all(12),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Color(0xFFF6F8F8),
              width: screenWidth * 0.40,
              height: screenHeight * 0.17,
              child: ModelViewer(
                src: modelPath,
                autoRotate: true,
                cameraControls: true,
                disableZoom: false,
                cameraOrbit: "-160deg 1m",
                fieldOfView: "40deg",
                interactionPrompt: InteractionPrompt.none,
              ),
            ),
            SizedBox(height: 30),
            Text(
              carName,
              style: TextStyle(
                fontSize: screenWidth * 0.040,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 5),
            Text(
              carVariant,
              style: TextStyle(
                fontSize: screenWidth * 0.03,
                color: Color(0xFF1574AA),
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        SizedBox(width: 15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * 0.02),
              Text(
                price,
                style: TextStyle(
                  fontSize: screenWidth * 0.04,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Text(
                bhp,
                style: TextStyle(
                  fontSize: screenWidth * 0.035,
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Text(
                cc,
                style: TextStyle(
                  fontSize: screenWidth * 0.035,
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Text(
                transmission,
                style: TextStyle(
                  fontSize: screenWidth * 0.035,
                  color: Colors.black54,
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: EdgeInsets.only(top: screenHeight * 0.02),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                    size: screenWidth * 0.04,
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
