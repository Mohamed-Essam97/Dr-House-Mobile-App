import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SmartRefresherWidget extends StatefulWidget {
  final Future<void> Function() onRefresh;
  final Future<void> Function() onLoading;
  final Widget child;
  final bool enablePullUp; // Whether to enable load more functionality
  final bool pullUpIsLoading; // Whether to enable load more functionality

  const SmartRefresherWidget({
    Key? key,
    required this.onRefresh,
    required this.onLoading,
    required this.child,
    this.enablePullUp = false,
    this.pullUpIsLoading = false,
  }) : super(key: key);

  @override
  _SmartRefresherWidgetState createState() => _SmartRefresherWidgetState();
}

class _SmartRefresherWidgetState extends State<SmartRefresherWidget> {
  late RefreshController _refreshController;

  @override
  void initState() {
    super.initState();
    _refreshController = RefreshController();
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  void _onRefresh() async {
    setState(() {});

    try {
      await widget.onRefresh();
    } finally {
      if (_refreshController.isRefresh) {
        _refreshController.refreshCompleted();
      }
      if (_refreshController.isLoading) {
        _refreshController.loadComplete();
      }
    }
  }

  void _onLoading() async {
    if (widget.enablePullUp) {
      try {
        await widget.onLoading();
      } finally {
        if (_refreshController.isLoading) {
          _refreshController.loadComplete();
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      controller: _refreshController,
      enablePullDown: true,
      enablePullUp: widget.enablePullUp,
      onRefresh: _onRefresh,
      onLoading: widget.enablePullUp ? _onLoading : null,
      header: WaterDropMaterialHeader(),
      footer: ClassicFooter(
        loadStyle: LoadStyle.ShowWhenLoading,
        idleText: "Pull up to load more",
        canLoadingText: "Release to load more",
        loadingText: "Loading...",
        noDataText: "No more data",
        failedText: "Load failed! Tap to retry",
      ),
      child: widget.child,
    );
  }
}
