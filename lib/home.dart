import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: const Text(
          "Home Page",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Image.network(
              "https://scontent.fsgn2-6.fna.fbcdn.net/v/t39.30808-6/471387617_994026106091669_2417294748834670175_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=127cfc&_nc_ohc=-gx7x3PLmIgQ7kNvgGtx_yX&_nc_oc=Adh8oThLatAwZ6HAuuChiB8cDu0ZKClxMJhLnZQFpRsCHnkbA9m8XY3EpCS8VesgCBM&_nc_pt=1&_nc_zt=23&_nc_ht=scontent.fsgn2-6.fna&_nc_gid=A2P0I5Xe7cN2ZfnAmXtOAx_&oh=00_AYBTMitSM29iMiaOTssjbxnGUIOjySPxyUfhNd5aebcMXg&oe=67C7BD90",
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          Expanded(
            child: Image.asset(
              "assets/images/sanse.jpg",
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
        ],
      ),
    );
  }
}
