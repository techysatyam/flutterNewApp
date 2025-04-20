part of 'dashboard_bloc.dart';

@freezed
class DashboardEvent with _$DashboardEvent {
  const factory DashboardEvent.getForm({
    @Default(1) int pageNumber,
    @Default(false) bool? loadMore,
  }) = _GetForm;
  const factory DashboardEvent.addForm() = _AddForm;
  const factory DashboardEvent.uploadApk() = _UploadApk;
  const factory DashboardEvent.selectFile() = _SelectFile;
  const factory DashboardEvent.selectImage() = _SelectImage;
  const factory DashboardEvent.selectIcon() = _SelectIcon;
  const factory DashboardEvent.removeLastScreenshot(int index) = _RemoveLastScreenshot;
  const factory DashboardEvent.checkIfAppInstalled(String packageName) = _CheckIfAppInstalled;

}
