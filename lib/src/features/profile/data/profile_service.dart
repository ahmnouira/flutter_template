import 'local/local_service.dart';
import 'mock/mock_service.dart';
import 'remote/remote_service.dart';

class ProfileService {
  static final remote = RemoteService();
  static final mock = MockService();
  static final local = LocalService();

  const ProfileService();
}
