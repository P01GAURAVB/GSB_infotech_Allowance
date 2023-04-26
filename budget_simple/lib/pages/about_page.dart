import 'package:budget_simple/database/tables.dart';
import 'package:budget_simple/pages/home_page.dart';
import 'package:budget_simple/struct/databaseGlobal.dart';
import 'package:budget_simple/struct/functions.dart';
import 'package:budget_simple/widgets/plasma_render.dart';
import 'package:budget_simple/widgets/settings_container.dart';
import 'package:budget_simple/widgets/tappable.dart';
import 'package:budget_simple/widgets/text_font.dart';
import 'package:budget_simple/widgets/time_digits.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextFont(text: "Settings"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            kIsWeb
                ? const SizedBox.shrink()
                : ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 550),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Tappable(
                        color: Theme.of(context)
                            .colorScheme
                            .secondaryContainer
                            .withOpacity(0.7),
                        onTap: () {},
                        borderRadius: 15,
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: PlasmaRender(
                                  color: Theme.of(context).brightness ==
                                          Brightness.light
                                      ? Theme.of(context)
                                          .colorScheme
                                          .secondaryContainer
                                      : Theme.of(context)
                                          .colorScheme
                                          .primaryContainer,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 40),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: TextFont(
                                            text: "Support the Developer",
                                            fontSize: 28,
                                            fontWeight: FontWeight.bold,
                                            textAlign: TextAlign.center,
                                            maxLines: 5,
                                          ),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 8),
                                          child: TextFont(
                                            text:
                                                "Buy the developer something off the menu!",
                                            fontSize: 15,
                                            textAlign: TextAlign.center,
                                            maxLines: 5,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 25,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 28.0),
                                          child: Wrap(
                                            spacing: 15,
                                            runSpacing: 10,
                                            alignment: WrapAlignment.center,
                                            children: [
                                              DonationMenuItem(
                                                  onTap: () {},
                                                  imagePath:
                                                      "assets/icons/coffee-cup.png"),
                                              DonationMenuItem(
                                                  onTap: () {},
                                                  imagePath:
                                                      "assets/icons/cupcake.png"),
                                              DonationMenuItem(
                                                  onTap: () {},
                                                  imagePath:
                                                      "assets/icons/salad.png"),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
            kIsWeb ? const SizedBox.shrink() : const Divider(),
            SettingsContainer(
              title: "Donate",
              afterWidget: const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 17,
              ),
              icon: Icons.thumb_up_alt_outlined,
              onTap: () {
                kIsWeb ? openUrl("https://ko-fi.com/dapperappdeveloper") : null;
              },
            ),
            kIsWeb
                ? const SizedBox.shrink()
                : SettingsContainer(
                    title: "Rate",
                    afterWidget: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 17,
                    ),
                    icon: Icons.star_border,
                    onTap: () {},
                  ),
            SettingsContainer(
              title: "'Allowance' is Open Source!",
              afterWidget: const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 17,
              ),
              icon: Icons.code,
              onTap: () {
                openUrl("https://github.com/jameskokoska/Budget-Simple");
              },
            ),
            const Divider(),
            SettingsContainer(
              title: "Change Currency",
              afterWidget: const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 17,
              ),
              icon: Icons.category_outlined,
              onTap: () {
                changeCurrencyIconBottomSheet(context);
              },
            ),
            SettingsContainer(
              title: "Reset Allowance",
              afterWidget: const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 17,
              ),
              icon: Icons.arrow_circle_up_rounded,
              onTap: () {
                addAmountBottomSheet(context);
              },
            ),
            const NotificationSettings(),
            const Divider(),
            const SizedBox(height: 10),
            const AboutInfoBox(
              title: "App Inspired by Alex Dovhyi",
              link: "https://dribbble.com/shots/20474761-Simple-budgeting-app",
            ),
            const AboutInfoBox(
              title: "Icons from FlatIcon by FreePik",
              link: "https://www.flaticon.com/",
            ),
            const AboutInfoBox(
              title: "Flutter",
              link: "https://flutter.dev/",
            ),
            const AboutInfoBox(
              title: "Drift SQL Database",
              link: "https://drift.simonbinder.eu/",
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Tappable(
                  borderRadius: 15,
                  onTap: () {
                    showLicensePage(
                        context: context,
                        applicationVersion:
                            "${"v${packageInfoGlobal.version}+${packageInfoGlobal.buildNumber}"}, db-v$schemaVersionGlobal",
                        applicationLegalese:
                            "THE SOFTWARE IS PROVIDED \"AS IS\", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.");
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: TextFont(
                      textColor: Theme.of(context).colorScheme.tertiary,
                      fontSize: 15,
                      text:
                          "${"v${packageInfoGlobal.version}+${packageInfoGlobal.buildNumber}"}, db-v$schemaVersionGlobal",
                      textAlign: TextAlign.right,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationSettings extends StatefulWidget {
  const NotificationSettings({super.key});

  @override
  State<NotificationSettings> createState() => _NotificationSettingsState();
}

class _NotificationSettingsState extends State<NotificationSettings> {
  bool notificationsEnabled = notifications;
  TimeOfDay timeOfDay = notificationsTime;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        kIsWeb
            ? const SizedBox.shrink()
            : SettingsContainerSwitch(
                title: "Daily Notifications",
                onSwitched: (value) {
                  setState(() {
                    notificationsEnabled = value;
                    notifications = value;
                    sharedPreferences.setBool("notifications", value);
                  });
                },
                initialValue: notificationsEnabled,
                icon: Icons.notifications_outlined,
              ),
        kIsWeb
            ? const SizedBox.shrink()
            : AnimatedSize(
                duration: const Duration(milliseconds: 900),
                curve: Curves.elasticOut,
                child: notificationsEnabled
                    ? SettingsContainer(
                        title: "Daily Notifications",
                        afterWidget: TimeDigits(
                          timeOfDay: timeOfDay,
                        ),
                        icon: Icons.alarm_outlined,
                        onTap: () async {
                          TimeOfDay newTime = await showTimePicker(
                                context: context,
                                initialTime: timeOfDay,
                                initialEntryMode: TimePickerEntryMode.input,
                                helpText: "",
                              ) ??
                              TimeOfDay.now();
                          timeOfDay = newTime;
                          notificationsTime = newTime;
                          sharedPreferences.setString("notificationsTime",
                              "${newTime.hour}:${newTime.minute}");
                          setState(() {});
                        },
                      )
                    : Container(),
              ),
      ],
    );
  }
}

class DonationMenuItem extends StatelessWidget {
  const DonationMenuItem(
      {super.key, required this.onTap, required this.imagePath});
  final String imagePath;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Tappable(
      onTap: onTap,
      color: Theme.of(context).canvasColor.withOpacity(0.6),
      borderRadius: 20,
      child: Padding(
        padding: const EdgeInsets.all(13),
        child: SizedBox(
          width: 60,
          child: Image(
            image: AssetImage(imagePath),
          ),
        ),
      ),
    );
  }
}

class AboutInfoBox extends StatelessWidget {
  const AboutInfoBox({
    Key? key,
    required this.title,
    required this.link,
  }) : super(key: key);

  final String title;
  final String link;

  @override
  Widget build(BuildContext context) {
    const double maxWidth = 450;
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: maxWidth),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 5),
        child: Tappable(
          onTap: () async {
            openUrl(link);
          },
          color:
              Theme.of(context).colorScheme.secondaryContainer.withOpacity(0.5),
          borderRadius: 15,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  child: Column(
                    children: [
                      TextFont(
                        text: title,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        textAlign: TextAlign.center,
                        maxLines: 5,
                      ),
                      const SizedBox(height: 6),
                      TextFont(
                        text: link,
                        fontSize: 13,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}