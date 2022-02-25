abstract class BaseError{
  const BaseError();
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BaseError && runtimeType == other.runtimeType;

  @override
  int get hashCode => 0;
}