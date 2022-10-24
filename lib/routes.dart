import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:mega_market/core/middleware/middleware.dart';
import 'package:mega_market/view/screens/auth/change_password_screen.dart';
import 'package:mega_market/view/screens/auth/forget_password/reset_password_with_emai.dart';
import 'package:mega_market/view/screens/auth/forget_password/reset_password_with_sms.dart';
import 'package:mega_market/view/screens/auth/opt_verification_code/opt_email_code.dart';
import 'package:mega_market/view/screens/auth/opt_verification_code/opt_phone_code.dart';
import 'package:mega_market/view/screens/auth/signin_screen.dart';
import 'package:mega_market/core/constants/routes.dart';
import 'package:mega_market/view/screens/auth/signup_screen.dart';
import 'package:mega_market/view/screens/auth/terms_conditions.dart';
import 'package:mega_market/view/screens/home_layout/home_layout.dart';
import 'package:mega_market/view/screens/onboarding.dart';


List<GetPage<dynamic>>? routes = [
  GetPage( name: "/", page: () => OnBoardingPage(), middlewares: [MyMiddleWare()]),
  GetPage(name: AppRoute.signin, page: () => SigninPage()),
  GetPage(name: AppRoute.signup, page: () => SignupPage()),
  GetPage(name: AppRoute.home, page: () => HomePage()),
  GetPage(name: AppRoute.changePassword, page: () => ChangePasswordPage()),
  GetPage(
      name: AppRoute.resetPasswordWithEmail,
      page: () => ResetPasswordWithEmail()),
  GetPage(
      name: AppRoute.optVerificationCodeEmail,
      page: () => OTPVerificationWithEmail()),
  GetPage(
      name: AppRoute.resetPasswordWithPhone,
      page: () => ResetPasswordWithPhone()),
  GetPage(
      name: AppRoute.optVerificationCodePhone,
      page: () => OTPVerificationWithPhone()),
  GetPage(name: AppRoute.terms, page: () => TermsAndConditions()),
];
