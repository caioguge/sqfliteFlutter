import 'package:flutter/material.dart';

import '../../components/appbar/custom_app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        title: 'Tela Inicial',
        backgroundColor: Color.fromARGB(255, 25, 85, 185),
      ),
    );
  }
}
