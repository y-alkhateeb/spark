import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_model.freezed.dart';
part 'register_model.g.dart';

@freezed
class RegisterModel with _$RegisterModel {
	const factory RegisterModel({
		final String? phoneNumber,
		final String? userName,
		final String? name,
		final String? imageUrl,
		final String? id,
		final String? createDate,
		final String? lastModifiedDate,
		final String? creatorId,
		final String? modifierId,
		final String? creator,
		final String? modifier,
	}) = _RegisterModel;

	factory RegisterModel.fromJson(Map<String, dynamic> json) => _$RegisterModelFromJson(json);
}
