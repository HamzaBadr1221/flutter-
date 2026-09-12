import 'package:flutter/material.dart';
import 'package:untitled5/TextField.dart';
import 'app_assets.dart';
import 'TextField.dart';
import 'or_divider.dart';
import 'SocialButton.dart';
import 'package:go_router/go_router.dart';
class SignInPage extends StatefulWidget{
  const SignInPage({super.key});
  @override
  State<SignInPage>createState() => _SignInPageState();
  }

  class _SignInPageState extends State<SignInPage>{
  final emailController =TextEditingController();
  final passwordController=TextEditingController();
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(AppAssets.taskImage,
            width: double.infinity,
            fit: BoxFit.contain,
              ),
              const SizedBox(height: 40),
               const Text(
                 "Let's connect with Us!",
                 style: TextStyle(
                   color: Colors.white,
                   fontSize: 30,
                   fontWeight: FontWeight.bold,
                 ),
               ),
              const SizedBox(height: 20),
          CustomtextField(hintText:'Email Address',
          controller: emailController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
                if (!value.contains('@')) {
                  return 'please enter a valid email';
                }
                return null;
              }
          ),
          const SizedBox(height: 15),
          CustomtextField(hintText: 'password',
              obscureText: true,
              controller: passwordController,
            validator: (value){
            if (value == null || value.isEmpty){
              return 'Please enter your password';
            }
             if (!RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$').hasMatch(value)) {
               return 'Password must be at least 8 character & contain a number';
             }
              return null;
            },
      ),
const SizedBox(height: 8),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(onPressed: () {},
                child: const Text(
                  'Forget password ?',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
                ),
              ),
              const SizedBox(height: 15),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(onPressed: (){},
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
              const SizedBox(height: 25),

              const OrDivider(),

             const SizedBox(height:25),

              SocialButton(
                  text: 'Continue with Google',
                   icon:Icons.g_mobiledata_sharp,
              ),
          const SizedBox(height: 15),
          SocialButton(
          text: 'Continue with Apple',
              icon :Icons.apple,
          ),
              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account? ",
                    style: TextStyle(
                      color: Colors.white54,
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
            ],
          ),
        ),
      ),
    );
  }
  }