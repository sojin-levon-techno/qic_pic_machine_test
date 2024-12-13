import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qic/core/colors/app_colors.dart';
import 'package:qic/core/constants/app_constants.dart';
import 'package:qic/features/home/presentation/data_bloc/bloc/data_bloc.dart';
import 'package:qic/features/home/presentation/pages/details_page/details_page.dart';
import 'package:qic/features/home/presentation/widgets/custom_listtile.dart';
import 'package:redacted/redacted.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int? selectedID;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: AppColors.kWhite,
        foregroundColor: AppColors.kWhite,
        surfaceTintColor: AppColors.kWhite,
        automaticallyImplyLeading: false,
        leading: const Padding(
          padding: EdgeInsets.all(10),
          child: CircleAvatar(
            backgroundImage: AssetImage(image),
          ),
        ),
        centerTitle: true,
        title: Text(
          "QICPIC",
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
      body: RefreshIndicator(
        color: AppColors.kPrimary,
        backgroundColor: AppColors.kWhite,
        onRefresh: _onRefresh,
        child: BlocBuilder<DataBloc, DataState>(
          builder: (context, state) {
            if (state is DataInitial) {
              context.read<DataBloc>().add(FetchDataEvent());
            }
            if (state is DataLoading) {
              return ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        clipBehavior: Clip.antiAlias,
                      ).redacted(context: context, redact: true),
                      title:
                          const Text("skdlfjlksdfslkdfjslkdfjlskdfjaslkdfjsa")
                              .redacted(context: context, redact: true),
                      subtitle: const Text(
                              "skldfjslkdfjskdjflskdfjs ldfjsldkfjsdfkljs dfksjdflksdfjlk")
                          .redacted(context: context, redact: true),
                    ).redacted(context: context, redact: true);
                  });
            } else if (state is DataSuccess) {
              return ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: kPadding10),
                itemCount: state.result.length,
                itemBuilder: (context, index) {
                  final result = state.result[index];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedID = result.id;
                      });
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => DetailsPage(
                            dataModel: result,
                          ),
                        ),
                      );
                    },
                    child: CustomListTile(
                      selectedID: selectedID,
                      result: result,
                    ),
                  );
                },
              );
            } else if (state is DataError) {
              return Center(
                child: Text(state.message),
              );
            }
            return Center(
              child: CircularProgressIndicator(
                color: AppColors.kPrimary,
                backgroundColor: AppColors.kWhite,
              ),
            );
          },
        ),
      ),
    );
  }

  Future<void> _onRefresh() async {
    await Future.delayed(const Duration(seconds: 2));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomePage()),
    );
  }
}
