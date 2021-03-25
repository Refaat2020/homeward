import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:homeward/constant/saveToken.dart';
import 'package:homeward/logic/services/utilitis.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  UtilitiesService post = UtilitiesService();

  Future  login(String email , String password,)async{
    try {
      emit(LoginLoading());
      await post.postWithParams("login", {
        "email" : email,
        "password" : password,
      }).then((response) {
        print(response.statusCode);
        if (response != null && response.statusCode == 201) {
          print("$response*********");
          final responseJson = json.decode(response.body);
          print(responseJson);
          saveCurrentLogin(responseJson['token']);
          emit(LoginDone());
        }
      });
    } catch (e) {
      emit(LoginFailed(
          error: e.toString()
      ));
    }

  }
  }
