import 'package:flutter/material.dart';

class SidebarScreen extends StatelessWidget {
  const SidebarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(


      child: Center(
        child: Text('Sidebar Content'),
      ),
    );
  }
}
