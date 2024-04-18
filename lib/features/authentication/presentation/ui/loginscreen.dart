import 'package:dis_pred/config/routes/route.dart';
import 'package:dis_pred/core/constants/colors.dart';
import 'package:dis_pred/core/constants/sizedbox.dart';
import 'package:dis_pred/core/constants/textstyle.dart';
import 'package:dis_pred/core/validators/text_field_validator.dart';
import 'package:dis_pred/features/authentication/domain/login_view_model.dart';
import 'package:dis_pred/features/authentication/presentation/ui/components/authentication_screens_border_layout.dart';
import 'package:dis_pred/features/authentication/presentation/ui/components/buttons.dart';
import 'package:dis_pred/features/authentication/presentation/ui/components/textfields.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Login Screen to enter email and password for authentication
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
    final loginProvider = context.read<LoginViewModel>();
    loginProvider.nameController = TextEditingController();
    loginProvider.passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final loginProvider = context.read<LoginViewModel>();
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
          Form(
            key: context.read<LoginViewModel>().formKey,
            child: Column(
              children: [
                BaseTextFieldWidget(
                  controller: loginProvider.nameController,
                  hintText: 'Enter your username',
                  icon: Icons.person,
                  suffix: false,
                  type: TextInputType.name,
                  validator: TextFieldValidator.validateNameField,
                ),
                BaseTextFieldWidget(
                  controller: loginProvider.passwordController,
                  hintText: 'Enter your password',
                  icon: Icons.lock_outlined,
                  suffix: true,
                  type: TextInputType.visiblePassword,
                  obscureText: true,
                  validator: TextFieldValidator.validatePasswordField,
                ),
              ],
            ),
          ),
          SizedBoxHeightAndWidth.sizedBoxHeight15,
          Center(
            child: Button(
              text: 'Login',
              color: ColorPalate.teal,
              textStyle: TextStyleCustomized.semibold16white,
              onTap: () async {
                final shouldProceed = await loginProvider.validateForm();
                if (shouldProceed?.successValidation ?? false) {
                  if (context.mounted) {
                    if (shouldProceed?.isAuthentication ?? false) {
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
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
