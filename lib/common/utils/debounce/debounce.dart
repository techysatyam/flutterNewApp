import 'dart:async';
import 'dart:ui';

class Debounce {
  final int milliseconds;
  VoidCallback? action;
  Timer? _timer;

  Debounce({required this.milliseconds});

  void run(VoidCallback action) {
    _timer?.cancel();
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }

  void dispose() {
    _timer?.cancel();
  }
}

// to use it create a variable on ui you can give time duration according to you
//========>> final Debounce _debounce = Debounce(milliseconds: 500);
//========>> then call this in on change of text field
// onChanged: (val) {
// _debounce.run(() {
// var bloc = context.read<ServiceBloc>();
// int enterPage = int.tryParse(val) ?? 1;
// int totalPage =
// state.getAllServiceModel?.totalPages ?? 0;
// if (enterPage <= totalPage && enterPage != 0) {
// bloc.add(ServiceEvent.getAllService(
// pageNumber: int.tryParse(val) ?? 1));
// }
// });
// },
