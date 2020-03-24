// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a de locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'de';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "createQrCodeTitleLabel" : MessageLookupByLibrary.simpleMessage("Erstelle dauerhaften QR-Code"),
    "handshakeListTitleLabel" : MessageLookupByLibrary.simpleMessage("Handshake Liste"),
    "healthLogbookTitleLabel" : MessageLookupByLibrary.simpleMessage("Gesundheitstagebuch"),
    "hello" : MessageLookupByLibrary.simpleMessage("Hallo"),
    "pvhtitel" : MessageLookupByLibrary.simpleMessage("Mein QR-Code"),
    "reportsButtonLabel" : MessageLookupByLibrary.simpleMessage("Lade meinen Test hoch"),
    "reportsTextLabel" : MessageLookupByLibrary.simpleMessage("Wenn du positiv auf Corona getestet wurdest musst du deinen Test fotografieren und hier uploaden. Er wird dann an dein Gesundheitsamt geschickt. Leute mit denen du Kontakt hattest werden dann benachrichtigt und getestet."),
    "reportsTitleLabel" : MessageLookupByLibrary.simpleMessage("Meldungen"),
    "title" : MessageLookupByLibrary.simpleMessage("Hallo Welt"),
    "virtualHandshakeTitleLabel" : MessageLookupByLibrary.simpleMessage("Virtueller Handshake")
  };
}
