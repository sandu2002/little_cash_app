import 'package:flutter/material.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Define menu items
    final List<MenuItem> menuItems = [
      MenuItem(icon: Icon(Icons.home), title: 'Home'),
      MenuItem(icon: Icon(Icons.settings), title: 'Settings'),
      MenuItem(icon: Icon(Icons.person), title: 'Profile'),
      // Add more items as needed
    ];

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Header with gradient background
        Container(
          height: 200,
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color(0xFF0399a7),
                Color(0xFF5abb39),
              ],
            ),
          ),
          child: Column(
            children: [
              // User avatar with verified icon
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage('assets/images/user/dashatar.jpg'),
                    radius: 50, // Adjust the radius as needed
                  ),
                  Tooltip(
                    message: 'Verified',
                    child: Icon(
                      Icons.verified_user_rounded,
                      size: 20, // Adjusted size for better visibility
                      color: Colors.green, // Changed color to green for better visibility
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5),
              // User name
              Text(
                'John F. Doe',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        // Menu items
        ...menuItems.map((e) => ListTile(
          leading: e.icon,
          title: Text(e.title),
          trailing: Icon(Icons.arrow_right_rounded),
          onTap: () {
            // Handle the tap event for each menu item
            print('${e.title} tapped');
          },
        )).toList(),
      ],
    );
  }
}

// MenuItem class
class MenuItem {
  final Icon icon;
  final String title;

  MenuItem({required this.icon, required this.title});
}