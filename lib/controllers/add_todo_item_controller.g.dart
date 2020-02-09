// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_todo_item_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AddTodoItemController on _AddTodoItemControllerBase, Store {
  Computed<bool> _$validateComputed;

  @override
  bool get validate =>
      (_$validateComputed ??= Computed<bool>(() => super.validate)).value;

  final _$titleAtom = Atom(name: '_AddTodoItemControllerBase.title');

  @override
  String get title {
    _$titleAtom.context.enforceReadPolicy(_$titleAtom);
    _$titleAtom.reportObserved();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.context.conditionallyRunInAction(() {
      super.title = value;
      _$titleAtom.reportChanged();
    }, _$titleAtom, name: '${_$titleAtom.name}_set');
  }

  final _$descriptionAtom =
      Atom(name: '_AddTodoItemControllerBase.description');

  @override
  String get description {
    _$descriptionAtom.context.enforceReadPolicy(_$descriptionAtom);
    _$descriptionAtom.reportObserved();
    return super.description;
  }

  @override
  set description(String value) {
    _$descriptionAtom.context.conditionallyRunInAction(() {
      super.description = value;
      _$descriptionAtom.reportChanged();
    }, _$descriptionAtom, name: '${_$descriptionAtom.name}_set');
  }

  final _$dateAtom = Atom(name: '_AddTodoItemControllerBase.date');

  @override
  DateTime get date {
    _$dateAtom.context.enforceReadPolicy(_$dateAtom);
    _$dateAtom.reportObserved();
    return super.date;
  }

  @override
  set date(DateTime value) {
    _$dateAtom.context.conditionallyRunInAction(() {
      super.date = value;
      _$dateAtom.reportChanged();
    }, _$dateAtom, name: '${_$dateAtom.name}_set');
  }

  final _$_AddTodoItemControllerBaseActionController =
      ActionController(name: '_AddTodoItemControllerBase');

  @override
  dynamic changeTitle(String newTitle) {
    final _$actionInfo =
        _$_AddTodoItemControllerBaseActionController.startAction();
    try {
      return super.changeTitle(newTitle);
    } finally {
      _$_AddTodoItemControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeDescription(String newDescription) {
    final _$actionInfo =
        _$_AddTodoItemControllerBaseActionController.startAction();
    try {
      return super.changeDescription(newDescription);
    } finally {
      _$_AddTodoItemControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeDate(DateTime newDate) {
    final _$actionInfo =
        _$_AddTodoItemControllerBaseActionController.startAction();
    try {
      return super.changeDate(newDate);
    } finally {
      _$_AddTodoItemControllerBaseActionController.endAction(_$actionInfo);
    }
  }
}
