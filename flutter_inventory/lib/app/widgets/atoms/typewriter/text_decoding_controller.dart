import 'dart:async';
import 'dart:math';

/// Creates Queue
class Character {
  /// Constructor
  Character(this.from, this.to, this.end, this.start);

  /// From string
  final String from;

  /// To String
  final String to;

  /// Where starts
  final int start;

  /// Where it ends
  final int end;

  /// Character
  String char = '';
}

/// Text Scramble
class TextDecodingController {
  /// Constructor
  TextDecodingController(void Function(String) fn, {Duration? duration})
      : _fn = fn,
        _delay = duration ?? const Duration(milliseconds: 1);

  /// Callback function for update
  final Function(String) _fn;

  /// Current text dislpayed
  String _data = '';

  /// Animation frame
  late int _frame;
  final String _chars = r'!<>-_\\/[]{}—=+*^?#________';

  /// Scramble delay
  final Duration _delay;

  /// Should cancel process
  bool _cancel = false;

  final List<Character> _queue = <Character>[];

  /// Sets initial text
  void setData(String newText) {
    _frame = 0;
    final length = max(_data.length, newText.length);
    final oldText = _data.padRight(length);
    newText = newText.padRight(length);

    // Clears queue
    _queue.clear();

    for (var i = 0; i < length; i++) {
      final from = oldText[i];
      final to = newText[i];
      final start = Random().nextInt(200);
      final end = start + Random().nextInt(200);
      _queue.add(Character(from, to, end, start));
    }
    update();
  }

  void dispose() {
    _cancel = true;
  }

  /// Updates text
  Future<void> update() async {
    if (_cancel) return;
    var output = '';
    var complete = 0;

    void createOutput(Character c) {
      if (_frame >= c.end) {
        complete++;
        output += c.to;
      } else if (_frame >= c.start) {
        // if (c.char.isEmpty || Random().nextDouble() < 0.28) {
        // }
        // Different color letters for loading
        c.char = _randomChar();
        output += c.char;
      } else {
        output += c.from;
      }
    }

    _queue.forEach(createOutput);

    _data = output;
    _fn(_data);

    // Return if its complete
    if (complete == _queue.length) return;

    _frame++;
    Future.delayed(_delay, update);
  }

  String _randomChar() {
    return _chars[Random().nextInt(_chars.length)];
  }
}
