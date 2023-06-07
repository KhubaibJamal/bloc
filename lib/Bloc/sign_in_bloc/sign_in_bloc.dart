import 'package:bloc_example/Bloc/sign_in_bloc/sign_in_event.dart';
import 'package:bloc_example/Bloc/sign_in_bloc/sign_in_state.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitialState()) {
    on<SignInTextChangedEvent>((event, emit) {
      // email is not valid
      if (EmailValidator.validate(event.emailValue) == false) {
        emit(SignInErrorState("Please enter a valid email"));
      } else if (event.passwordValue.length < 8) {
        // password must contained 8 characters
        emit(SignInErrorState("please enter a valid password"));
      } else {
        // all okay
        emit(SignInValidState());
      }
    });
    on<SignInSubmittedEvent>((event, emit) {
      // when button press
      emit(SignInLoadingState());
    });
  }
}
