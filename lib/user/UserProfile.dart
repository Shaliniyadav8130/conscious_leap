import 'package:flutter/material.dart';

class SidebarScreen extends StatelessWidget {
  const SidebarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sidebar'),
      ),
      drawer: Drawer(
        // Sidebar content
      ),
      body: Center(
        child: Text('Sidebar Content'),
      ),
    );
  }
}
