import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:shamo_app/application/sign_up/cubit/signup_cubit.dart';
import 'package:shamo_app/config/input_validation_mixin.dart';
import 'package:shamo_app/domain/sign_up/sign_up_request.dart';
import 'package:shamo_app/presentation/user.dart/login_page.dart';
import 'package:shamo_app/provider/user_provider.dart';
import 'package:shamo_app/widget/navigation.dart';
import 'package:shamo_app/widget/text_field.dart';
import 'package:shamo_app/theme.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});
  static const routeName = '/sign-up';

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> with InputValidationMixin {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _fullnameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(),
      child: BlocConsumer<SignupCubit, SignUpState>(
        listener: (context, state) {
          // TODO: implement listener
          if (state is SignUpLoading) {
            print("Sign Up Loading....");
          } else if (state is SignUpSuccess) {
            print(state.signUpResponse.toJson());
            // context.read<UserProvider>().setUserData(
            //       state.signUpResponse.user!.name.toString(),
            //       state.signUpResponse.user!.email.toString(),
            //       state.signUpResponse.user!.username.toString(),
            //       state.signUpResponse.access_token.toString(),
            //       state.signUpResponse.user!.imageProfile.toString(),
            //     );
            context.read<UserProvider>().UserData(state.signUpResponse.user!);
            Get.offAll(() => Navigation());
          } else if (state is SignUpError) {
            print(state.errMessage);
            showDialog(
              context: context,
              builder: (_) => AlertDialog(
                backgroundColor: bgColor1,
                title: Text(
                  "Sign Up Failed",
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
                              'Sign Up',
                              style: primaryTextStyle.copyWith(
                                fontSize: 24,
                                fontWeight: light,
                              ),
                            ),
                            Text(
                              'Register and Happy Shopping',
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
                              'Fullname',
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
                              validatorField: (fullname) {
                                if (isFullnameValid(fullname!)) {
                                  return null;
                                } else if (fullname.isEmpty) {
                                  return 'Fullname is mandatory field';
                                }
                                return 'Fullname must be less than 50 character';
                              },
                              hintText: 'Your Full Name',
                              iconField: Icons.person,
                              obsText: false,
                              textController: _fullnameController,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Username',
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
                              validatorField: (username) {
                                if (isUsernameValid(username!)) {
                                  return null;
                                } else if (username.isEmpty) {
                                  return 'Username is mandatory field';
                                }
                                return 'Username must be more than 5 and less than 10 character';
                              },
                              hintText: 'Your Username',
                              iconField: Icons.adjust_rounded,
                              obsText: false,
                              textController: _usernameController,
                            ),
                            SizedBox(
                              height: 20,
                            ),
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
                              hintText: 'Your Email Address',
                              iconField: Icons.email_rounded,
                              obsText: false,
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
                              hintText: 'Your Password',
                              iconField: Icons.lock_rounded,
                              obsText: true,
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
                                  // print(_usernameController.text);
                                  if (_formKey.currentState!.validate()) {
                                    //process sign in
                                    // ScaffoldMessenger.of(context).showSnackBar(
                                    //   SnackBar(
                                    //     backgroundColor: Colors.green,
                                    //     content: Row(
                                    //       mainAxisAlignment: MainAxisAlignment.start,
                                    //       children: [
                                    //         CircularProgressIndicator(),
                                    //         SizedBox(
                                    //           width: 10,
                                    //         ),
                                    //         Text("Processing Data"),
                                    //       ],
                                    //     ),
                                    //   ),
                                    // );
                                    SignUpRequest _signUpRequest =
                                        SignUpRequest();
                                    _signUpRequest.name =
                                        _fullnameController.text;
                                    _signUpRequest.email =
                                        _emailController.text;
                                    _signUpRequest.username =
                                        _usernameController.text;
                                    _signUpRequest.password =
                                        _passController.text;
                                    context
                                        .read<SignupCubit>()
                                        .signUpUser(_signUpRequest);
                                  }
                                },
                                child: (state is SignUpLoading)
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
                                        "Sign Up",
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
                                    'Already Have an Account ?',
                                    style: secondaryTextStyle.copyWith(
                                      fontSize: 12,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Get.toNamed(LoginPage.routeName);
                                    },
                                    child: Text(
                                      'Sign In',
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
