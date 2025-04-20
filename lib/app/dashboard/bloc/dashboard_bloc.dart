import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

import '../../../common/networking/network_exception.dart';
import '../../../common/widgets/custom_file_picker.dart';
import '../../../common/widgets/custom_file_picker.dart';
import '../../../common/widgets/images/image_picker_util.dart';
import '../models/add_app_data_model.dart';
import '../models/get_all_app_model.dart';
import '../repo/app_store_repo.dart';

part 'dashboard_event.dart';

part 'dashboard_state.dart';

part 'dashboard_bloc.freezed.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final TextEditingController appNameController = TextEditingController();
  final TextEditingController appDescriptionController =
      TextEditingController();
  final TextEditingController appVersionController = TextEditingController();
  final TextEditingController packageNameController = TextEditingController();
  final TextEditingController releaseNotesController = TextEditingController();
  final TextEditingController privacyPolicyURLController =
      TextEditingController();
  final TextEditingController websiteURLController = TextEditingController();
  final TextEditingController appSearchController = TextEditingController();
  final TextEditingController developerNameController = TextEditingController();

  Timer? _debounce;
  bool isSomething = false;

  void _onTyping() {
    if (_debounce != null) {
      _debounce!.cancel();
    }
    _debounce = Timer(const Duration(milliseconds: 500), () {
      // Call your callback function here
      if (appSearchController.text
          .trim()
          .isNotEmpty ||
          isSomething) {
        isSomething = false;
        add(const DashboardEvent.getForm(pageNumber: 1));
      }
    });
  }

  DashboardBloc() : super(DashboardState(appStoreRepo: AppStoreRepo())) {

    appSearchController.addListener(() {
      _onTyping();
    });

    on<_AddForm>((event, emit) async {
      try {
        emit(state.copyWith(status: DashBoardStatus.initial));
        // Safely get up to 5 screenshots from the list
        String getBase64(int index) => index < state.screenshots.length
            ? state.screenshots[index].base64
            : '';
        String getFileName(int index) => index < state.screenshots.length
            ? state.screenshots[index].name
            : '';
        print("📦 APK file name: ${state.selectedFileName}");
        print("📦 APK Base64 length: ${state.apkBase64?.length}");
        print("🖼️ Icon file name: ${state.selectedIconName}");
        print("🖼️ Icon Base64 length: ${state.iconBase64?.length}");
        for (int i = 0; i < 5; i++) {
          print("🖼️ Screenshot ${i + 1} name: ${getFileName(i)}");
          print("🖼️ Screenshot ${i + 1} Base64 length: ${getBase64(i).length}");
        }
        var response = await state.appStoreRepo.addForm(
          apkFileBase64: state.apkBase64,
          apkFileExt: state.selectedFileName,
          appIconBase64: state.iconBase64,
          appIconExt: state.selectedIconName,
          screenshot1Base64: getBase64(0),
          screenshot1Ext: getFileName(0),
          screenshot2Base64: getBase64(1),
          screenshot2Ext: getFileName(1),
          screenshot3Base64: getBase64(2),
          screenshot3Ext: getFileName(2),
          screenshot4Base64: getBase64(3),
          screenshot4Ext: getFileName(3),
          screenshot5Base64: getBase64(4),
          screenshot5Ext: getFileName(4),
          category: '',
          appDescription: appDescriptionController.text,
          appName: appNameController.text,
          appVersion: appVersionController.text,
          developerName: developerNameController.text,
          packageName: packageNameController.text,
          privacyPolicyUrl: privacyPolicyURLController.text,
          releaseNotes: releaseNotesController.text,
          websiteUrl: websiteURLController.text,
        );
        if (response["status"] == 200) {
          emit(state.copyWith(
            status: DashBoardStatus.success,
            message: response["message"] ?? "",
          ));
          appNameController.clear();
          appDescriptionController.clear();
          appVersionController.clear();
          packageNameController.clear();
          releaseNotesController.clear();
          privacyPolicyURLController.clear();
          websiteURLController.clear();
          appSearchController.clear();
          developerNameController.clear();
        } else {
          emit(state.copyWith(
            status: DashBoardStatus.error,
            message: response["message"] ?? 'Something went wrong',
          ));
        }
      } on NetworkException catch (e) {
        emit(state.copyWith(
          status: DashBoardStatus.toastError,
          message: e.message,
        ));
      } on InternetException catch (e) {
        emit(state.copyWith(
          status: DashBoardStatus.toastError,
          message: e.message,
        ));
      } catch (e) {
        log('error: ${e.toString()}');
        emit(
          state.copyWith(
            status: DashBoardStatus.error,
            message: 'Something went wrong',
          ),
        );
      }
    });
    on<_SelectImage>((event, emit) async {
      print('[SelectImage] Event triggered');
      emit(state.copyWith(status: DashBoardStatus.initial));

      try {
        final List<XFile> images = await ImagePicker().pickMultiImage();
        print('[SelectImage] Total images selected: ${images.length}');

        if (images.isEmpty) {
          print('[SelectImage] No images selected.');
          emit(state.copyWith(
            status: DashBoardStatus.imageError,
            message: 'No screenshots selected.',
          ));
          return;
        }

        final validExtensions = ['png', 'jpeg', 'jpg'];
        final validScreenshots = <ScreenshotFile>[];

        for (final image in images) {
          final extension = image.name.split('.').last.toLowerCase();
          print(
              '[SelectImage] Processing: ${image.name} with extension: $extension');

          if (!validExtensions.contains(extension)) {
            print('[SelectImage] Skipped invalid file: ${image.name}');
            emit(state.copyWith(
                status: DashBoardStatus.invalidImageFile,
              message: 'Some files were not JPEG or PNG and were skipped.',
            ));
            continue;
          }

          final bytes = await image.readAsBytes();
          final base64Image = base64Encode(bytes);

          final newScreenshot = ScreenshotFile(
            name: image.name,
            base64: base64Image,
            file: image,
          );

          print('[SelectImage] ScreenshotFile created: ${image.name}');
          validScreenshots.add(newScreenshot);
        }

        final updatedScreenshots = [...state.screenshots, ...validScreenshots];
        print(
            '[SelectImage] Total valid screenshots: ${validScreenshots.length}');
        print(
            '[SelectImage] Final screenshot list length: ${updatedScreenshots.length}');

        emit(state.copyWith(
          screenshots: updatedScreenshots,
          message: 'Screenshots added',
          status: DashBoardStatus.imageSuccess,
        ));
        print('[SelectImage] Emitted success state');
      } catch (e) {
        print('[SelectImage] Error: $e');
        emit(state.copyWith(
          status: DashBoardStatus.error,
          message: 'Error selecting screenshots.',
        ));
      }
    });
    on<_RemoveLastScreenshot>((event, emit) {
      final updated = List<ScreenshotFile>.from(state.screenshots);
      if (event.index >= 0 && event.index < updated.length) {
        updated.removeAt(event.index);
        emit(state.copyWith(screenshots: updated));
      }
    });
    on<_SelectIcon>((event, emit) async {
      emit(state.copyWith(status: DashBoardStatus.initial));
      print("🔵 _SelectIcon event triggered");

      try {
        final XFile? image = await ImagePickerUtil().pickImage(ImageSource.gallery);
        print("📸 Image picked: ${image?.name}");

        if (image == null) {
          emit(state.copyWith(
            status: DashBoardStatus.iconError,
            message: 'No image selected.',
          ));
          print("⚠️ No image selected.");
          return;
        }

        final extension = image.name.split('.').last.toLowerCase();
        print("🧩 File extension: $extension");

        if (!['png', 'jpeg', 'jpg'].contains(extension)) {
          emit(state.copyWith(
            status: DashBoardStatus.iconError,
            message: 'Invalid file type. Only JPEG or PNG files are allowed.',
          ));
          print("❌ Invalid file type.");
          return;
        }

        final bytes = await image.readAsBytes();
        final imageSizeInMB = bytes.lengthInBytes / (1024 * 1024);
        print("📦 Image size: ${imageSizeInMB.toStringAsFixed(2)} MB");

        if (imageSizeInMB > 1) {
          emit(state.copyWith(
            status: DashBoardStatus.iconError,
            message: 'Image is too large. Max allowed size is 1 MB.',
          ));
          print("❌ Image too large.");
          return;
        }

        // ⬇️ Validate dimensions
        final codec = await instantiateImageCodec(bytes);
        final frame = await codec.getNextFrame();
        final imageWidth = frame.image.width;
        final imageHeight = frame.image.height;

        print("📏 Image dimensions: ${imageWidth}x${imageHeight}");

        if (imageWidth != 512 || imageHeight != 512) {
          emit(state.copyWith(
            status: DashBoardStatus.iconError,
            message: 'Image must be exactly 512x512 pixels.',
          ));
          print("❌ Invalid image dimensions.");
          return;
        }

        final base64Image = base64Encode(bytes);
        print("✅ Image successfully encoded to Base64. Length: ${base64Image.length}");

        emit(state.copyWith(
          status: DashBoardStatus.iconSuccess,
          iconBase64: base64Image,
          selectedIconName: image.name,
          message: 'Image selected and encoded successfully.',
        ));
      } catch (e) {
        log('❗ Image Picker error: $e');
        emit(state.copyWith(
          status: DashBoardStatus.error,
          message: 'Something went wrong while picking the image.',
        ));
      }
    });
    on<_SelectFile>((event, emit) async {
      print("🚀 Event: _SelectFile triggered");

      final file = await CustomFilePicker().pickFile(
        fileType: FileType.custom,
        allowedExtensions: ["apk", "aab"],
      );

      print(
          "📁 File picker triggered. Result: ${file != null ? 'File selected' : 'No file selected'}");

      emit(state.copyWith(status: DashBoardStatus.loading));

      if (file == null) {
        print("⚠️ No file selected by user.");
        emit(state.copyWith(
          status: DashBoardStatus.initial,
          selectedFileErrorMessage: 'No file selected.',
        ));
        return;
      }

      final fileExtension = file.name.split('.').last.toLowerCase();
      print("🔍 File extension: $fileExtension");

      if (fileExtension != 'apk' && fileExtension != 'aab') {
        print("❌ Invalid file type: Only AAB/APK files are allowed.");
        emit(state.copyWith(
          status: DashBoardStatus.fileError,
          selectedFileErrorMessage:
              'Only AAB and APK files are allowed. Please select a AAB or APK file.',
        ));
        return;
      }

      print("✅ Valid file type: $fileExtension");
      print("📄 File Name: ${file.name}");
      print("📦 File Size (in bytes): ${file.bytes?.length}");

      String base64File = base64Encode(file.bytes ?? []);
      print("🧬 Base64 Encoding Done. Length: ${base64File.length}");
      print('checkkkkkk ----- >${state.status}');
      emit(state.copyWith(
        apkBase64: base64File,
        selectedFileName: file.name, // <-- Ensure your state has this
        status: DashBoardStatus.success,
      ));

      print("🎉 File selected and encoded successfully.");
    });
    on<_GetForm>((event, emit) async {
      emit(state.copyWith(status: DashBoardStatus.loading));
      try {
        emit(state.copyWith(
          status: event.pageNumber == 1 && appSearchController.text.isEmpty
              ? DashBoardStatus.loading
              : DashBoardStatus.updating,
          pageNumber: event.pageNumber,
        ));
        if (appSearchController.text.trim().isNotEmpty) {
          isSomething = true;
        }
        GetAllAppModel? getAllAppModel = await state.appStoreRepo.getForm(
          page: event.pageNumber ?? 1,
          search: appSearchController.text,
        );
        if (getAllAppModel.status == 200) {
          emit(state.copyWith(
            status: DashBoardStatus.success,
            getAllAppModel: getAllAppModel,
            pageNumber: event.pageNumber,
            // isLastPage: (getAllAppModel.allData ?? []).length < 10,
          ));
        } else {
          emit(state.copyWith(
              status: DashBoardStatus.error,
              message: getAllAppModel.message.toString()));
        }
      } on NetworkException catch (e) {
        emit(state.copyWith(
          status: DashBoardStatus.error,
          message: e.message,
        ));
      } on InternetException catch (e) {
        emit(state.copyWith(
          status: DashBoardStatus.error,
          message: e.message,
        ));
      } catch (e) {
        print("QWERTYUIO   $e");
        emit(
          state.copyWith(
            status: DashBoardStatus.error,
            message: 'Something went wrong',
          ),
        );
      }
    });
  }

  @override
  Future<void> close() async {
    appSearchController.removeListener(() {});
    _debounce?.cancel();
    super.close();
  }
}
