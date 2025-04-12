import 'package:payapp/data/api/api_checker.dart';
import 'package:payapp/data/model/response/notification_model.dart';
import 'package:payapp/data/repository/notification_repo.dart';
import 'package:payapp/helper/date_converter.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController implements GetxService {
  final NotificationRepo notificationRepo;
  NotificationController({required this.notificationRepo});

  List<NotificationModel>? _notificationList;
  bool _hasNotification = false;
  List<NotificationModel>? get notificationList => _notificationList;
  bool get hasNotification => _hasNotification;

  Future<int> getNotificationList(bool reload) async {
    _notificationList ??= [];

    if (reload || _notificationList!.isEmpty) {
      Response response = await notificationRepo.getNotificationList();
      if (response.statusCode == 200) {
        // Clear the list and add new notifications
        _notificationList!.clear();
        response.body.forEach((notification) {
          _notificationList!.add(NotificationModel.fromJson(notification));
        });

        // Sort by updated time
        _notificationList!.sort((a, b) {
          return DateConverter.isoStringToLocalDate(a.updatedAt!)
              .compareTo(DateConverter.isoStringToLocalDate(b.updatedAt!));
        });

        // Reverse the list to have the latest notifications first
        _notificationList = _notificationList!.reversed.toList();

        // Check if there are any unseen notifications
        _hasNotification =
            _notificationList!.length != getSeenNotificationCount();
      } else {
        // Handle API errors
        ApiChecker.checkApi(response);
      }
      update();
    }

    return _notificationList!.length;
  }

  void saveSeenNotificationCount(int count) {
    notificationRepo.saveSeenNotificationCount(count);
  }

  int? getSeenNotificationCount() {
    return notificationRepo.getSeenNotificationCount();
  }

  void clearNotification() {
    _notificationList = null;
  }
}
