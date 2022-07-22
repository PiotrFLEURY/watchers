// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'events_and_builders.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EventsData {
  bool get loading => throw _privateConstructorUsedError;
  bool get validating => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EventsDataCopyWith<EventsData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventsDataCopyWith<$Res> {
  factory $EventsDataCopyWith(
          EventsData value, $Res Function(EventsData) then) =
      _$EventsDataCopyWithImpl<$Res>;
  $Res call({bool loading, bool validating, int count});
}

/// @nodoc
class _$EventsDataCopyWithImpl<$Res> implements $EventsDataCopyWith<$Res> {
  _$EventsDataCopyWithImpl(this._value, this._then);

  final EventsData _value;
  // ignore: unused_field
  final $Res Function(EventsData) _then;

  @override
  $Res call({
    Object? loading = freezed,
    Object? validating = freezed,
    Object? count = freezed,
  }) {
    return _then(_value.copyWith(
      loading: loading == freezed
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      validating: validating == freezed
          ? _value.validating
          : validating // ignore: cast_nullable_to_non_nullable
              as bool,
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_EventsDataCopyWith<$Res>
    implements $EventsDataCopyWith<$Res> {
  factory _$$_EventsDataCopyWith(
          _$_EventsData value, $Res Function(_$_EventsData) then) =
      __$$_EventsDataCopyWithImpl<$Res>;
  @override
  $Res call({bool loading, bool validating, int count});
}

/// @nodoc
class __$$_EventsDataCopyWithImpl<$Res> extends _$EventsDataCopyWithImpl<$Res>
    implements _$$_EventsDataCopyWith<$Res> {
  __$$_EventsDataCopyWithImpl(
      _$_EventsData _value, $Res Function(_$_EventsData) _then)
      : super(_value, (v) => _then(v as _$_EventsData));

  @override
  _$_EventsData get _value => super._value as _$_EventsData;

  @override
  $Res call({
    Object? loading = freezed,
    Object? validating = freezed,
    Object? count = freezed,
  }) {
    return _then(_$_EventsData(
      loading: loading == freezed
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      validating: validating == freezed
          ? _value.validating
          : validating // ignore: cast_nullable_to_non_nullable
              as bool,
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_EventsData implements _EventsData {
  const _$_EventsData(
      {this.loading = false, this.validating = false, this.count = 0});

  @override
  @JsonKey()
  final bool loading;
  @override
  @JsonKey()
  final bool validating;
  @override
  @JsonKey()
  final int count;

  @override
  String toString() {
    return 'EventsData(loading: $loading, validating: $validating, count: $count)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EventsData &&
            const DeepCollectionEquality().equals(other.loading, loading) &&
            const DeepCollectionEquality()
                .equals(other.validating, validating) &&
            const DeepCollectionEquality().equals(other.count, count));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(loading),
      const DeepCollectionEquality().hash(validating),
      const DeepCollectionEquality().hash(count));

  @JsonKey(ignore: true)
  @override
  _$$_EventsDataCopyWith<_$_EventsData> get copyWith =>
      __$$_EventsDataCopyWithImpl<_$_EventsData>(this, _$identity);
}

abstract class _EventsData implements EventsData {
  const factory _EventsData(
      {final bool loading,
      final bool validating,
      final int count}) = _$_EventsData;

  @override
  bool get loading;
  @override
  bool get validating;
  @override
  int get count;
  @override
  @JsonKey(ignore: true)
  _$$_EventsDataCopyWith<_$_EventsData> get copyWith =>
      throw _privateConstructorUsedError;
}
