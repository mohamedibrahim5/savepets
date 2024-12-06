import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:save/core/utils/app_colors.dart';
import 'package:save/core/utils/media_query_values.dart';
import 'package:save/presentation/manager/cubit/requst_cubit.dart';
import 'package:save/presentation/manager/states/request_states.dart';
import 'package:save/presentation/view/widgets/custom_button.dart';
import 'package:save/presentation/view/widgets/text_form_field.dart';

// ignore: must_be_immutable
class RequestScreen extends StatefulWidget {
  const RequestScreen({super.key});

  @override
  State<RequestScreen> createState() => _RequestScreenState();
}

class _RequestScreenState extends State<RequestScreen> {
  final _formKey = GlobalKey<FormState>();
  // ignore: non_constant_identifier_names
  final TextEditingController genderController = TextEditingController();
  final TextEditingController kindController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController colorController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RequestCubit(),
      child: BlocConsumer<RequestCubit, RequestState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = RequestCubit.get(context);
          return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_new_outlined,
                    color: AppColors.offWhite,
                  ),
                ),
                title: Text(
                  "Apply request",
                  style: TextStyle(color: AppColors.offWhite),
                ),
                backgroundColor: AppColors.darkBrown,
              ),
              body: SingleChildScrollView(
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(
                        10,
                      ),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              "assets/photos/victor-dog.png",
                              height: context.height * 0.35,
                            ),
                            defualtFormField(
                              controller: genderController,
                              label: "Gender",
                              type: TextInputType.text,
                              validate: (value) {},
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            defualtFormField(
                              controller: kindController,
                              label: "Kind",
                              type: TextInputType.text,
                              validate: (value) {},
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            defualtFormField(
                              controller: ageController,
                              label: "Age",
                              type: TextInputType.number,
                              validate: (value) {},
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            defualtFormField(
                              controller: colorController,
                              label: "Color",
                              type: TextInputType.text,
                              validate: (value) {},
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            defualtFormField(
                              controller: phoneController,
                              label: "Phone",
                              type: TextInputType.phone,
                              validate: (value) {},
                            ),
                            SizedBox(
                              height: context.height * 0.05,
                            ),
                            BlocBuilder<RequestCubit, RequestState>(
                              builder: (context, state) {
                                if (state is RequestLoadingState) {
                                  return CircularProgressIndicator(
                                    color: AppColors.darkBrown,
                                  );
                                } else {
                                  return CustomButton(
                                    lable: "Request",
                                    height: 50,
                                    width: 500,
                                    backgroundColor: AppColors.darkBrown,
                                    textColor: AppColors.offWhite,
                                    isOutlined: false,
                                    onTap: () {
                                      cubit.requestMethod(
                                          age: ageController.text,
                                          color: colorController.text,
                                          gender: genderController.text,
                                          kind: kindController.text,
                                          phone: phoneController.text);
                                      setState(() {
                                        ageController.text = "";
                                        colorController.text = "";
                                        genderController.text = "";
                                        kindController.text = "";
                                        phoneController.text = "";
                                      });
                                    },
                                  );
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ));
        },
      ),
    );
  }
}
