

abstract class TPBackPlatformListener {
  void onTapBackPlatform();
}

class TPBackPlatformObserver {

  static final TPBackPlatformObserver _singleton = TPBackPlatformObserver._internal();
  factory TPBackPlatformObserver() {
    return _singleton;
  }
  TPBackPlatformObserver._internal();

  List<TPBackPlatformListener> _listeners = [];

  void addListener(TPBackPlatformListener listener) => _listeners.add(listener);

  void removeListener(TPBackPlatformListener listener) => _listeners.remove(listener);

  ///Notify to last listener
  void notify() {
    if (_listeners.isEmpty) return;

    TPBackPlatformListener listener = _listeners.last;
    listener.onTapBackPlatform();
  }
}