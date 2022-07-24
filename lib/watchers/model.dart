import 'package:flutter/widgets.dart';

class StatefulWatcherModel extends StatefulWidget {
  final Map<String, dynamic> aspects;
  final WidgetBuilder builder;
  final dynamic model;

  const StatefulWatcherModel({
    super.key,
    required this.builder,
    required this.aspects,
    required this.model,
  });

  @override
  State<StatefulWatcherModel> createState() => _StatefulWatcherModelState();
}

class _StatefulWatcherModelState extends State<StatefulWatcherModel> {
  dynamic model;

  @override
  void initState() {
    super.initState();
    model = widget.model;
  }

  void modelChanged(dynamic model) {
    setState(() {
      this.model = model;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WatcherModel(
      builder: widget.builder,
      aspects: widget.aspects,
      updateModel: modelChanged,
    );
  }
}

class WatcherModel extends InheritedModel<String> {
  final Map<String, dynamic> aspects;
  final WidgetBuilder builder;
  final void Function(dynamic model)? updateModel;

  WatcherModel({
    super.key,
    required this.builder,
    required this.aspects,
    required this.updateModel,
  }) : super(
          child: Builder(
            builder: builder,
          ),
        );

  /// Static assessor used to access Watcher from any descendant widget
  /// only to watch specific part of model
  static W of<W extends WatcherModel>(BuildContext context, String aspect) {
    final W? result = InheritedModel.inheritFrom<W>(context, aspect: aspect);
    assert(result != null, 'No InheritedModel of type $W found in context');
    return result!;
  }

  @override
  bool updateShouldNotifyDependent(
    covariant WatcherModel oldWidget,
    Set<String> dependencies,
  ) {
    debugPrint('updateShouldNotifyDependent');
    for (var key in aspects.keys) {
      if (dependencies.contains(key) &&
          aspects[key] != oldWidget.aspects[key]) {
        debugPrint('update only $key aspect');
        return true;
      }
    }
    return false;
  }

  @override
  bool updateShouldNotify(covariant WatcherModel oldWidget) {
    return aspects.keys
        .where((key) => aspects[key] != oldWidget.aspects[key])
        .isNotEmpty;
  }
}
