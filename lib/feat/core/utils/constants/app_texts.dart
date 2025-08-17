class AppTexts {
  // app pages id's here
  static const String signInPage = 'sign_in';
  static const String signUpPage = 'sign_up';
  static const String homePageId = 'home';

  // json keys for auth
  static const String emailKey = 'email';
  static const String passwordKey = 'password';
  static const String idKey = 'id';
  static const String token = 'token';

  // form field texts
  static const String formValidatorMessage = 'This field cannot be empty';
  static const String emptyEmailMessage = 'Email cannot be empty';
  static const String notDefinedEmailMessage = 'Email is not defined correctly';
  static const String emptyPasswordMessage = 'Password cannot be empty';
  static String minLengthPasswordMessage(int minLength) =>
      'Password must be at least $minLength characters long';
  static const authRegExp = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
  static const String email = 'Email';
  static const String password = 'Password';
  static const String forgetPassword = 'Forgot Password?';
  static const String signUp = 'Sign Up';
  static const String signIn = "Sign In";
  static const String dontHaveAccount = "Don't have an account? ";
  static const String alreadyHaveAccount = 'Already have an account?';
  static const String emptyConfirmPasswordMessage =
      'Confirm Password cannot be empty';
  static const String notMatchConfirmPasswordMessage = 'Passwords do not match';
  static const String confirmPassword = 'Confirm Password';

  // sign in page texts
  static const String welcome = 'Welcome';
  static const String signUpToContinue = 'Sign Up to continue to Recipe App';

  // auth cubit texts
  static const String reqresEmail = 'eve.holt@reqres.in';
  static const String emailNotRegistered = 'Email is not registered';
  static const String signUpSuccess = 'Sign up successful:';
  static const String anErrorOccurred = 'An error occurred : ';
}
