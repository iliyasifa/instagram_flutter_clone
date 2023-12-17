import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:instagram_flutter_clone/utils/colors.dart';
import 'package:instagram_flutter_clone/widgets/text_field_input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(child: Container()),
              SvgPicture.asset(
                'assets/ic_instagram.svg',
                height: 64,
                colorFilter: const ColorFilter.mode(
                  primaryColor,
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(height: 64),
              TextFieldInput(
                textEditingController: _emailController,
                textInputType: TextInputType.emailAddress,
                hintText: 'enter your email',
              ),
              const SizedBox(height: 24),
              TextFieldInput(
                textEditingController: _passwordController,
                textInputType: TextInputType.visiblePassword,
                hintText: 'enter your password',
                isPass: true,
              ),
              const SizedBox(height: 24),
              InkWell(
                onTap: () {},
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: const ShapeDecoration(
                    color: blueColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                    ),
                  ),
                  child: const Text('Log in'),
                ),
              ),
              const SizedBox(height: 12),
              Flexible(child: Container()),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: const Text('Don\'t have an account'),
                  ),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: const Text(
                        'Sign up.',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}
