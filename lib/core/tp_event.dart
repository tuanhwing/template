
enum TPStatus {
  none,
  loading,
  success,
  error
}

abstract class TPEvent<T> {
  TPStatus status;
  T data;
}