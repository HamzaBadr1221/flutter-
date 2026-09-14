import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'SocialButton.dart';
import 'or_divider.dart';
import 'TextField.dart';
import 'cubit/theme_cubit.dart';
import 'cubit/theme_state.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<SignUpPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  bool isAccepted = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Row(
                   mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Hey Hello 👋',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  const SizedBox(width: 125 ),
                  Switch(
                    value: state.isDark,
                    onChanged: (value){
                      context.read<ThemeCubit>().toggleTheme();
                    },
                    activeColor:Colors.blue,
                    activeTrackColor:
                      Colors.blue.withOpacity(0.4),
                    inactiveThumbColor: Colors.grey,
                    inactiveTrackColor: Colors.grey.withOpacity(0.4),
                  ),
                    Icon(
                      state.isDark
                          ? Icons.dark_mode
                          :Icons.light_mode,
                      color: state.isDark
                        ?
                          Colors.white
                      :Colors.black,
                      size: 25,
                    ),
                    ],
                ),
                    const SizedBox(height: 10),

                    Text(
                      'Enter your credentials to access \n your account',
                      style: TextStyle(
                        color: Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withOpacity(0.7),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 25),

                    Row(
                      children: [
                        Expanded(
                          child: SocialButton(
                            text: 'Google',
                            icon: Icons.g_mobiledata_sharp,
                          ),
                        ),

                        const SizedBox(width: 10),

                        Expanded(
                          child: SocialButton(
                            text: 'Apple',
                            icon: Icons.apple,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 22),

                    const OrDivider(),

                    const SizedBox(height: 22),

                    Text(
                      'Name',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface,
                        fontSize: 20,
                      ),
                    ),

                    CustomtextField(
                      hintText: '',
                      controller: nameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Plase enter your name';
                        }

                        return null;
                      },
                    ),

                    const SizedBox(height: 15),

                    Text(
                      'Email Address',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface,
                        fontSize: 20,
                      ),
                    ),

                    CustomtextField(
                      hintText: '',
                      controller: emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Plase enter your email';
                        }

                        if (!value.contains('@')) {
                          return 'Plase enter a valid email';
                        }

                        return null;
                      },
                    ),

                    const SizedBox(height: 15),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Password',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onSurface,
                            fontSize: 20,
                          ),
                        ),

                        Text(
                          'Forget password?',
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 8),

                    CustomtextField(
                      hintText: '',
                      obscureText: true,
                      controller: passwordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }

                        if (!RegExp(
                          r'^.{8,}$',)
                        .hasMatch(value)) {
                          return 'Password must be at least 8 character ';
                        }

                        return null;
                      },
                    ),

                    const SizedBox(height: 8),

                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isAccepted = !isAccepted;
                            });
                          },
                          child: Container(
                            width: 18,
                            height: 18,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: isAccepted
                                  ? const Color(0xFF0D9EFF)
                                  : Colors.transparent,
                              border: Border.all(
                                color: isAccepted
                                    ? const Color(0xFF0D9EFF)
                                    : Theme.of(context)
                                    .colorScheme
                                    .onSurface
                                    .withOpacity(0.5),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(width: 8),

                        Text(
                          'I agree to the Terms & Conditions',
                          style: TextStyle(
                            color: Theme.of(context)
                                .colorScheme
                                .onSurface
                                .withOpacity(0.7),
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Sign Up Successful'),
                                backgroundColor: Colors.green,
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF0D9EFF),
                        ),
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Do you have an account ? ",
                          style: TextStyle(
                            color: Theme.of(context)
                                .colorScheme
                                .onSurface
                                .withOpacity(0.7),
                            fontSize: 20,
                          ),
                        ),

                        GestureDetector(
                          onTap: () {
                            context.go('/signIn');
                          },
                          child: Text(
                            'SignIn',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 80),

                    Center(
                      child: Text(
                        'Made by Hamza Badr',
                        style: TextStyle(
                          color: Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withOpacity(0.5),
                          fontSize: 15,
                        ),
                      ),
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
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}