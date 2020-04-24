import 'dart:core';

extension Additions on Duration {
  String toReadable() {
    var seconds = this.inSeconds.abs();
    if (seconds < 60) {
      return "${seconds}s";
    }
    else {
      var mins = (seconds / 60).floor();
      var secs = (seconds % 60).toInt();
      var string = "${mins}m";
      if (secs > 0) {
        string += " ${secs}s";
      }
      return string;
    }
  }
}