import 'package:bloc_example/Bloc/Internet_bloc/internet_bloc.dart';
import 'package:bloc_example/Bloc/Internet_bloc/internet_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: BlocConsumer<InternetBloc, InternetState>(
              builder: (context, state) {
            if (state is InternetGainedState) {
              return const Text('Connected..');
            } else if (state is InternetLossState) {
              return const Text('not Connected..');
            } else {
              return const Text('Loading..');
            }
          }, listener: ((context, state) {
            if (state is InternetGainedState) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("Internet is restored"),
                backgroundColor: Colors.green,
              ));
            } else if (state is InternetLossState) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("Internet is lost"),
                backgroundColor: Colors.red,
              ));
            }
          })),
        ),
      ),
    );
  }
}
