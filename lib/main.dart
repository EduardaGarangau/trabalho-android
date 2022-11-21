import 'package:clinica_up/screens/form_page.dart';
import 'package:clinica_up/screens/home_page.dart';
import 'package:clinica_up/screens/splash_screen.dart';
import 'package:clinica_up/services/testes_service.dart';
import 'package:clinica_up/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TestesService()),
      ],
      child: MaterialApp(
        title: 'UP - Clinica de Psicologia',
        debugShowCheckedModeBanner: false,
        home: HomePage(),
        routes: {
          AppRoutes.FORM: (context) => FormPage(),
        },
      ),
    );
  }
}
