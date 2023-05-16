part of 'pick_image_cubit.dart';

enum ImageStatus {
  initial,
  picking,
  picked,
  notPicked,
}

class PickImageState extends Equatable {
  final ImageStatus imageStatus;
  final String pickedImagePath;

  const PickImageState({
    required this.imageStatus,
    required this.pickedImagePath,
  });

  factory PickImageState.initial() {
    return const PickImageState(
      imageStatus: ImageStatus.initial,
      pickedImagePath: '',
    );
  }

  @override
  String toString() {
    return 'PickImageState{imageStatus: $imageStatus, pickedImagePath: $pickedImagePath}';
  }

  @override
  List<Object> get props => [imageStatus, pickedImagePath];

  PickImageState copyWith({
    ImageStatus? imageStatus,
    String? pickedImagePath,
  }) {
    return PickImageState(
      imageStatus: imageStatus ?? this.imageStatus,
      pickedImagePath: pickedImagePath ?? this.pickedImagePath,
    );
  }
}
