import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmsgraduatework/state/user_cubit.dart';

@RoutePage()
class ProjectTabScreen extends StatelessWidget {
  const ProjectTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 20,
      crossAxisSpacing: 20,
      children: BlocProvider.of<UserCubit>(context)
          .state!
          .projects
          .map((e) => _projectCard(url: e))
          .toList(),
    );
  }
}

class _projectCard extends StatelessWidget {
  final url;
  const _projectCard({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.network(
        url,
        fit: BoxFit.cover,
      ),
    );
  }
}
