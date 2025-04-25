String checkAuthFields(String? email, String? password) {
  String error = '';
  if (email == null || password == null) {
    error = 'Fields are required!';
  } else if (email.isEmpty) {
    error = 'Email est obligatoire!';
  } else if (password.isEmpty) {
    error = 'Mot de passe est obligatoire!';
  }

  return error;
}

String checkField(String key, String? field) {
  String error = '';
  if (field == null) {
    error = '$key est obligatoire!';
  } else if (field.isEmpty) {
    error = '$key est obligatoire!';
  }

  return error;
}
