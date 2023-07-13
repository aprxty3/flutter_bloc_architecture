import 'package:flutter/material.dart';
import 'package:flutter_bloc_architecture/application/core/service/theme_service.dart';
import 'package:provider/provider.dart';

class AdviceScreen extends StatelessWidget {
  const AdviceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Advice Screen',
          style: Theme.of(context).textTheme.headline1,
        ),
        centerTitle: true,
        actions: [
          Switch(
            value: Provider.of<ThemeService>(context).isDarkModeOn,
            onChanged: (value) =>
                Provider.of<ThemeService>(context, listen: false).toogleTheme(),
          )
        ],
      ),
      body: Scaffold(),
    );
  }
}
