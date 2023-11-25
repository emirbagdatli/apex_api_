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
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
            child: FutureBuilder(
          future: _apexService.fetchMapRotation(),
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
                  Flex(
                    direction: Axis.vertical,
                    children: [
                      Card(
                        child: Column(
                          children: [
                            Text(snapshot.data?.current?.map ?? ''),
                            Text(snapshot.data?.current?.remainingTimer ?? ''),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              );
            }
          },
        )),
      ),
    );
  }
}
