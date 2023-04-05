import 'dart:developer';

import 'package:flutter/material.dart';

enum GridWidgetType { fixedCrossAxis, maxCrossAxis }

class GirdWidget<T> extends StatefulWidget {
  final List<T> list;

  final Widget Function(T item) builder;

  final GridWidgetType type;

  final EdgeInsetsGeometry padding;
  final int crossAxisCount;

  final double maxCrossAxisExtent;

  const GirdWidget({
    super.key,
    required this.list,
    required this.builder,
    this.crossAxisCount = 2,
    this.maxCrossAxisExtent = 500,
    this.type = GridWidgetType.fixedCrossAxis,
    this.padding = const EdgeInsets.only(right: 8, left: 8),
  });

  @override
  State<GirdWidget> createState() => _GirdWidgetState<T>();
}

class _GirdWidgetState<T> extends State<GirdWidget<T>> {
  late ScrollController _controller;

  @override
  void initState() {
    super.initState();
    // Initialize the scroll controller
    _controller = ScrollController();
    // Add a listener to the controller
    _controller.addListener(_scrollListener);
  }

  void _scrollListener() {
    // The user scroll to very bottom

    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      log('At the bottom!');
    }

    if (_controller.offset <= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      log('At the top!');
    }
  }

  @override
  void dispose() {
    _controller.removeListener(_scrollListener);
    super.dispose();
  }

  SliverGridDelegate _getGridDelegate() {
    if (widget.type == GridWidgetType.maxCrossAxis) {
      return SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: widget.maxCrossAxisExtent,
      );
    } else {
      return SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: widget.crossAxisCount,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding,
      child: GridView.builder(
        controller: _controller,
        gridDelegate: _getGridDelegate(),
        itemBuilder: (context, index) => widget.builder(widget.list[index]),
        itemCount: widget.list.length,
      ),
    );
  }
}
