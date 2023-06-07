import 'package:bloc_example/Bloc/Internet_bloc/internet_bloc.dart';
import 'package:bloc_example/Bloc/post_api_cubit/post_cubit.dart';
import 'package:bloc_example/Bloc/sign_in_bloc/sign_in_bloc.dart';
import 'package:bloc_example/Screens/home_screen.dart';
import 'package:bloc_example/Screens/post_screen.dart';
import 'package:bloc_example/Screens/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // create: (context) => InternetBloc(),
      // create: (context) => SignInBloc(),
      create: (context) => PostCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Bloc Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const PostScreen(),
      ),
    );
  }
}
