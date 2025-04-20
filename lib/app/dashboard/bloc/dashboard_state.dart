part of 'dashboard_bloc.dart';
class ScreenshotFile {
  final String name;
  final String base64;
  final XFile file;

  ScreenshotFile({
    required this.name,
    required this.base64,
    required this.file,
  });
}
@freezed
class DashboardState with _$DashboardState {
  const factory DashboardState({
    required AppStoreRepo appStoreRepo,
    @Default({}) Map<String, bool> installedAppsMap,
    @Default(DashBoardStatus.initial) DashBoardStatus status,
    @Default('') String message,

    @Default(1) int pageNumber,

    @Default([]) List<ScreenshotFile> screenshots,

    String? apkBase64,
    String? iconBase64,
    String? screenshotBase64,
    AddAppDataModel? addAppDataModel,
    GetAllAppModel? getAllAppModel,

    XFile? iconImage,
    XFile? screenshot,

    String? selectedFileName,
    String? selectedIconName,
    String? selectedScreenshotName,

    @Default('') String selectedFileErrorMessage,

    // Added for scroll pagination
    @Default(false) bool isFetchingMore,

    // Optional: To indicate end of data
    @Default(true) bool hasMoreData,

  }) = _DashboardState;
}


enum DashBoardStatus {
  initial,
  loading,
  error,
  toastError,
  success,
  addUpdateSuccess,
  deleteSuccess,
  updating,
  fileError,
  invalidFile,
  uploadSuccess,
  download,
  iconSuccess,
  iconError,
  invalidImageFile,
  imageError,
  imageSuccess
}