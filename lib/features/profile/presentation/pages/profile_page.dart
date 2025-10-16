import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socializer/features/auth/domain/entities/app_user.dart';
import 'package:socializer/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:socializer/features/profile/presentation/cubits/profile_cubit.dart';
import 'package:socializer/features/profile/presentation/cubits/profile_state.dart'
    show ProfileLoaded, ProfileLoading, ProfileState;

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key, required this.uid});
  final String uid;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late final authCubit = context.read<AuthCubit>();
  late final profileCubit = context.read<ProfileCubit>();
  late AppUser? currentUser = authCubit.currentUser;
  @override
  void initState() {
    fetchData();
    super.initState();
  }

  void fetchData() async {
    await profileCubit.fetchUserProfile(widget.uid);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        print(state);
        if (state is ProfileLoaded) {
          return Scaffold(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            appBar: AppBar(
              centerTitle: true,
              title: Text(currentUser!.name),
              foregroundColor: Theme.of(context).colorScheme.primary,
            ),

            body: Column(
              children: [
                Center(
                  child: Text(
                    currentUser!.email,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),
          );
        } else if (state is ProfileLoading) {
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        } else {
          return Scaffold(body: Center(child: Text("No Profile found ...")));
        }
      },
    );
  }
}
