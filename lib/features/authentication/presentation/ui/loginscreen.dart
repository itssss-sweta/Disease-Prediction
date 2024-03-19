import 'dart:convert';
import 'dart:developer';
import 'package:dis_pred/config/routes/route.dart';
import 'package:dis_pred/core/constants/colors.dart';
import 'package:dis_pred/core/constants/sizedbox.dart';
import 'package:dis_pred/core/constants/textstyle.dart';
import 'package:dis_pred/features/authentication/presentation/ui/components/authentication_screens_border_layout.dart';
import 'package:dis_pred/features/authentication/presentation/ui/components/buttons.dart';
import 'package:dis_pred/features/authentication/presentation/ui/components/textfields.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

/// Login Screen to enter email and password for authentication
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController name = TextEditingController();
  final TextEditingController password = TextEditingController();
  // final TextEditingController number = TextEditingController();

  Future<bool> loginUser() async {
    final String username = name.text;
    final String pw = password.text;
    log('tapped');
    final response = await http.post(
      Uri.parse('http://192.168.1.69:8000/api/login/'),
      body: jsonEncode({
        'username': username,
        'password': pw,
      }),
      headers: {'Content-Type': 'application/json'},
    );
    log(response.body);
    log(response.statusCode.toString());
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SignBorderLayout(
      title: 'Login',
      widget: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/dna.png',
            height: 70,
          ),
          SizedBoxHeightAndWidth.sizedBoxHeight5,
          Text(
            'PredictWell',
            style: TextStyleCustomized.semibold16teal,
          ),
          SizedBoxHeightAndWidth.sizedBoxHeight35,
          TextContainer(
            controller: name,
            hintText: 'Enter your username',
            icon: Icons.person,
            suffix: false,
            type: TextInputType.name,
          ),
          TextContainer(
            controller: password,
            hintText: 'Enter your password',
            icon: Icons.lock_outlined,
            suffix: true,
            type: TextInputType.visiblePassword,
            obscureText: true,
          ),
          SizedBoxHeightAndWidth.sizedBoxHeight15,
          Center(
            child: Button(
              text: 'Login',
              color: ColorPalate.teal,
              textStyle: TextStyleCustomized.semibold16white,
              onTap: () async {
                bool isAuthenticated = await loginUser();
                if (context.mounted) {
                  if (isAuthenticated) {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      Routes.homeScreen,
                      (route) => false,
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text(
                        'Credentials Incorrect!',
                      ),
                      backgroundColor: Colors.red,
                    ));
                  }
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
