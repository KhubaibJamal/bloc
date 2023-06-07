import 'package:bloc_example/Bloc/sign_in_bloc/sign_in_bloc.dart';
import 'package:bloc_example/Bloc/sign_in_bloc/sign_in_event.dart';
import 'package:bloc_example/Bloc/sign_in_bloc/sign_in_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: ListView(
            children: [
              BlocBuilder<SignInBloc, SignInState>(
                builder: (BuildContext context, state) {
                  if (state is SignInErrorState) {
                    return Text(
                      state.errorMessage,
                      style: const TextStyle(color: Colors.red),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
              const SizedBox(height: 10),
              TextField(
                controller: emailController,
                onChanged: (value) {
                  BlocProvider.of<SignInBloc>(context).add(
                    SignInTextChangedEvent(
                        emailController.text, passwordController.text),
                  );
                },
                decoration: const InputDecoration(
                  hintText: "Enter Email",
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: passwordController,
                onChanged: (value) {
                  BlocProvider.of<SignInBloc>(context).add(
                    SignInTextChangedEvent(
                        emailController.text, passwordController.text),
                  );
                },
                decoration: const InputDecoration(
                  hintText: "Enter password",
                ),
              ),
              const SizedBox(height: 10),
              BlocBuilder<SignInBloc, SignInState>(
                builder: (BuildContext context, state) {
                  if (state is SignInLoadingState) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return InkWell(
                    onTap: () {
                      if (state is SignInValidState) {
                        BlocProvider.of<SignInBloc>(context).add(
                          SignInTextChangedEvent(
                              emailController.text, passwordController.text),
                        );
                      }
                      print("DONE!!!");
                    },
                    child: Container(
                      height: 50,
                      width: 200,
                      decoration: BoxDecoration(
                        color: state is SignInValidState
                            ? Colors.blue
                            : Colors.grey,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Center(child: Text("login")),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
