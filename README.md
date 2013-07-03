Open-rdar
=========

About Open rdar
A utility that accepts various forms of rdar: URLs and redirects them to the Open Radar web application. It automatically launches in the background, and quits 10 seconds after the last rdar: request.

Download the [pre-built app](https://github.com/kolpanic/Open-rdar/releases/1.0/1101/open.rdar.zip), uncompress the zip archive, and put the app somewhere on your disk (e.g., in /Applications).

Credits
Inspired by and uses ideas from Dave Dribin's [Radar Forwarder](http://www.dribin.org/dave/software/#radarforwarder). How is it different?

* No need for a PrefPane, since the latest Mobile Safari doesn't respond to rdar: URLs any more.
* It uses NSURL to parse URLs (instead of a regex class).
* It's a LSUIElement app, so it has no UI.

Like Radar Forwarder, Open rdar is available under the [MIT License](http://www.opensource.org/licenses/mit-license.php).
