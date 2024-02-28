import 'package:flutter/material.dart';
import 'package:flutter_application_1/constante.dart';
import 'package:flutter_application_1/models/user_cubit.dart';
import 'package:flutter_application_1/views/Login.dart';
import 'package:flutter_application_1/views/home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  await Hive.initFlutter();
  // Set the path for storing Hive data
  var appDocumentDirectory = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  var box = await Hive.openBox(tokenBox);
  String token = box.get("token", defaultValue: "");
  runApp(MyApp(token));
}

class MyApp extends StatelessWidget {
  final String token;
  const MyApp(this.token, {super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserCubit>(
         create: (context) => UserCubit(), // Provide an instance of UserCubit
        ),
      ],
      child: MaterialApp(
      title: 'CupConnect',
      locale: const Locale('en', 'US'),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.white,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.white),
       ),
      ),
      home: token.isEmpty ? SignInPage() : HomePage(),
    ),
    );
  }
}
