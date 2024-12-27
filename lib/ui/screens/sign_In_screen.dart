import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/controller/auth_controller.dart';
import 'package:task/ui/screens/user_dashboard.dart';
import '../widgets/custom_elevated_button.dart';
import '../widgets/custom_text_editor.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: GetBuilder<AuthController>(builder: (auth) {
        return Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 32,),
                const Text(
                  'Welcome',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 26,
                      fontWeight: FontWeight.w900),
                ),
                const SizedBox(
                  height: 4,
                ),
                const Text(
                  'Log in to your account using email',
                  style: TextStyle(
                      color: Colors.black38,
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 40,
                ),
                CustomTextEditor(
                  controller: _emailTEController,
                  hintText: 'Enter Email',
                  textInputAction: TextInputAction.next,
                  icon: Icons.email_outlined,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Your Email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                CustomTextEditor(
                  controller: _passwordTEController,
                  hintText: 'Enter Password',
                  textInputAction: TextInputAction.done,
                  icon: Icons.lock_outline,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Your Password';
                    }
                    return null;
                  },
                  isPass: true,
                ),
                const SizedBox(height: 36.0),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Visibility(
                    visible: !auth.isLoading,
                    replacement: const Center(
                      child: CircularProgressIndicator(),
                    ),
                    child: CustomElevatedButton(
                      text: 'Login',
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          var userEmail = _emailTEController.text.toString();
                          var pass = _passwordTEController.text.toString();

                          var isSuccess = await auth.userLogin(userEmail, pass);

                          if (isSuccess) {
                            Get.offAll(const DashboardScreen());
                          }
                        }
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account?",
                      style: TextStyle(color: Colors.black26, fontSize: 14),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const DashboardScreen()),
                          );
                        },
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(color: Colors.black, fontSize: 14),
                        )),
                  ],
                )
              ],
            ),
          ),
        );
      })),
    );
  }
}
