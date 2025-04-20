import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import '../../../common/utils/constants/image_strings.dart';
import '../../../common/utils/constants/sizes.dart';
import '../../../common/utils/device/device_utility.dart';
import '../../../common/widgets/appbar/appbar.dart';
import '../../../common/widgets/button/custom_button.dart';
import '../../../common/widgets/loaders/circular_loader.dart';
import '../../../common/widgets/text_field/custom_text_field.dart';
import '../bloc/auth_bloc.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  static const route = '/forget_password';

  @override
  Widget build(BuildContext context) {
    bool isMobile = AppDeviceUtils.isMobileScreen(context);
    bool isTablet = AppDeviceUtils.isTabletScreen(context);

    final textFieldWidth = isMobile
        ? AppDeviceUtils.getScreenWidth(context) * 0.9
        : isTablet
            ? AppDeviceUtils.getScreenWidth(context) * 0.5
            : AppDeviceUtils.getScreenWidth(context) * 0.30;

    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
            body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomAppBar(
              showBackArrow: true,
              leadingSvgLogo: AppImages.add,
            ),
            const Spacer(),
            Text(
              AppLocalizations.of(context)!.forgotPass,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: AppSizes.defaultSpace * 2),
            _emailPasswordField(
                context: context, textFieldWidth: textFieldWidth),
            const SizedBox(height: AppSizes.defaultSpace),
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: textFieldWidth),
              child: BlocConsumer<AuthBloc, AuthState>(
                listener: (context, state) {},
                builder: (context, state) {
                  return state.status == AuthStatus.checkUserNameLoading
                      ? const CustomCircularLoader()
                      : CustomButton(
                          width: double.infinity,
                          height: AppSizes.buttonHeight,
                          text: AppLocalizations.of(context)!.sendOtp,
                          onTap: () {
                            context
                                .read<AuthBloc>()
                                .add(const AuthEvent.checkUserName());
                            // context.push(VerifyOtpScreen.route);
                          }, borderRadius: 8, fontSize: 24,
                        );
                },
              ),
            ),
            const Spacer(),
            Align(
                alignment: Alignment.bottomRight,
                child: SvgPicture.asset(AppImages.add))
          ],
        ));
      },
    );
  }

  Widget _emailPasswordField(
      {required BuildContext context, required double textFieldWidth}) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: textFieldWidth),
      child: CustomTextField.outlineBorder(
        controller: context.read<AuthBloc>().usernameController,
        hintText: AppLocalizations.of(context)?.enterEmailOrMobile,
        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        textInputType: TextInputType.name,
      ),
    );
  }
}
