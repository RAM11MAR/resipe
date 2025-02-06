import 'package:recipe_app/core/client.dart';
import 'package:recipe_app/profile/data/models/profile_model.dart';

class ProfileRepository{
  final ApiClient client;
  ProfileRepository({required this.client});

  ProfileModel? profile ;

  Future<ProfileModel?> fetchProfile() async{
    if(profile != null) return profile;
    var rawProfile = await client.fetchProfile();
    profile = ProfileModel.fromJson(rawProfile);
    return profile;
  }
}