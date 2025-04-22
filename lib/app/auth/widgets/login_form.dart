import 'dart:math';
import 'package:flutter_projects/common/utils/constants/sizes.dart';

import '../../../common/utils/constants/enums.dart';
import '../../../common/utils/constants/image_strings.dart';
import '../../../common/utils/device/device_utility.dart';
import '../../../common/utils/popups/custom_web_snackbar.dart';
import '../../../common/utils/validators/validation.dart';
import '../../../common/widgets/button/custom_button.dart';
import '../../../common/widgets/text_field/custom_text_field.dart';
import '../../dashboard/dashboard_screen.dart';
import '../bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../common/utils/constants/colors.dart';
import '../../../common/utils/constants/constants.dart';
import '../../../common/utils/hive/hive_service.dart';
import '../../../common/widgets/loaders/circular_loader.dart';
import '../screens/forget_password_screen.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key, required this.authBloc});

  final AuthBloc authBloc;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> with AppValidator {
  final formKey = GlobalKey<FormState>();

  fetchRememberMe() async {
    String? userId = await HiveService.readBox2(kLoginUserId);
    String? password = await HiveService.readBox2(kLoginUserPassword);
    bool? rememberMe = await HiveService.readBox2(kRememberMe);
    context.read<AuthBloc>().usernameController.text = userId ?? "";
    context.read<AuthBloc>().passwordController.text = password ?? "";
    context
        .read<AuthBloc>()
        .add(AuthEvent.rememberMe(isRemember: rememberMe ?? false));
  }

  @override
  void initState() {
    fetchRememberMe();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isMobile = AppDeviceUtils.isMobileScreen(context);

    return Form(
      key: formKey,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: isMobile ? AppSizes.md : 80),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
                child: Text(AppLocalizations.of(context)!.letsGetYouLoggedIn,
                    style: Theme.of(context).textTheme.titleMedium)),

            const SizedBox(height: AppSizes.defaultSpace),
            const SizedBox(height: AppSizes.defaultSpace),

            _userIdField(context),

            const SizedBox(height: AppSizes.mediumSpace),

            _hintText(
                context: context,
                text: AppLocalizations.of(context)!.pleaseEnterValidUserId),

            const SizedBox(height: AppSizes.defaultSpace),

            _passwordField(context),

            const SizedBox(height: AppSizes.mediumSpace),

            _hintText(
                context: context,
                text: AppLocalizations.of(context)!.pleaseEnterValidPass),

            const SizedBox(height: AppSizes.defaultSpace),

            // Captcha
            BlocBuilder<AuthBloc, AuthState>(
              buildWhen: (oldState, newState) {
                return oldState.captcha != newState.captcha;
              },
              builder: (context, state) {
                return _captchaContainer(
                    authBloc: widget.authBloc, context: context);
              },
            ),

            const SizedBox(height: AppSizes.defaultSpace),

            _captchaField(context),

            const SizedBox(height: AppSizes.defaultSpace),

            // Remember me checkbox
            Row(
              children: [
                BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    return Checkbox(
                      value: state.rememberMe,
                      onChanged: (value) {
                        if (value != null) {
                          context
                              .read<AuthBloc>()
                              .add(AuthEvent.rememberMe(isRemember: value));
                        }
                      },
                    );
                  },
                ),
                Text(AppLocalizations.of(context)!.remember,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: AppColors.paragraphColor(context))),
                const Spacer(),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {
                      AppDeviceUtils.hideKeyboard(context);
                      context.push(ForgetPassword.route);
                    },
                    child: Text(AppLocalizations.of(context)!.forgotPassQ,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppColors.secondaryColor(context))),
                  ),
                ),
              ],
            ),

            const SizedBox(height: AppSizes.defaultSpace),
            BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state.status == AuthStatus.toastError ||
                    state.status == AuthStatus.error) {
                  CustomSnackBar.showWebToast(
                      context: context,
                      message: state.message,
                      toastType: ToastType.error);
                }

                if (state.status == AuthStatus.success) {
                  context.pushReplacement(DashboardScreen.route);
                  CustomSnackBar.showWebToast(
                      context: context,
                      message: state.message,
                      toastType: ToastType.success);
                }
              },
              bloc: widget.authBloc,
              builder: (context, state) {
                return state.status == AuthStatus.loading
                    ? const CustomCircularLoader()
                    : CustomButton(
                        width: double.infinity,
                        height: AppSizes.buttonHeight,
                        text: AppLocalizations.of(context)!.login,
                        onTap: () {
                          AppDeviceUtils.hideKeyboard(context);
                          context.read<AuthBloc>().add(const AuthEvent.login());
                          // if(formKey.currentState!.validate()){
                          // context.go(DashboardScreen.route);
                          // }
                        }, borderRadius: 8, fontSize: 24,
                      );
              },
            )
          ],
        ),
      ),
    );
  }

  Widget _captchaContainer(
      {required AuthBloc authBloc, required BuildContext context}) {
    final authState = authBloc.state;

    List<String> captchaText = authState.captcha?.split("") ?? [];
    return Container(
      padding: const EdgeInsets.all(AppSizes.md),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSizes.borderRadiusMd),
          gradient: LinearGradient(colors: [
            AppColors.primaryGradient1(context).withOpacity(0.15),
            AppColors.paragraphColor(context).withOpacity(0)
          ])),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: List.generate(
              captchaText.length,
              (index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                // Add space between letters
                child: Text(
                  captchaText[index],
                  style: getRandomStyle(),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              authBloc.add(const AuthEvent.generateCaptcha());
            },
            child: Container(
              height: 34,
              width: 34,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(AppSizes.borderRadiusMd),
                  boxShadow: [
                    BoxShadow(
                        color: AppColors.lightPrimaryGradient2.withOpacity(0.2),
                        spreadRadius: 0,
                        blurRadius: 20,
                        offset: const Offset(0, 10))
                  ],
                  gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        AppColors.lightSecondaryGradient1,
                        AppColors.lightSecondaryGradient2
                      ])),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child:
                    SvgPicture.asset(AppImages.add, height: 14, width: 14),
              ),
            ),
          )
        ],
      ),
    );
  }

  // Function to generate random styles for each character
  TextStyle getRandomStyle() {
    List<String> fonts = [
      GoogleFonts.roboto().fontFamily!,
      GoogleFonts.protestRiot().fontFamily!,
      GoogleFonts.publicSans().fontFamily!,
    ];
    return TextStyle(
      fontSize: 18 + Random().nextInt(5).toDouble(),
      // Random size between 24-34
      fontWeight: Random().nextBool() ? FontWeight.bold : FontWeight.normal,
      fontFamily: fonts[Random().nextInt(fonts.length)],
      // Random font
      color: AppColors.textColor(context), // Keep text black
    );
  }

  Widget _userIdField(BuildContext context) {
    return CustomTextField.outlineBorder(
      controller: context.read<AuthBloc>().usernameController,
      // validator: (val) => validateEmptyText(context, 'User ID', val),
      hintText: AppLocalizations.of(context)?.userId,
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      textInputType: TextInputType.name,
    );
  }

  Widget _passwordField(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return CustomTextField.outlineBorder(
          controller: context.read<AuthBloc>().passwordController,
          // validator: (val) => validateEmptyText(context, 'Password', val),
          hintText: AppLocalizations.of(context)?.password,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          textInputType: TextInputType.visiblePassword,
          suffixIcon: IconButton(
            onPressed: () {
              if (state.status != AuthStatus.loading) {
                context
                    .read<AuthBloc>()
                    .add(const AuthEvent.togglePasswordVisibility());
              }
            },
            icon: Icon(
              size: AppSizes.iconMd - 4,
              state.visibility
                  ? Icons.visibility_outlined
                  : Icons.visibility_off_outlined,
              color: AppColors.iconColor(context),
            ),
          ),
          obscureText: state.visibility,
        );
      },
    );
  }

  Widget _captchaField(BuildContext context) {
    return CustomTextField.outlineBorder(
      controller: context.read<AuthBloc>().captchaController,
      // validator: (val) => captchaValidator(context,
      //     captcha: authBloc.state.captcha ?? '', value: val),
      hintText: AppLocalizations.of(context)?.enterCaptcha,
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      textInputType: TextInputType.text,
      onChanged: (val) {},
    );
  }

  Widget _hintText({required BuildContext context, required String text}) {
    return Text(
      text,
      style: Theme.of(context)
          .textTheme
          .labelMedium
          ?.copyWith(color: AppColors.paragraphColor(context)),
    );
  }
}
