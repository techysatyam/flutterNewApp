import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import '../../../common/utils/constants/image_strings.dart';
import '../../../common/utils/constants/sizes.dart';
import '../../../common/utils/device/device_utility.dart';
import '../../../common/widgets/appbar/appbar.dart';
import '../../../common/widgets/button/custom_button.dart';
import '../../../common/widgets/text_field/custom_text_field.dart';

class CreatePasswordScreen extends StatelessWidget {
  const CreatePasswordScreen({super.key});

  static const route = '/create_password_screen';

  @override
  Widget build(BuildContext context) {
    final textFieldWidth = AppDeviceUtils.getScreenWidth(context) / 3.5;

    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            showBackArrow: true,
            leadingSvgLogo: AppImages.add,
          ),
          const Spacer(),
          Text(
            AppLocalizations.of(context)!.createNewPass,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: AppSizes.defaultSpace * 2),
          _newPasswordField(context: context, textFieldWidth: textFieldWidth),
          const SizedBox(height: AppSizes.defaultSpace),
          _confirmPasswordField(
              context: context, textFieldWidth: textFieldWidth),
          const SizedBox(height: AppSizes.defaultSpace),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: textFieldWidth),
            child: CustomButton(
              width: double.infinity,
              height: AppSizes.buttonHeight,
              text: AppLocalizations.of(context)!.save,
              onTap: () {}, borderRadius: 8, fontSize: 24,
            ),
          ),
          const Spacer(),
          Align(
              alignment: Alignment.bottomRight,
              child: SvgPicture.asset(AppImages.add))
        ],
      ),
    );
  }

  Widget _newPasswordField(
      {required BuildContext context, required double textFieldWidth}) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: textFieldWidth),
      child: CustomTextField.outlineBorder(
        hintText: AppLocalizations.of(context)?.enterNewPass,
        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        textInputType: TextInputType.name,
      ),
    );
  }

  Widget _confirmPasswordField(
      {required BuildContext context, required double textFieldWidth}) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: textFieldWidth),
      child: CustomTextField.outlineBorder(
        hintText: AppLocalizations.of(context)?.confirmPass,
        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        textInputType: TextInputType.name,
      ),
    );
  }
}
