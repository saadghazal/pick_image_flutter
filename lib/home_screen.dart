import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pick_image/pick_image_cubit/pick_image_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.maxFinite,
        width: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<PickImageCubit, PickImageState>(
              builder: (context, state) {
                if (state.imageStatus == ImageStatus.picking) {
                  return const CircularProgressIndicator(color: Colors.blue);
                }
                return CircleAvatar(
                  radius: 60,
                  backgroundImage:  state.pickedImagePath.isEmpty?const AssetImage('assets/user-3.png') as ImageProvider:FileImage(File(state.pickedImagePath)),

                );
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: () {
                showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  isScrollControlled: true,
                  context: context,
                  builder: (context) {
                    return Container(
                      height: 200,
                      width: double.maxFinite,
                      margin: const EdgeInsets.only(
                        bottom: 25,
                        left: 16,
                        right: 16,
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () async {
                                  context
                                      .read<PickImageCubit>()
                                      .chooseImageFromCamera()
                                      .then(
                                    (value) {
                                      Navigator.of(context).pop();
                                    },
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  shadowColor: Colors.blue,
                                ),
                                child: const Row(
                                  children: [
                                    Icon(Icons.camera),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text('Camera'),
                                  ],
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  context
                                      .read<PickImageCubit>()
                                      .chooseImageFromGallery()
                                      .then(
                                    (value) {
                                      Navigator.of(context).pop();
                                    },
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  shadowColor: Colors.blue,
                                ),
                                child: const Row(
                                  children: [
                                    Icon(Icons.photo),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text('Gallery'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red.shade50,
                              shadowColor: Colors.red,
                              foregroundColor: Colors.red,
                            ),
                            child: const Text(
                              'Cancel',
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                          const Spacer(),
                        ],
                      ),
                    );
                  },
                );
              },
              child: const Text('Pick Your Photo'),
            )
          ],
        ),
      ),
    );
  }
}
