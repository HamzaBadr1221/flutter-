import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'app_assets.dart';
import 'TextField.dart';
import 'or_divider.dart';
import 'SocialButton.dart';
import 'cubit/theme_cubit.dart';
import 'cubit/theme_state.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        final isDark = state.isDark;
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Switch(
                          value: state.isDark,
                          onChanged: (value) {
                            context.read<ThemeCubit>().toggleTheme();
                          },
                          activeColor: const Color(0xFF0D9EFF),
                          activeTrackColor:
                          const Color(0xFF0D9EFF).withOpacity(0.4),
                          inactiveThumbColor: Colors.grey,
                          inactiveTrackColor:
                          Colors.grey.withOpacity(0.4),
                        ),
                        const SizedBox(width: 5),
                        Icon(
                          state.isDark
                              ? Icons.dark_mode
                              : Icons.light_mode,
                          color: state.isDark
                              ? Colors.white
                              : Colors.black,
                          size: 25,
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Image.asset(
                      AppAssets.taskImage,
                      width: double.infinity,
                      fit: BoxFit.contain,
                    ),

                    const SizedBox(height: 25),

                    Text(
                      "Let's connect with Us!",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 20),

                    CustomtextField(
                      hintText: 'Email Address',
                      controller: emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }

                        if (!value.contains('@')) {
                          return 'please enter a valid email';
                        }

                        return null;
                      },
                    ),

                    const SizedBox(height: 15),

                    CustomtextField(
                      hintText: 'password',
                      obscureText: true,
                      controller: passwordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }

                        if (!RegExp(
                          r'^(?=.[A-Za-z])(?=.\d)[A-Za-z\d]{8,}$',
                        ).hasMatch(value)) {
                          return 'Password must be at least 8 character & contain a number';
                        }

                        return null;
                      },
                    ),

                    const SizedBox(height: 7),

                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Forget password ?',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onSurface,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),

                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Login Successful'),
                                backgroundColor: Colors.green,
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        child: const Text(
                          'Log in',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    const OrDivider(),

                    const SizedBox(height: 20),

                    const SocialButton(
                      text: 'Continue with Google',
                      icon: Icons.g_mobiledata_sharp,
                    ),

                    const SizedBox(height: 15),

                    const SocialButton(
                      text: 'Continue with Apple',
                      icon: Icons.apple,
                    ),

                    const SizedBox(height: 20),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account? ",
                          style: TextStyle(
                            color: Theme.of(context)
                                .colorScheme
                                .onSurface
                                .withOpacity(0.6),
                            fontSize: 14,
                          ),
                        ),

                        GestureDetector(
                          onTap: () {
                            context.go('/signUp');
                          },
                          child: const Text(
                            'SignUp',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}