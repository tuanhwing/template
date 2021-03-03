
import 'dart:async';

class TPObserver<T> {
  StreamController _controller = StreamController<T>.broadcast();

  StreamSubscription listen<T>(void Function(T) onDataChanged, {Function onError, void Function() onDone}) {
    return _controller.stream.listen(onDataChanged, onError: onError, onDone: onDone);
  }

  void addEvent<T>(T event) {
    _controller.sink.add(event);
  }

  void dispose() {
    _controller.close();
  }
}