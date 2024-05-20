import 'dart:async';

import 'package:flutter/material.dart';

class StopWatchProvider extends ChangeNotifier {
  final Stopwatch _stopwatch = Stopwatch();
  final StreamController<Duration> _streamController =
      StreamController.broadcast();
  final List<Duration> _laps = [];
  bool _lapsReverse = false;
  final ScrollController scrollController = ScrollController();

  List<Duration> get totalLaps => _laps;

  bool get reverse => _lapsReverse;

  bool get isRunning => _stopwatch.isRunning;

  Duration get currentTime => _stopwatch.elapsed;

  void start() {
    _stopwatch.start();
    _streamController.addStream(_getElapsedTime);
    notifyListeners();
  }

  void pause() {
    _stopwatch.stop();
    notifyListeners();
  }

  void reset() {
    pause();
    _stopwatch.reset();
    _laps.clear();
    _streamController.sink.add(_stopwatch.elapsed);
    notifyListeners();
  }

  Future<void> addLap() async {
    _laps.add(_stopwatch.elapsed);
    if (_laps.length > 2) {
      await scrollController.animateTo(
        _lapsReverse ? 0 : scrollController.position.maxScrollExtent + 56,
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastOutSlowIn,
      );
    }
    notifyListeners();
  }

  Stream<Duration> get _getElapsedTime async* {
    while (_stopwatch.isRunning) {
      await Future.delayed(const Duration(microseconds: 100));
      yield _stopwatch.elapsed;
    }
  }

  Stream<Duration> get getTimeStream =>
      _streamController.stream.asBroadcastStream();

  void changeDirection() {
    _lapsReverse = !_lapsReverse;

    notifyListeners();
    if (_laps.length > 2) {
      scrollController.animateTo(
        _lapsReverse ? 0 : scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastOutSlowIn,
      );
    }
  }

  @override
  Future<void> dispose() async {
    await _streamController.close();
    super.dispose();
  }
}
