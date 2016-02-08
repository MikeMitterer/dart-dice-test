import 'dart:html' as html;
import "package:dice/dice.dart" as dice;

import 'package:logging/logging.dart';
import 'package:console_log_handler/console_log_handler.dart';

//import 'package:mdl/mdl.dart';

final Logger _logger = new Logger('dice-test');

abstract class Name {
    String get firstName;
}

class NameImpl implements Name {

  @override
  String get firstName => "Mike";
}

class ExampleModule extends dice.Module {
    configure() {
        register(Name).toInstance(new NameImpl());

    }
}

main() async {
    final Logger _logger = new Logger('layout-header-drawer-footer');
    configLogging();

    //registerMdl();

    final dice.Injector injector = new dice.Injector(new ExampleModule());
    final Name name = injector.getInstance(Name);

    _logger.info(name.firstName);

    //await componentFactory().run();
}

void configLogging() {
    hierarchicalLoggingEnabled = false; // set this to true - its part of Logging SDK

    // now control the logging.
    // Turn off all logging first
    Logger.root.level = Level.INFO;
    Logger.root.onRecord.listen(new LogConsoleHandler());
}

