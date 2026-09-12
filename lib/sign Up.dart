import 'package:flutter/material.dart';
import 'SocialButton.dart';
import 'or_divider.dart';
import 'TextField.dart';
import 'package:go_router/go_router.dart';
class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State <SignUpPage> createState() => _LoginPageState();
}
class _LoginPageState extends State<SignUpPage>{
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isAccepted = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child:Form(
          key:formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Hey Hello 👋',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Enter your credentials to access \n your account',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 20,
                fontWeight: FontWeight.bold,

              ),
            ),
            const SizedBox(height:25),
            Row(
            children:[
              Expanded(
            child:
            SocialButton(
              text:'Google',
              icon:Icons.g_mobiledata_sharp,
            ),
              ),
            const SizedBox(width:10),
              Expanded(
              child:
              SocialButton(
              text: 'Apple',
              icon: Icons.apple,
            ),
              ),
            ],
            ),
            const SizedBox(height: 22),

            const OrDivider(),

            const SizedBox(height: 22),
             const Text(
               'Name',
               style: TextStyle(
                 color: Colors.white,
                 fontSize: 20,
               ),
             ),
             CustomtextField(hintText: '',
              controller: nameController,
               validator: (value) {
                 if (value == null || value.isEmpty) {
                   return 'Plase enter your name';
                 }
                 return null;
               },
            ),
            const SizedBox(height:15),
             const Text(
               'Email Address',
               style: TextStyle(
                 color: Colors.white,
                 fontSize: 20,
               ),
             ),
             CustomtextField(hintText: '',
             controller : emailController ,
               validator: (value) {
               if (value == null || value.isEmpty){
                 return 'Plase enter your email';
               }
               if (!value.contains('@')){
                 return 'Plase enter a valid email';
               }
               return null;
               }
             ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            const Text(
              'Password',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            const Text(
              'Forget password?',
              style: TextStyle(
                color: Color(0xFF0D9EFF),
              ),
            ),
            ],
            ),
            const SizedBox(height: 8,),
            CustomtextField(hintText: '',
            obscureText: true,
              controller: passwordController,
              validator: (value){
              if (value == null || value.isEmpty){
                return 'Please enter your password';
              }
              if (!RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$').hasMatch(value)){
                return 'Password must be at least 8 character & contain a number';
              }
              return null ;
              }
            ),
            const SizedBox(height: 8,),

            Row(
              children: [
                GestureDetector(
                  onTap: (){
                    setState((){
                      isAccepted = !isAccepted;
                    });
                  },
                  child: Container(
                    width: 18,
                    height: 18,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isAccepted? const Color(0xFF0D9EFF) :Colors.transparent,
                      border: Border.all(
                        color: isAccepted ? const Color(0xFF0D9EFF):   Colors.white54,
                      ),
                    ),
                  ),
                ),
          const SizedBox(width: 8,),
            const Text(
              'I agree to the Terms & Conditions',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 15,
              ),
            ),
            ],
            ),

            const SizedBox(height :20),
            SizedBox(
            width: double.infinity,
              height: 50,
              child:ElevatedButton(
                onPressed:(){
                  if (formKey.currentState!.validate()){
                print('Login Successful');
                }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF0D9EFF),
                ),
              child: const Text(
                  'Sign Up',
              style:TextStyle(
                  color:Colors.white,
                fontSize:18,
                fontWeight: FontWeight.bold,
              ),
              ),
            ),
            ),
            const SizedBox(height: 30),
            Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
              "Do you have an account ? ",
              style: TextStyle(
                color: Colors.white70,
                fontSize: 20,
              ),
              ),
              GestureDetector(
              onTap: () {
                context.go('/signIn');

              },
                child: const Text(
                  'SignIn',
                  style: TextStyle(
                    color: Color(0xFF0D9EFF),
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
          ],
        ),
            const SizedBox(height: 80),
            const Center(
              child: Text(
                'Made by Hamza Badr',
                style: TextStyle(
                  color: Colors.white54,
                  fontSize: 15,
                ),
              ),
            )
          ],
        ),
      ),
      ),
      ),
    );
  }
  @override
void dispose(){
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}