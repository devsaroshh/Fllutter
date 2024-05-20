import 'package:flutter_test/flutter_test.dart';
import 'package:stopwatch/core/providers/stop_watch_provider.dart';

void main() {
  late StopWatchProvider stopWatchProvider;

  setUp(() => stopWatchProvider = StopWatchProvider());
  tearDown(() => stopWatchProvider.pause());

  test('Start stopwatch', () {
    stopWatchProvider.start();

    expect(stopWatchProvider.isRunning, isTrue);
  });

  test('Pause stopwatch', () {
    stopWatchProvider.start();
    stopWatchProvider.pause();

    expect(stopWatchProvider.isRunning, isFalse);
  });

  test('Reset stopwatch', () async {
    stopWatchProvider.reset();

    expect(stopWatchProvider.isRunning, isFalse);
    expect(stopWatchProvider.currentTime, Duration.zero);
    expect(stopWatchProvider.totalLaps, isEmpty);
  });

  test('Add lap to stopwatch', () async {
    stopWatchProvider.start();
    await Future.delayed(const Duration(seconds: 1));
    await stopWatchProvider.addLap();

    expect(stopWatchProvider.totalLaps.length, 1);
    expect(stopWatchProvider.totalLaps[0], isNot(Duration.zero));
  });

  test('Change direction of laps', () {
    final initialDirection = stopWatchProvider.reverse;

    stopWatchProvider.changeDirection();

    expect(stopWatchProvider.reverse, isNot(initialDirection));
  });

  test('getTimeStream emits values when the stopwatch is running', () async {
    stopWatchProvider.start();

    await Future.delayed(const Duration(seconds: 1));
    final time = await stopWatchProvider.getTimeStream.first;
    expect(time, isNot(Duration.zero));
  });

  test(
      'getTimeStream emits a specific value when the stopwatch is paused after specific duration',
      () async {
    const durationSeconds = 2;
    stopWatchProvider.start();

    await Future.delayed(const Duration(seconds: 2));
    final time = await stopWatchProvider.getTimeStream.first;
    final seconds = time.toString().split(':')[2];
    expect(int.parse(seconds.split('.')[0]), durationSeconds);
  });
}
