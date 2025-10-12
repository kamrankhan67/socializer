import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socializer/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:socializer/features/home/presentation/components/my_drawer_tile.dart';
import 'package:socializer/features/profile/presentation/pages/profile_page.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        backgroundColor: Theme.of(context).colorScheme.surface,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Icon(
                Icons.person,
                color: Theme.of(context).colorScheme.primary,
                size: 80,
              ),
              SizedBox(height: 50),
              MyDrawerTile(
                title: "H O M E",
                icon: Icons.home,
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              MyDrawerTile(
                title: "P R O F I L E",
                icon: Icons.person,
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfilePage()),
                  );
                },
              ),
              MyDrawerTile(
                title: "S E A R C H ",
                icon: Icons.search,
                onTap: () {},
              ),
              MyDrawerTile(
                title: "S E T T I N G S ",
                icon: Icons.settings,
                onTap: () {},
              ),
              Spacer(),
              MyDrawerTile(
                title: "L O G O U T ",
                icon: Icons.logout,
                onTap: () => context.read<AuthCubit>().logout(),
              ),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
