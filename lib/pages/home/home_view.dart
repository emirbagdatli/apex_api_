import 'package:apex_api/service/apex_service.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final ApexService _apexService;
  @override
  void initState() {
    super.initState();
    _apexService = ApexService();
    Future.microtask(() {
      _apexService.fetchMapRotation();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Apex Api Example'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Center(
              child: FutureBuilder(
            future: _apexService.fetchReplicator(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (!snapshot.hasData) {
                return const Text('No data available.');
              } else {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        //Text(snapshot.data?.current?.remainingTimer ?? ''),
                        Expanded(
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.5,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: snapshot.data?.length,
                                itemBuilder: ((context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      children: [
                                        ClipRRect(
                                            child: Image.network(
                                                snapshot.data?[index].bundleContent?[0].itemType?.asset ?? '')),
                                        Text(
                                          snapshot.data?[index].bundleContent?[0].item ?? '',
                                        )
                                      ],
                                    ),
                                  );
                                })),
                          ),
                        )
                      ],
                    )
                  ],
                );
              }
            },
          )),
        ),
      ),
    );
  }
}
