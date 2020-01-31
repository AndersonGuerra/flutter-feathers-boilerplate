import 'package:mobx/mobx.dart';
part 'login_form.g.dart';

class LoginForm = _LoginFormBase with _$LoginForm;

abstract class _LoginFormBase with Store {
  @observable
  String email = 'a@a.com';
  @action
  changeEmail(String newEmail) => email = newEmail;

  @observable
  String password = '123@mudar';
  @action
  changePassword(String newPassword) => password = newPassword;
}