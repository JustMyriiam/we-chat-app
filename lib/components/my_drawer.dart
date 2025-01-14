import 'package:flutter/material.dart';
import 'package:we_chat_app/services/auth/auth_service.dart';
import 'package:we_chat_app/pages/settings_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void logout() {
    final auth = AuthService();
    auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      
      backgroundColor: Theme.of(context).colorScheme.onTertiary,
      child: Column(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DrawerHeader(
                child: Icon(
                  Icons.message,
                  color: Theme.of(context).colorScheme.secondary, // Primary color for the icon
                  size: 40,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: ListTile(
                  title: const Text(
                    "H O M E",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  leading: Icon(
                    Icons.home,
                    color: Theme.of(context).colorScheme.secondary, // Icons use primary color
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: ListTile(
                  title: const Text(
                    "S E T T I N G S",
                    style: TextStyle(
                      color: Colors.black, // Items in black
                    ),
                  ),
                  leading: Icon(
                    Icons.settings,
                    color: Theme.of(context).colorScheme.secondary, // Icons use primary color
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SettingsPage(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0, bottom: 25),
            child: ListTile(
              title: const Text(
                "L O G O U T",
                style: TextStyle(
                  color: Colors.black, // Items in black
                ),
              ),
              leading: Icon(
                Icons.logout,
                color: Theme.of(context).colorScheme.secondary, // Icons use primary color
              ),
              onTap: logout,
            ),
          ),
        ],
      ),
    );
  }
}
