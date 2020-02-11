// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_view_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PageViewController on _PageViewControllerBase, Store {
  final _$pageAtom = Atom(name: '_PageViewControllerBase.page');

  @override
  int get page {
    _$pageAtom.context.enforceReadPolicy(_$pageAtom);
    _$pageAtom.reportObserved();
    return super.page;
  }

  @override
  set page(int value) {
    _$pageAtom.context.conditionallyRunInAction(() {
      super.page = value;
      _$pageAtom.reportChanged();
    }, _$pageAtom, name: '${_$pageAtom.name}_set');
  }

  final _$_PageViewControllerBaseActionController =
      ActionController(name: '_PageViewControllerBase');

  @override
  dynamic changePage(int newPage) {
    final _$actionInfo =
        _$_PageViewControllerBaseActionController.startAction();
    try {
      return super.changePage(newPage);
    } finally {
      _$_PageViewControllerBaseActionController.endAction(_$actionInfo);
    }
  }
}
