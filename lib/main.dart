import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/view/home_screen.dart';
import 'package:untitled/view_model/users_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => UsersProvider(),
      child: MaterialApp(
        title: 'MondayTaskOne',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomePage(),
      ),
    );
  }
}
