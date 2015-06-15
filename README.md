# Open-rdar

About Open rdar
A utility that accepts various forms of `rdar:` URLs and redirects them to [Open Radar](http://openradar.appspot.com). It automatically launches in the background, and quits 10 seconds after the last rdar: request.

Download the app from [Releases](https://github.com/kolpanic/Open-rdar/releases), uncompress the zip archive, and put the app somewhere on your disk (e.g., in /Applications).

### Credits

Inspired by and uses ideas from Dave Dribin's [Radar Forwarder](http://www.dribin.org/dave/software/#radarforwarder). How is it different?

* No need for a .prefPane, since recent iOS Simulators' Mobile Safari don't respond to `rdar:` URLs.
* It uses NSURL to parse URLs (instead of a regex class).
* It's a LSUIElement app, so it has no UI.

### License

Like Radar Forwarder, Open rdar is available under the [MIT License](http://www.opensource.org/licenses/mit-license.php).
