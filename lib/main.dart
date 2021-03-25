import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homeward/ui/screens/login_screen.dart';

import 'logic/cubit/blog_cubit.dart';
import 'logic/cubit/login_cubit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginCubit(),),
        BlocProvider(create: (context) => BlogCubit(),),

      ],
      child: MaterialApp(
        title: 'Homeward',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(

        ),
        home: LoginScreen()
      ),
    );
  }
}
