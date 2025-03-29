import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40, right: 20),
            child: Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: Icon(Icons.close, size: 24, color: Colors.black),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),
          _buildDrawerItem(Icons.local_offer_outlined, "New Cars"),
          _buildDrawerItem(Icons.autorenew, "Used Cars"),
          _buildDrawerItem(Icons.attach_money, "Sell Cars"),
          _buildDrawerItem(Icons.car_repair, "Car Accessories"),
          _buildDrawerItem(Icons.credit_card, "Car Loan"),
          _buildDrawerItem(Icons.language, "Language"),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Image.asset('images/drawer_icons/fb.png'),
                  iconSize: 30,
                  onPressed: () {},
                ),
                SizedBox(width: 20),
                IconButton(
                  icon: Image.asset('images/drawer_icons/twitter.png'),
                  iconSize: 30,
                  onPressed: () {},
                ),
                SizedBox(width: 20),
                IconButton(
                  icon: Image.asset('images/drawer_icons/insta.png'),
                  iconSize: 30,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  //Drawer Item Widget
  Widget _buildDrawerItem(IconData icon, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 21, horizontal: 30),
      child: Row(
        children: [
          Icon(icon, size: 24, color: Colors.black),
          SizedBox(width: 15),
          Text(
            title,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
