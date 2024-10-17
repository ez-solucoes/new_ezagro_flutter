class TextValidator {

  bool emailValidator(String email) {
    if (RegExp(
            r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)+\.*$")
        .hasMatch(email)) {
      return true;
    } else {
      return false;
    }
  }

  bool passwordValidator(String input) {
    if (!RegExp(r'^(?!\s*$).+').hasMatch(input)) {
      return false;
    } else {
      return true;
    }
  }


  bool cpfValidator(String cpf) {
    if (RegExp(
        r"^(\d{3}\.\d{3}\.\d{3}-\d{2}|\d{3}\d{3}\d{3}\d{2})$")
        .hasMatch(cpf)) {
      return true;
    } else {
      return false;
    }
  }

  bool cnpjValidator(String cnpj) {
    if (RegExp(r"^(\d{2}\.\d{3}\.\d{3}/\d{4}-\d{2}|\d{2}\d{3}\d{3}\d{4}\d{2})$")
        .hasMatch(cnpj)) {
      return true;
    } else {
      return false;
    }

  }


}
