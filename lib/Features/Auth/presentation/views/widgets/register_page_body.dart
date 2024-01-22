import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:movie_app/Features/Auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:movie_app/Features/Auth/presentation/views/login_page.dart';
import 'package:movie_app/Features/Auth/presentation/views/widgets/custom_button.dart';
import 'package:movie_app/Features/Auth/presentation/views/widgets/custom_text_field.dart';

import '../../../../../core/utils/app_router.dart';

class RegisterPageBody extends StatefulWidget {
  RegisterPageBody({super.key});

  @override
  State<RegisterPageBody> createState() => _RegisterPageBodyState();
}

class _RegisterPageBodyState extends State<RegisterPageBody> {
  bool obscureText = true;

  String? email;

  String? password;

  bool isLoading = false;

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is RegisterLoading) {
          isLoading = true;
        } else if (state is RegisterSuccess) {
          // Navigator.push(
          //     context, MaterialPageRoute(builder: (context) => MovieHome()));
          GoRouter.of(context).push(AppRouter.kHomeView);

          isLoading = false;
        } else if (state is RegisterFailure) {
          showSnackBar(context, state.errorMessage);
          isLoading = false;
        }
      },
      builder: (context, state) {
        return BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is RegisterLoading) {
              isLoading = true;
            } else if (state is RegisterSuccess) {
              isLoading = false;
            } else if (state is RegisterFailure) {
              showSnackBar(context, state.errorMessage);
              isLoading = false;
            }
          },
          builder: (context, state) {
            return LoadingOverlay(
              isLoading: isLoading,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
                child: Form(
                  key: formKey,
                  child: ListView(
                    children: [
                      Image.asset(
                        'assets/images/kk.png',
                        height: 200,
                      ),
                      const Center(
                        child: Text(
                          'SIGN UP',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 75,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomFormTextField(
                        onChanged: (data) {
                          email = data;
                        },
                        hintText: 'Email',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomFormTextField(
                        onChanged: (data) {
                          password = data;
                        },
                        hintText: 'Password',
                        pass: obscureText,
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              obscureText = !obscureText;
                            });
                          },
                          icon: Icon(
                            obscureText
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      CustomButton(
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              BlocProvider.of<AuthCubit>(context).registerUser(
                                  email: email!, password: password!);
                            }
                          },
                          buttonName: 'REGISTER'),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'already have an account?',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginPage(),
                                ),
                              );
                            },
                            child: const Text(
                              '  Login',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: const Color(0xff2f2e30),
      content: Text(
        message,
        style: const TextStyle(color: Colors.white),
      ),
    ),
  );
}
