//
//  Open_rdarAppDelegate.m
//  Open rdar
//
//  Created by Karl Moskowski on 11-08-30.
//  Copyright 2011 Voodoo Ergonomics Inc. All rights reserved.
//

#import "Open_rdarAppDelegate.h"

@implementation Open_rdarAppDelegate

- (void) restartIdleTimer {
	if (self.idleTimer != nil) {
		[self.idleTimer invalidate];
		self.idleTimer = nil;
	}
	self.idleTimer = [NSTimer scheduledTimerWithTimeInterval:10.0 target:self
                                                    selector:@selector(timerFired:) userInfo:nil repeats:NO];
}

- (void) timerFired:(NSTimer *)timer {
    [NSApp terminate:self];
}

- (void) awakeFromNib {
	[self restartIdleTimer];
	[[NSAppleEventManager sharedAppleEventManager] setEventHandler:self andSelector:@selector(getUrl:withReplyEvent:)
                                                     forEventClass:kInternetEventClass andEventID:kAEGetURL];
}

/* Parsing URLs:
 rdar: URLs can have a number of formats. The radar number can be extracted using various NSURL & NSString methods:
    rdar://9999999                              -host
    rdar://problem/9999999 & rdar:///9999999    -lastPathComponent of -path
    rdar:9999999                                -lastPathComponent of -resourceSpecifier

 Strictly speaking, since rdars don't have a host, only the last is correct. The first format implies the radar number is the host. The second implies "problem" is the host. The third implies localhost is the host.
*/
 
- (void) getUrl:(NSAppleEventDescriptor *)event withReplyEvent:(NSAppleEventDescriptor *)replyEvent {
	[self restartIdleTimer];
	NSString *urlString = [[event paramDescriptorForKeyword:keyDirectObject] stringValue];
	NSURL *url = [NSURL URLWithString:urlString];
    
	NSInteger radarNumber = [[url host] integerValue];
	if (radarNumber < 1)
		radarNumber = [[[url path] lastPathComponent] integerValue];
	if (radarNumber < 1)
		radarNumber = [[[url resourceSpecifier] lastPathComponent] integerValue];
    
	if (radarNumber > 0) {
		NSURL *openRadarUrl = [NSURL URLWithString:[NSString stringWithFormat:@"http://openradar.appspot.com/rdar?number=%i", radarNumber]];
		[[NSWorkspace sharedWorkspace] openURL:openRadarUrl];
        
	}
}

@synthesize idleTimer;

@end