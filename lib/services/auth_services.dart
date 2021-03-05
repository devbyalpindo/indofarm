part of 'services.dart';

class AuthServices {

  // static final String _loginURL = siteURL + '/api/auth/login';
  static final String _registerURL = siteURL + '/api/auth/register';

  static Future<ResponseHandler> signUp(Auth auth) async {
    FormData registerData = FormData.fromMap({
      'name': auth.name,
      'email': auth.email,
      'password': auth.password,
      'phone_number': auth.phoneNumber,
    });

    final response = await Dio().post(_registerURL, data: registerData, options: Options(followRedirects: false, validateStatus: (status) { return status < 500; }));
    final json = response.data;

    if (response.statusCode == 200) {
      User user = User.fromJson(json['user']);

      // SharedPreferences preferences = await SharedPreferences.getInstance();
      // preferences.setString('token', json['token']);
      // preferences.setInt('id', json['user']['id']);

      return ResponseHandler(
        user: user,
        message: json['message'],
      );
    } else if (response.statusCode == 422) {
      if (json['errors']['name'] != null) {
        return ResponseHandler(
          errors: "Min length name is 3",
        );
      } else if (json['errors']['phone_number'] != null) {
        return ResponseHandler(
          errors: "Phone number has already registered",
        );
      } else {
        return ResponseHandler(
          errors: "Max size image file id 5 MB",
        );
      }
    } else {
      return ResponseHandler(
        errors: "Email has already registered",
      );
    }
  }
}