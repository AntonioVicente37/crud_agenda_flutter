// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_list.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ContactL on _ContactL, Store {
  late final _$listAtom = Atom(name: '_ContactL.list', context: context);

  @override
  Future<List<Contact>>? get list {
    _$listAtom.reportRead();
    return super.list;
  }

  @override
  set list(Future<List<Contact>>? value) {
    _$listAtom.reportWrite(value, super.list, () {
      super.list = value;
    });
  }

  late final _$_ContactLActionController =
      ActionController(name: '_ContactL', context: context);

  @override
  dynamic refreshList([dynamic value]) {
    final _$actionInfo =
        _$_ContactLActionController.startAction(name: '_ContactL.refreshList');
    try {
      return super.refreshList(value);
    } finally {
      _$_ContactLActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
list: ${list}
    ''';
  }
}
