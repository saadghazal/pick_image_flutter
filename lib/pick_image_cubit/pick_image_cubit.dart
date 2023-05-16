import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

part 'pick_image_state.dart';

class PickImageCubit extends Cubit<PickImageState> {
  final ImagePicker imagePicker;
  PickImageCubit({required this.imagePicker}) : super(PickImageState.initial());
  Future<void> chooseImageFromGallery() async {
    emit(state.copyWith(imageStatus: ImageStatus.picking));

    final pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedImage == null) {
      emit(state.copyWith(imageStatus: ImageStatus.notPicked));
    } else {
      emit(
        state.copyWith(
          imageStatus: ImageStatus.picked,
          pickedImagePath: pickedImage.path,
        ),
      );
    }
  }
  Future<void> chooseImageFromCamera() async {
    emit(state.copyWith(imageStatus: ImageStatus.picking));

    final pickedImage =
    await imagePicker.pickImage(source: ImageSource.camera);
    if (pickedImage == null) {
      emit(state.copyWith(imageStatus: ImageStatus.notPicked));
    } else {
      emit(
        state.copyWith(
          imageStatus: ImageStatus.picked,
          pickedImagePath: pickedImage.path,
        ),
      );
    }
  }
}
