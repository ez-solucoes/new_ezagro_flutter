abstract class DatasourceConfig{
  String get apiScheme;
  String get apiAuthority;

  //Feature toggles variables
bool get isSendFeedbackEnabled;
}