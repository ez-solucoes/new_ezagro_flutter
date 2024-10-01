import 'package:mobx/mobx.dart';

part 'login_controller.g.dart';

class LoginController = LoginControllerAbstract with _$LoginController;

abstract class LoginControllerAbstract with Store{

  @observable
  bool isLoading = false;

}