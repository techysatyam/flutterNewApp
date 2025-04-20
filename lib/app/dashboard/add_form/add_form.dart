import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:newwhhrrr/app/dashboard/add_form/screenshot_viewer.dart';
import 'package:newwhhrrr/app/dashboard/bloc/dashboard_bloc.dart';
import 'package:newwhhrrr/common/utils/constants/enums.dart';
import 'package:newwhhrrr/common/widgets/loaders/circular_loader.dart';

import '../../../common/utils/constants/colors.dart';
import '../../../common/utils/constants/image_strings.dart';
import '../../../common/utils/popups/custom_web_snackbar.dart';
import '../../../common/utils/validators/validation2.dart';
import '../../../common/widgets/button/custom_button.dart';
import '../../../common/widgets/custom/custom_constraints_text_field.dart';
import '../../../common/widgets/custom/custom_header.dart';
import '../../../common/widgets/custom/custom_upload_bar.dart';
import '../../../common/widgets/dropdown/custom_animated_dropdown.dart';

class AddForm extends StatefulWidget {
  static const String route = '/add_form';

  // final ViewExpense? viewExpenseModel;

  const AddForm({
    super.key,
    // this.viewExpenseModel,
  });

  @override
  State<AddForm> createState() => _AddFormState();
}

class _AddFormState extends State<AddForm> with AppValidator {
  final formKey = GlobalKey<FormState>();

  // ExpensesBloc? expensesBloc;

