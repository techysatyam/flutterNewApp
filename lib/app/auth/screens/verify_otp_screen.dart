import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../common/utils/constants/colors.dart';
import '../../../common/utils/constants/enums.dart';
import '../../../common/utils/constants/image_strings.dart';
import '../../../common/utils/constants/sizes.dart';
import '../../../common/utils/device/device_utility.dart';
import '../../../common/utils/popups/custom_web_snackbar.dart';
import '../../../common/widgets/appbar/appbar.dart';
import '../../../common/widgets/button/custom_button.dart';
import '../bloc/auth_bloc.dart';

class VerifyOtpScreen extends StatelessWidget {
  const VerifyOtpScreen({super.key});

  static const route = '/verify_otp';

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(body: _verifyOtpField(context));
      },
    );
  }

  Widget _verifyOtpField(BuildContext context) {
    final TextEditingController otpController = TextEditingController();
    final otpFieldWidth = AppDeviceUtils.getScreenWidth(context) / 2.5;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CustomAppBar(
          showBackArrow: true,
          leadingSvgLogo: AppImages.add,
        ),
        const Spacer(),
        Text(
          AppLocalizations.of(context)!.verifyOtp,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 48),
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: otpFieldWidth),
          child: PinCodeTextField(
            appContext: context,
            length: 6,
            obscureText: false,
            animationType: AnimationType.fade,
            cursorColor: AppColors.textColor(context),
            // Set the cursor color here
            pinTheme: PinTheme(
              shape: PinCodeFieldShape.box,
              activeBorderWidth: 1,
              selectedBorderWidth: 1,
              borderRadius: BorderRadius.circular(10),
              fieldHeight: 48,
              fieldWidth: 82,
              activeFillColor: AppColors.bgColor(context),
              // Background color of active field
              selectedFillColor: AppColors.bgColor(context),
              // Background color of selected field
              inactiveFillColor: AppColors.bgColor(context),
              // Background color of inactive field
              activeColor: AppColors.textColor(context),
              // Border color of active field
              selectedColor: AppColors.textColor(context),
              // Border color of selected field
              inactiveColor: Theme.of(context)
                  .disabledColor, // Border color of inactive field
            ),
            animationDuration: const Duration(milliseconds: 100),
            backgroundColor: AppColors.bgColor(context),
            // Background color of the widget
            enableActiveFill: true,
            // Ensure fill color is applied
            controller: otpController,
            keyboardType: TextInputType.number,
            onCompleted: (v) {
              debugPrint("Completed: $v");
            },
            onChanged: (value) {
              debugPrint(value);
            },
          ),
        ),
        SizedBox(height: AppSizes.defaultSpace),
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: otpFieldWidth),
          child: CustomButton(
            width: double.infinity,
            height: 48,
            borderRadius: 10,
            text: AppLocalizations.of(context)!.verifyOtp,
            onTap: () {
              context
                  .read<AuthBloc>()
                  .add(AuthEvent.forgotPassword(otpController: otpController));
              if (otpController.text.isEmpty || otpController.text.length < 4) {
                CustomSnackBar.showWebToast(
                    context: context,
                    message: 'Please Enter OTP',
                    toastType: ToastType.error);
                return;
              }
              debugPrint("OTP Entered: ${otpController.text}");
            }, fontSize: 24,
          ),
        ),
        const Spacer(),
        Align(
            alignment: Alignment.bottomRight,
            child: SvgPicture.asset(AppImages.add))
      ],
    );
  }
}
