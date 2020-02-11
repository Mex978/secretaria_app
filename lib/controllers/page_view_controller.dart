import 'package:mobx/mobx.dart';
part 'page_view_controller.g.dart';

class PageViewController = _PageViewControllerBase with _$PageViewController;

abstract class _PageViewControllerBase with Store {
  @observable
  int page = 0;

  @action
  changePage(int newPage) {
    page = newPage;
  }
}
