import 'package:bloc_test/bloc_test.dart';
import 'package:homeward/logic/cubit/login_cubit.dart';
import 'package:test/test.dart';

void main() {
  group('LoginCubit', () {
    LoginCubit loginCubit;

    setUp(() {
      loginCubit = LoginCubit();
    });

    tearDown(() {
      loginCubit.close();
    });

    test('initial state of loginCubit is LoginState()', () {
      expect(loginCubit.state, LoginInitial());
    });

    blocTest(
        'the LoginCubit should emit a LoginLoading when the login function is called',
        build: () => loginCubit,
        act: (cubit) => loginCubit.login("refaat@gmail.com","123456",),
        expect: [LoginLoading(),LoginDone(),]);

  });
}