  @override
  void initState() {
    // expensesBloc = BlocProvider.of<ExpensesBloc>(context);
    // if (widget.viewExpenseModel != null) {
    //   expensesBloc?.expensesHeadController.text =
    //       widget.viewExpenseModel?.expHeadName ?? '';
    //   expensesBloc?.expenditureController.text =
    //       widget.viewExpenseModel?.expenditure ?? '';
    //   expensesBloc?.remarkController.text =
    //       widget.viewExpenseModel?.remark ?? '';
    //   // expensesBloc= widget.viewExpenseModel?.createdDate ?? '';
    //   ExpensesEvent.selectDate(
    //       date: DateTime.parse(widget.viewExpenseModel?.updatedDate ?? ""));
    // } else {
    //   expensesBloc?.expenditureController.clear();
    //   expensesBloc?.expensesHeadController.clear();
    //   expensesBloc?.remarkController.clear();
    // }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DashboardBloc, DashboardState>(
        listener: (context, state) {
          if (state.status == DashBoardStatus.success) {
            CustomSnackBar.showWebToast(
                context: context,
                message: state.message,
                toastType: ToastType.success);
            // context.push("/expense/expense${RouteConstants.viewExpense}");
          }
          if (state.status == DashBoardStatus.iconSuccess) {
            CustomSnackBar.showWebToast(
                context: context,
                message: state.message,
                toastType: ToastType.success);
            // context.push("/expense/expense${RouteConstants.viewExpense}");
          }
          if (state.status == DashBoardStatus.imageSuccess) {
            CustomSnackBar.showWebToast(
                context: context,
                message: state.message,
                toastType: ToastType.success);
            // context.push("/expense/expense${RouteConstants.viewExpense}");
          }
          if (state.status == DashBoardStatus.error) {
            CustomSnackBar.showWebToast(
                context: context,
                message: state.message,
                toastType: ToastType.error);
            // context.push("/expense/expense${RouteConstants.viewExpense}");
          }
          if (state.status == DashBoardStatus.toastError) {
            CustomSnackBar.showWebToast(
                context: context,
                message: state.message,
                toastType: ToastType.error);
            // context.push("/expense/expense${RouteConstants.viewExpense}");
          }
          if (state.status == DashBoardStatus.iconError) {
            CustomSnackBar.showWebToast(
                context: context,
                message: state.message,
                toastType: ToastType.error);
            // context.push("/expense/expense${RouteConstants.viewExpense}");
          }
          if (state.status == DashBoardStatus.imageError ||
              state.status == DashBoardStatus.invalidImageFile) {
            CustomSnackBar.showWebToast(
                context: context,
                message: state.message,
                toastType: ToastType.error);
            // context.push("/expense/expense${RouteConstants.viewExpense}");
          }
          if (state.status == DashBoardStatus.success) {
            /*if (state.status == DashBoardStatus.addUpdateSuccess) {
            CustomSnackBar.showWebToast(
                context: context, message: state.message);
            // context.push("/expense/expense${RouteConstants.viewExpense}");
          }
          if (state.status == DashBoardStatus.success) {
            CustomSnackBar.showWebToast(
                context: context,
                message: "✅ File selected: ${state.selectedFileName}");
            // context.push("/expense/expense${RouteConstants.viewExpense}");
          }
          if (state.status == DashBoardStatus.fileError) {
            CustomSnackBar.showWebToast(
                context: context,
                message: "❌ Invalid file type: Only AAB/APK files are allowed.",
                toastType: ToastType.error);
            // context.push("/expense/expense${RouteConstants.viewExpense}");
          }
          if (state.status == DashBoardStatus.iconSuccess) {
            CustomSnackBar.showWebToast(
                context: context,
                message: "✅ File selected: ${state.selectedIconName}");
            // context.push("/expense/expense${RouteConstants.viewExpense}");
          }
          if (state.status == DashBoardStatus.iconError) {
            CustomSnackBar.showWebToast(
                context: context,
                message:
                    "❌ Invalid file type: Only JPEG/PNG files are allowed.",
                toastType: ToastType.error);
            // context.push("/expense/expense${RouteConstants.viewExpense}");
          }
          if (state.status == DashBoardStatus.error) {
            CustomSnackBar.showWebToast(
              context: context,
              message:
                  "❌ Something went wrong while selecting the screenshots.",
              toastType: ToastType.error,
            );
          }*/
/*
          // Optionally handle specific validation messages if you set them in state.message:
          final msg = state.message.toLowerCase();

          if (msg.contains('extension')) {
            CustomSnackBar.showWebToast(
              context: context,
              message:
                  "❌ Some files had unsupported formats. Use only JPEG/PNG.",
              toastType: ToastType.error,
            );
          }

          if (msg.contains('too large')) {
            CustomSnackBar.showWebToast(
              context: context,
              message: "❌ One or more images exceed the 8MB size limit.",
              toastType: ToastType.error,
            );
          }

          if (msg.contains('aspect ratio')) {
            CustomSnackBar.showWebToast(
              context: context,
              message:
                  "❌ Invalid aspect ratio. Only 16:9 or 9:16 images are allowed.",
              toastType: ToastType.error,
            );
          }

          if (msg.contains('dimensions')) {
            CustomSnackBar.showWebToast(
              context: context,
              message:
                  "❌ Image dimensions must be between 320 and 3840 pixels on both sides.",
              toastType: ToastType.error,
            );
          }

          if (msg.contains('no valid screenshots')) {
            CustomSnackBar.showWebToast(
              context: context,
              message:
                  "❌ No valid screenshots found. Ensure each file meets all criteria.",
              toastType: ToastType.error,
            );
          }*/
          }
        },
        builder: (context, state) {
          print('hellohhh${state.status}');
            final isLoading = state.status == DashBoardStatus.loading ||
                state.status == DashBoardStatus.updating;

          if (isLoading) {
            print('hellohhh');
            return const Scaffold(
              body: SizedBox.expand(
                child: Center(
                  child: CustomCircularLoader(),
                ),
              ),
            );
          }
          return Scaffold(
            body: Form(
              key: formKey,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ListView(
                      children: [
                        CustomHeader(
                          heading: 'Form',
                          subHeading: [
                            SubHeading(
                              text: "Dashboard",
                              showIcon: false,
                            ),
                            SubHeading(
                              text: "Add Form",
                              color: AppColors.lightTextColor,
                            ),
                          ],
                          buttonText: 'Back',
                          buttonType: ButtonType.back,
                          onTap: () {
                            context.pop(true);
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Wrap(
                          spacing: 20,
                          runSpacing: 24,
                          children: [
                            CustomConstraintsTextField(
                              label: "App Name",
                              controller: context
                                  .read<DashboardBloc>()
                                  .appNameController,
                              validator: (val) =>
                                  emptyValidator(val, title: "App Name"),
                              hintText: "Enter App Name",
                              constraints: constraints,
                              maxWidth: constraints.maxWidth < 700
                                  ? double.infinity
                                  : constraints.maxWidth * 0.30,
                            ),
                            CustomConstraintsTextField(
                              label: "App Description",
                              controller: context
                                  .read<DashboardBloc>()
                                  .appDescriptionController,
                              validator: (val) =>
                                  emptyValidator(val, title: "App Description"),
                              hintText: "Enter App Description",
                              constraints: constraints,
                              maxWidth: constraints.maxWidth < 700
                                  ? double.infinity
                                  : constraints.maxWidth * 0.30,
                            ),
                            CustomConstraintsTextField(
                              label: "App Version",
                              controller: context
                                  .read<DashboardBloc>()
                                  .appVersionController,
                              validator: (val) =>
                                  emptyValidator(val, title: "App Version"),
                              hintText: "Enter App Version",
                              constraints: constraints,
                              maxWidth: constraints.maxWidth < 700
                                  ? double.infinity
                                  : double.infinity,
                            ),
                            CustomConstraintsTextField(
                              label: "Package Name",
                              controller: context
                                  .read<DashboardBloc>()
                                  .packageNameController,
                              validator: (val) =>
                                  emptyValidator(val, title: "Package Name"),
                              hintText: "Enter Package Name",
                              constraints: constraints,
                              maxWidth: constraints.maxWidth < 700
                                  ? double.infinity
                                  : double.infinity,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Category",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.headingTextColor,
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                                const SizedBox(height: 6),
                                BlocBuilder<DashboardBloc, DashboardState>(
                                  builder: (context, state) {
                                    return CustomAnimatedDropdown(
                                      borderRadius: 4,
                                      borderColor:
                                          AppColors.textFieldOutLineColor,
                                      initialItem: null,
                                      items:
                                          // widget.blockBloc.state.blockModel != null
                                          //     ? widget
                                          //     .blockBloc.state.blockModel!.blockData!
                                          //     .map((item) => item.blockName)
                                          //     .toList()
                                          //     :
                                          [],
                                      onChanged: (value) {
                                        // final data = state.blockModel!.blockData!
                                        //     .firstWhere(
                                        //         (item) => item.blockName == value);
                                        // context.read<DashboardBloc>().add(
                                        //     ClubAmenitiesEvent.getFlatByBlock(
                                        //         blockId: data.blockId ?? 0));
                                      },
                                      hintText: 'Select Block Name',
                                    );
                                  },
                                ),
                              ],
                            ),
                            CustomConstraintsTextField(
                              label: "Developer Name",
                              controller: context
                                  .read<DashboardBloc>()
                                  .developerNameController,
                              validator: (val) =>
                                  emptyValidator(val, title: "Developer Name"),
                              hintText: "Enter Developer Name",
                              constraints: constraints,
                              maxWidth: constraints.maxWidth < 700
                                  ? double.infinity
                                  : double.infinity,
                            ),
                            CustomConstraintsTextField(
                              label: "Privacy Policy URL",
                              controller: context
                                  .read<DashboardBloc>()
                                  .privacyPolicyURLController,
                              hintText: "Privacy Policy URL",
                              constraints: constraints,
                              maxWidth: constraints.maxWidth < 700
                                  ? double.infinity
                                  : double.infinity,
                            ),
                            CustomConstraintsTextField(
                              label: "Website URL",
                              controller: context
                                  .read<DashboardBloc>()
                                  .websiteURLController,
                              hintText: "Website URL",
                              constraints: constraints,
                              maxWidth: constraints.maxWidth < 700
                                  ? double.infinity
                                  : double.infinity,
                            ),
                            CustomConstraintsTextField(
                              label: "Release Notes",
                              controller: context
                                  .read<DashboardBloc>()
                                  .releaseNotesController,
                              hintText: "Release Notes",
                              constraints: constraints,
                              maxWidth: constraints.maxWidth < 700
                                  ? double.infinity
                                  : double.infinity,
                            ),
                            FolderElementsWithTitle(
                              label: "Upload File",
                              maxWidth: double.infinity, //770,
                              child: SizedBox(
                                  width: double.infinity,
                                  height: 74,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ListTile(
                                        leading: Container(
                                            height: 45,
                                            width: 45,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              color: AppColors.lightPrimaryColor
                                                  .withOpacity(0.2),
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                            child: const Icon(
                                              color:
                                                  AppColors.lightPrimaryColor,
                                              Icons.file_upload_outlined,
                                              size: 30,
                                            )),
                                        title: Text(
                                          state.selectedFileName ??
                                              'Upload File',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                            color: AppColors.headingTextColor,
                                          ),
                                        ),
                                        /*: Text(
                                                    state.galleryScreenImage!.name,
                                                    textAlign: TextAlign.start,
                                                    style: const TextStyle(
                                                        fontWeight: FontWeight.w500,
                                                        fontSize: 14,
                                                        color: AppColor
                                                            .boxHeadingColor),
                                                  ),*/
                                        subtitle: Text(
                                          '(Upload AAB, APK files only.)',
                                          style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.hintTextColor,
                                          ),
                                        ),
                                        onTap: () {
                                          context
                                              .read<DashboardBloc>()
                                              .add(DashboardEvent.selectFile());
                                          /*context.read<GalleryBloc>().add(
                                                        const GalleryEvent.pickImage(
                                                            isThumbnail: false));*/

                                          // print(' tapped');
                                        },
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                    ],
                                  ) /*CustomPaint(
                                            painter: DashedRectPainter(
                                                color: AppColors.darkDividerColor,
                                                dashSpace: 6,
                                                dashWidth: 6,
                                                strokeWidth: 1),
                                            // painter: DottedBorderPainter(),
                                            child:
                                           )*/
                                  ),
                            ),
                            FolderElementsWithTitle(
                              label: "Upload Icon",
                              maxWidth: double.infinity, //770,
                              child: SizedBox(
                                  width: double.infinity,
                                  height: 100,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ListTile(
                                        leading: Container(
                                            height: 45,
                                            width: 45,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              color: AppColors.lightPrimaryColor
                                                  .withOpacity(0.2),
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                            child: const Icon(
                                              color:
                                                  AppColors.lightPrimaryColor,
                                              Icons.file_upload_outlined,
                                              size: 30,
                                            )),
                                        title: Text(
                                          state.selectedIconName ??
                                              'Upload Icon',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                            color: AppColors.headingTextColor,
                                          ),
                                        ),
                                        /*: Text(
                                                    state.galleryScreenImage!.name,
                                                    textAlign: TextAlign.start,
                                                    style: const TextStyle(
                                                        fontWeight: FontWeight.w500,
                                                        fontSize: 14,
                                                        color: AppColor
                                                            .boxHeadingColor),
                                                  ),*/
                                        subtitle: Text(
                                          '(Your app icon must be a PNG or JPEG, up to 1 MB, 512 px by 512 px, and meet our design specifications)',
                                          style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.hintTextColor,
                                          ),
                                        ),
                                        onTap: () {
                                          context
                                              .read<DashboardBloc>()
                                              .add(DashboardEvent.selectIcon());
                                          /*context.read<GalleryBloc>().add(
                                                        const GalleryEvent.pickImage(
                                                            isThumbnail: false));*/

                                          // print(' tapped');
                                        },
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                    ],
                                  ) /*CustomPaint(
                                            painter: DashedRectPainter(
                                                color: AppColors.darkDividerColor,
                                                dashSpace: 6,
                                                dashWidth: 6,
                                                strokeWidth: 1),
                                            // painter: DottedBorderPainter(),
                                            child:
                                           )*/
                                  ),
                            ),
                            BlocBuilder<DashboardBloc, DashboardState>(
                              builder: (context, state) {
                                return Center(
                                  child: SizedBox(
                                    width: 130,
                                    height: 130,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(4),
                                      child: state.iconBase64 != null
                                          ? Image.memory(
                                              base64Decode(state.iconBase64!),
                                              fit: BoxFit.cover,
                                            )
                                          : Container(
                                              color: AppColors.lightPrimaryColor
                                                  .withOpacity(0.2),
                                              child: Icon(
                                                Icons.image,
                                                size: 30,
                                                color:
                                                    AppColors.lightPrimaryColor,
                                              ),
                                            ),
                                    ),
                                  ),
                                );
                              },
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            ScreenshotViewer(
                              label: 'Screenshots',
                              subText:
                                  'Upload 3-5 phone screenshots. \nScreenshots must be PNG or JPEG, up to 8 MB each, 16:9 or 9:16 aspect ratio, \nwith each side between 320 px and 3,840 px',
                              screenshots: state.screenshots,
                              cardHeight: 300,
                              cardWidth: 200,
                              onAddScreenshot: () {
                                context
                                    .read<DashboardBloc>()
                                    .add(DashboardEvent.selectImage());
                              },
                              onRemoveScreenshot: (int index) {
                                context.read<DashboardBloc>().add(
                                    DashboardEvent.removeLastScreenshot(index));
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Wrap(
                            spacing: 15,
                            runSpacing: 15,
                            alignment: WrapAlignment.end,
                            children: [
                              CustomButton(
                                fontSize: 14,
                                borderRadius: 8,
                                fontWeight: FontWeight.w500,
                                backgroundColor: AppColors.lightBgColor,
                                borderColor:
                                    AppColors.greyColor.withOpacity(0.2),
                                text: "Cancel",
                                textColor: AppColors.headingTextColor,
                                onTap: () {
                                  context.pop(true);
                                },
                              ),
                              CustomButton(
                                fontSize: 14,
                                borderRadius: 8,
                                fontWeight: FontWeight.w500,
                                text: "Add Form",
                                onTap: () {
                                  if (formKey.currentState!.validate()) {
                                    context
                                        .read<DashboardBloc>()
                                        .add(DashboardEvent.addForm());
                                  }
                                },
                              ),
                            ]),
                      ],
                    ),
                  );
                },
              ),
            ),
          );
        },
      );
  }
}
