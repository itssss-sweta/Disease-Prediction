import 'package:dis_pred/core/constants/colors.dart';
import 'package:dis_pred/core/constants/sizedbox.dart';
import 'package:dis_pred/core/constants/textstyle.dart';
import 'package:dis_pred/features/authentication/presentation/ui/components/border.dart';
import 'package:dis_pred/features/authentication/presentation/ui/components/buttons.dart';
import 'package:dis_pred/features/authentication/presentation/ui/components/textfields.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController number = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SignBorder(
      title: 'Sign Up',
      widget: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/dna.png',
            height: 70,
          ),
          xsHeight,
          Text(
            'PredictWell',
            style: semibold16t,
          ),
          xxlHeight,
          TextContainer(
            controller: name,
            hintText: 'Enter your name',
            icon: Icons.person,
            suffix: false,
            type: TextInputType.name,
          ),
          TextContainer(
            controller: email,
            hintText: 'Enter your email',
            icon: Icons.email_outlined,
            suffix: false,
            type: TextInputType.emailAddress,
          ),
          TextContainer(
            controller: number,
            hintText: 'Enter your number',
            icon: Icons.phone_outlined,
            suffix: false,
            type: TextInputType.number,
          ),
          TextContainer(
            controller: password,
            hintText: 'Enter your password',
            icon: Icons.lock_outlined,
            suffix: true,
            type: TextInputType.visiblePassword,
            obscureText: true,
          ),
          sHeight,
          Center(
            child: Button(
              text: 'Sign Up',
              color: teal,
              textStyle: semibold16w,
              onTap: () {},
            ),
          ),
          // Center(
          //   child: RichText(
          //     text: TextSpan(
          //       text: 'Don\'t have an Account?',
          //       children: [
          //         TextSpan(
          //           text: ' Sign Up',
          //           style: medium15t,
          //           recognizer: TapGestureRecognizer()
          //             ..onTap = () {
          //               log('text tapped');
          //             },
          //         ),
          //       ],
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
