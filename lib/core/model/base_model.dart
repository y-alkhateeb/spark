abstract class BaseModel<T> {
  Map<String, Object?> toMap();
  T fromJson(Map<String, dynamic> json);
}