import 'package:flutter/material.dart';
import 'package:qic/core/colors/app_colors.dart';
import 'package:qic/core/constants/app_constants.dart';
import 'package:qic/data/models/data_model.dart';

class DetailsPage extends StatefulWidget {
  final DataModel dataModel;
  const DetailsPage({
    super.key,
    required this.dataModel,
  });

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.kWhite,
        surfaceTintColor: AppColors.kWhite,
        // foregroundColor: AppColors.kWhite,
        centerTitle: true,
        title: Text(
          widget.dataModel.title,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: kPadding10, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.dataModel.body,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(),
            Column(
              children: [
                Text(
                  "Version",
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(color: Colors.grey),
                ),
                Text(
                  "3.24",
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .copyWith(color: Colors.grey),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
