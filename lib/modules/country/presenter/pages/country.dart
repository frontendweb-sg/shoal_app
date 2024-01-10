import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoal_app/config/theme/colors.dart';
import 'package:shoal_app/core/constants/images.dart';
import 'package:shoal_app/modules/country/presenter/pages/add_country.dart';
import 'package:shoal_app/modules/country/presenter/providers/country.dart';
import 'package:shoal_app/shared/widgets/navbar.dart';
import 'package:shoal_app/core/extensions/capitalize.dart';

class CountryScreen extends ConsumerStatefulWidget {
  const CountryScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _CountryScreenState();
  }
}

const queryDoc = r'''
query countries{
  countries{
    id
    name
    isoCode
  }
}
''';

class _CountryScreenState extends ConsumerState<CountryScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 0), () async {
      await ref.read(countryProvider.notifier).getAllCountry(queryDoc);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  void onOpenModal() {
    showModalBottomSheet(
      context: context,
      builder: (buildder) => const AddCountry(),
    );
  }

  Future<void> onReferesh() async {
    Future.delayed(const Duration(seconds: 5), () async {
      ref.read(countryProvider.notifier).getRefreshData(queryDoc);
      await ref.read(countryProvider.notifier).getRefreshData(queryDoc);
    });
  }

  @override
  Widget build(BuildContext context) {
    final data = ref.watch(countryProvider);

    return Scaffold(
      appBar: Navbar(
        title: "Country",
        actions: [
          IconButton(
            onPressed: () {
              onOpenModal();
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: RefreshIndicator(
        backgroundColor: AppColor.kWhite,
        onRefresh: () async {
          Future.delayed(const Duration(seconds: 10), () {
            ref.refresh(countryProvider.notifier).getRefreshData(queryDoc);
          });
        },
        child: Container(
          padding: const EdgeInsets.all(15.0),
          child: data.whenOrNull(
            data: (data) => data!.isEmpty
                ? Container(
                    width: double.infinity,
                    height: double.infinity,
                    color: AppColor.kWhite,
                    child: Center(
                      child: Image.asset(
                        AppImage.imgNoImage,
                      ),
                    ),
                  )
                : ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (builder, index) => listItem(
                      label: data[index].name!,
                    ),
                  ),
            error: (error, stackTrace) => Text(error.toString()),
            loading: () {
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget listItem({required String label, String? cCode, String? id}) {
    return Dismissible(
      direction: DismissDirection.startToEnd,
      key: ValueKey(label),
      background: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: const Color.fromARGB(9, 250, 48, 48),
        ),
      ),
      onDismissed: (DismissDirection direction) {},
      child: Container(
        margin: const EdgeInsets.only(bottom: 10.0),
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: const Color.fromRGBO(0, 0, 0, 0.04),
        ),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: const Color.fromRGBO(0, 0, 0, 0.08),
            child: Text(
              label.substring(0, 1).toUpperCase(),
              style: TextStyle(
                color:
                    Colors.primaries[Random().nextInt(Colors.primaries.length)],
              ),
            ),
          ),
          title: Text(label.toCapitalize()),
        ),
      ),
    );
  }
}
