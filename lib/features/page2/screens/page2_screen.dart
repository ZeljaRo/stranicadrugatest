import 'package:flutter/material.dart';
import '../page2_grid.dart';

class Page2Screen extends StatelessWidget {
  const Page2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Page2Grid(),
    );
  }
}
