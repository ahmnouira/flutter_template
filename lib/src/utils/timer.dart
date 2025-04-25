import 'dart:async' show FutureOr;

void delaySeconds({
  int seconds = 2,
  FutureOr<dynamic> Function()? callback,
}) {
  Future.delayed(Duration(seconds: seconds), callback);
}

void delayMilliseconds({
  int milliseconds = 700,
  FutureOr<dynamic> Function()? callback,
}) {
  Future.delayed(Duration(milliseconds: milliseconds), callback);
}

void wait(
  FutureOr<dynamic> Function()? callback,
) {
  delayMilliseconds(
    milliseconds: 0,
    callback: callback,
  );
}
