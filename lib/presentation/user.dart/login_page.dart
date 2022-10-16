import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:shamo_app/application/auth/cubit/auth_cubit.dart';
import 'package:shamo_app/config/input_validation_mixin.dart';
import 'package:shamo_app/domain/auth/model/login_request.dart';
// import 'package:shamo_app/presentation/landing_page/home.dart';
import 'package:shamo_app/presentation/user.dart/signup_page.dart';
import 'package:shamo_app/provider/user_provider.dart';
import 'package:shamo_app/theme.dart';
import 'package:shamo_app/widget/navigation.dart';
import 'package:shamo_app/widget/text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  static const routeName = '/log-in';
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with InputValidationMixin {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  final _passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthLoading) {
            print("Sign In Loading....");
          } else if (state is AuthSuccess) {
            print(state.loginResponse.toJson());
            // context.read<UserProvider>().setUserData(
            //       state.loginResponse.user!.name.toString(),
            //       state.loginResponse.user!.email.toString(),
            //       state.loginResponse.user!.username.toString(),
            //       state.loginResponse.access_token.toString(),
            //       state.loginResponse.user!.imageProfile.toString(),
            //     );
            // state.loginResponse
            context.read<UserProvider>().UserData(state.loginResponse.user!);
            Get.offAll(() => Navigation());
          } else if (state is AuthError) {
            print(state.errMessage);
            showDialog(
              context: context,
              builder: (_) => AlertDialog(
                backgroundColor: bgColor1,
                title: Text(
                  "Sign In Failed",
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: bold,
                  ),
                ),
                content: Text(
                  state.errMessage,
                  style: primaryTextStyle.copyWith(
                    fontSize: 12,
                  ),
                ),
              ),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Theme.of(context).colorScheme.background,
            body: SingleChildScrollView(
              child: SafeArea(
                child: Container(
                  // color: Colors.red,
                  // alignment: Alignment.topLeft,
                  padding: EdgeInsets.only(
                    top: 50,
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  // width: double.infinity,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisSize: MainAxisSize.min,
                      children: [
                        Column(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Login',
                              style: primaryTextStyle.copyWith(
                                fontSize: 24,
                                fontWeight: light,
                              ),
                            ),
                            Text(
                              'Sign in to continue',
                              style: secondaryTextStyle.copyWith(
                                fontSize: 14,
                                fontWeight: light,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 100,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Email Address',
                              style: primaryTextStyle.copyWith(
                                fontSize: 16,
                                fontWeight: medium,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFieldWidget(
                              context,
                              validatorField: (email) {
                                if (isEmailValid(email!)) {
                                  return null;
                                } else if (email.isEmpty) {
                                  return 'Email is mandatory field';
                                }
                                return 'Email is invalid';
                                ;
                              },
                              colorFieldFill: true,
                              hintText: 'Your Email Address',
                              obsText: false,
                              iconField: Icons.email_rounded,
                              // iconField: ImageIcon(image)
                              textController: _emailController,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Password',
                              style: primaryTextStyle.copyWith(
                                fontSize: 16,
                                fontWeight: medium,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFieldWidget(
                              context,
                              validatorField: (password) {
                                if (isPasswordValid(password!)) {
                                  return null;
                                } else if (password.isEmpty) {
                                  return 'Password is mandatory field';
                                }
                                return 'Password minimal 8 character';
                              },
                              colorFieldFill: true,
                              hintText: 'Your Password',
                              obsText: true,
                              iconField: Icons.lock_rounded,
                              textController: _passController,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              // color: Colors.red,
                              width: double.infinity,
                              height: 60.0,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                    primaryColor,
                                  ),
                                  shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      // side: BorderSide
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  // print(_emailController.text);
                                  // print(_passController.text);
                                  if (_formKey.currentState!.validate()) {
                                    LoginRequest _loginRequest = LoginRequest();
                                    _loginRequest.email = _emailController.text;
                                    _loginRequest.password =
                                        _passController.text;
                                    print(_loginRequest.toJson());
                                    context
                                        .read<AuthCubit>()
                                        .signInUser(_loginRequest);
                                  }
                                },
                                child: (state is AuthLoading)
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          CircularProgressIndicator(),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            "Loading",
                                            style: primaryTextStyle,
                                          )
                                        ],
                                      )
                                    : Text(
                                        "Sign In",
                                        style: primaryTextStyle,
                                      ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              // color: Colors.red,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                // crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                    'Dont Have an Account ?',
                                    style: secondaryTextStyle.copyWith(
                                      fontSize: 12,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Get.toNamed(SignUpPage.routeName);
                                    },
                                    child: Text(
                                      'Sign Up',
                                      style: primaryTextStyle.copyWith(
                                        fontSize: 12,
                                        color: primaryColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
