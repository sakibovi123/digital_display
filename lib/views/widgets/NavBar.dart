import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(30, 20, 20, 20),
            child: Text("All Menu",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                )),
          ),
          Container(
            height: 2.0,
            color: Colors.black12,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading:
                  const Icon(Icons.home_filled, color: Colors.purpleAccent),
              onTap: () {},
              title: const Text("Home"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading:
                  const Icon(Icons.favorite_border, color: Colors.redAccent),
              onTap: () {},
              title: const Text("Favorite News"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: const Icon(Icons.web_rounded, color: Colors.deepPurple),
              onTap: () {},
              title: const Text("Wrestling News"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: const Icon(Icons.currency_bitcoin_rounded,
                  color: Colors.deepOrange),
              onTap: () {},
              title: const Text("Crypto Analysisis"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: const Icon(Icons.settings, color: Colors.blue),
              onTap: () {},
              title: const Text("Settings"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: const Icon(Icons.currency_bitcoin_rounded,
                  color: Colors.deepOrange),
              onTap: () {},
              title: const Text("Crypto Analysisis"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: const Icon(Icons.currency_bitcoin_rounded,
                  color: Colors.deepOrange),
              onTap: () {},
              title: const Text("Crypto Analysisis"),
            ),
          ),
        ],
      ),
    );
  }
}
