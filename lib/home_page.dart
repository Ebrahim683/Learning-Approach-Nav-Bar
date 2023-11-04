import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true, // Center the title
        title: const Text("Your App Title"), // Replace with your app's title
        actions: MediaQuery.of(context).size.width >= 600
            ? <Widget>[
                NavigationItem("Home"),
                NavigationItem("Courses"),
                NavigationItem("About"),
                NavigationItem("Reviews"),
                NavigationItem("Contact"),
                NavigationItem("FAQ"),
              ]
            : <Widget>[
                IconButton(
                  icon: Icon(Icons.menu, color: Colors.green),
                  onPressed: () {
                    _scaffoldKey.currentState!.openDrawer();
                  },
                ),
              ],
      ),
      drawer: MediaQuery.of(context).size.width < 600
          ? Drawer(
              child: ListView(
                children: const [
                  DrawerHeader(
                    decoration: BoxDecoration(
                      color: Colors.green,
                    ),
                    child: Text("Learning Approach"),
                  ),
                  DrawerNavigationItem("Home"),
                  DrawerNavigationItem("Courses"),
                  DrawerNavigationItem("About"),
                  DrawerNavigationItem("Reviews"),
                  DrawerNavigationItem("Contact"),
                  DrawerNavigationItem("FAQ"),
                ],
              ),
            )
          : null,
    );
  }
}

class NavigationItem extends StatelessWidget {
  final String title;

  const NavigationItem(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.green,
          decoration: TextDecoration.underline,
          decorationColor: Colors.yellow,
        ),
      ),
    );
  }
}

class DrawerNavigationItem extends StatelessWidget {
  final String title;
  const DrawerNavigationItem(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
    );
  }
}
