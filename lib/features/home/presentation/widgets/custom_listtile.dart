import 'package:flutter/material.dart';
import 'package:qic/core/colors/app_colors.dart';
import 'package:qic/data/models/data_model.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.selectedID,
    required this.result,
  });

  final int? selectedID;
  final DataModel result;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: selectedID == result.id ? AppColors.kWhite : AppColors.kYellow,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: AppColors.kWhite,
          child: Text(result.id.toString()),
        ),
        title: Text(
          result.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        subtitle: Text(
          result.body,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.labelMedium!.copyWith(),
        ),
      ),
    );
  }
}
