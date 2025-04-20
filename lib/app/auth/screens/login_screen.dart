import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/utils/constants/sizes.dart';
import '../../../common/utils/device/device_utility.dart';
import '../../../common/widgets/images/custom_app_logo.dart';
import '../bloc/auth_bloc.dart';
import '../widgets/custom_auth_design.dart';
import '../widgets/login_form.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required this.child});

  final Widget child;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void didChangeDependencies() {
    context.read<AuthBloc>().add(const AuthEvent.generateCaptcha());
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(AppSizes.spaceBtwSections),
                  child: widget.child,
                ),
              ),
              if (!AppDeviceUtils.isMobileScreen(context))
                const Expanded(child: CustomAuthDesign())
            ],
          );
        },
      ),
    );
  }
}

class LoginScreenUI extends StatelessWidget {
  const LoginScreenUI({super.key});

  static const route = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomAppLogo(),
            const SizedBox(height: AppSizes.spaceBtwSections * 1.5),
            LoginForm(authBloc: context.read<AuthBloc>()),
          ],
        ),
      ),
    );
  }
}
