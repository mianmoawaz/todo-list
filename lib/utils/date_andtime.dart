// import 'package:intl/intl.dart';

// class DateTimeUtil {
//   static String formatTime(String dateTimeString) {
//     DateTime? parsedDate;
//     try {
//       String correctedDateTimeString = dateTimeString.replaceFirstMapped(
//         RegExp(r':(\d{3})$'),
//         (match) => '.${match.group(1)}',
//       );

//       parsedDate = DateFormat("yyyy-MM-dd HH:mm:ss.SSS")
//           .parse(correctedDateTimeString);
//     } catch (e) {
//       return 'Invalid Time';
//     }

//     return parsedDate != null
//         ? DateFormat('h:mm a').format(parsedDate)
//         : 'Invalid Time';
//   }

//   static String formatDate(String dateTimeString) {
//     DateTime? parsedDate;
//     try {
//       String correctedDateTimeString = dateTimeString.replaceFirstMapped(
//         RegExp(r':(\d{3})$'),
//         (match) => '.${match.group(1)}',
//       );

//       parsedDate = DateFormat("yyyy-MM-dd HH:mm:ss.SSS")
//           .parse(correctedDateTimeString);
//     } catch (e) {
//       return 'Invalid Date';
//     }

//     return parsedDate != null
//         ? DateFormat('MMMM d, yyyy').format(parsedDate)
//         : 'Invalid Date';
//   }
// }
