// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bill_module_tip.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BillModule_Tip {
  double get totalTip => throw _privateConstructorUsedError;
  bool get includedInTotalSpent => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BillModule_TipCopyWith<BillModule_Tip> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BillModule_TipCopyWith<$Res> {
  factory $BillModule_TipCopyWith(
          BillModule_Tip value, $Res Function(BillModule_Tip) then) =
      _$BillModule_TipCopyWithImpl<$Res, BillModule_Tip>;
  @useResult
  $Res call({double totalTip, bool includedInTotalSpent});
}

/// @nodoc
class _$BillModule_TipCopyWithImpl<$Res, $Val extends BillModule_Tip>
    implements $BillModule_TipCopyWith<$Res> {
  _$BillModule_TipCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalTip = null,
    Object? includedInTotalSpent = null,
  }) {
    return _then(_value.copyWith(
      totalTip: null == totalTip
          ? _value.totalTip
          : totalTip // ignore: cast_nullable_to_non_nullable
              as double,
      includedInTotalSpent: null == includedInTotalSpent
          ? _value.includedInTotalSpent
          : includedInTotalSpent // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BillModule_TipCopyWith<$Res>
    implements $BillModule_TipCopyWith<$Res> {
  factory _$$_BillModule_TipCopyWith(
          _$_BillModule_Tip value, $Res Function(_$_BillModule_Tip) then) =
      __$$_BillModule_TipCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double totalTip, bool includedInTotalSpent});
}

/// @nodoc
class __$$_BillModule_TipCopyWithImpl<$Res>
    extends _$BillModule_TipCopyWithImpl<$Res, _$_BillModule_Tip>
    implements _$$_BillModule_TipCopyWith<$Res> {
  __$$_BillModule_TipCopyWithImpl(
      _$_BillModule_Tip _value, $Res Function(_$_BillModule_Tip) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalTip = null,
    Object? includedInTotalSpent = null,
  }) {
    return _then(_$_BillModule_Tip(
      totalTip: null == totalTip
          ? _value.totalTip
          : totalTip // ignore: cast_nullable_to_non_nullable
              as double,
      includedInTotalSpent: null == includedInTotalSpent
          ? _value.includedInTotalSpent
          : includedInTotalSpent // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_BillModule_Tip implements _BillModule_Tip {
  _$_BillModule_Tip({this.totalTip = 0, this.includedInTotalSpent = false});

  @override
  @JsonKey()
  final double totalTip;
  @override
  @JsonKey()
  final bool includedInTotalSpent;

  @override
  String toString() {
    return 'BillModule_Tip(totalTip: $totalTip, includedInTotalSpent: $includedInTotalSpent)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BillModule_Tip &&
            (identical(other.totalTip, totalTip) ||
                other.totalTip == totalTip) &&
            (identical(other.includedInTotalSpent, includedInTotalSpent) ||
                other.includedInTotalSpent == includedInTotalSpent));
  }

  @override
  int get hashCode => Object.hash(runtimeType, totalTip, includedInTotalSpent);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BillModule_TipCopyWith<_$_BillModule_Tip> get copyWith =>
      __$$_BillModule_TipCopyWithImpl<_$_BillModule_Tip>(this, _$identity);
}

abstract class _BillModule_Tip implements BillModule_Tip {
  factory _BillModule_Tip(
      {final double totalTip,
      final bool includedInTotalSpent}) = _$_BillModule_Tip;

  @override
  double get totalTip;
  @override
  bool get includedInTotalSpent;
  @override
  @JsonKey(ignore: true)
  _$$_BillModule_TipCopyWith<_$_BillModule_Tip> get copyWith =>
      throw _privateConstructorUsedError;
}
