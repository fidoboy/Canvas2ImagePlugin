//
//	Canvas2ImagePlugin.m
//	Canvas2ImagePlugin PhoneGap/Cordova plugin
//
//	Created by Tommy-Carlos Williams on 29/03/12.
//	Copyright (c) 2012 Tommy-Carlos Williams. All rights reserved.
//	MIT Licensed
//

#import "Canvas2ImagePlugin.h"
#import <Cordova/CDV.h>
#import <Foundation/Foundation.h>

@implementation Canvas2ImagePlugin
@synthesize latestCommand;

//-(CDVPlugin*) initWithWebView:(UIWebView*)theWebView
//{
//	  self = (Canvas2ImagePlugin*)[super initWithWebView:theWebView];
//	  return self;
//}

- (void)saveImageDataToLibrary:(CDVInvokedUrlCommand*)command
{
	self.latestCommand = command;
	NSData* imageData = [NSData dataFromBase64String:[command.arguments objectAtIndex:0]];

	UIImage* image = [[[UIImage alloc] initWithData:imageData] autorelease];
	UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
	// Was there an error?
	if (error != NULL)
	{
		// Show error message...
		NSLog(@"ERROR: %@",error);
		CDVPluginResult* result = [CDVPluginResult resultWithStatus: CDVCommandStatus_ERROR messageAsString:error.description];
		[self.commandDelegate sendPluginResult:result callbackId: self.latestCommand.callbackId];
	}
	else  // No errors
	{
		// Show message image successfully saved
		NSLog(@"IMAGE SAVED!");
		CDVPluginResult* result = [CDVPluginResult resultWithStatus: CDVCommandStatus_OK messageAsString:@"Image saved"];
		[self.commandDelegate sendPluginResult:result callbackId:self.latestCommand.callbackId];
	}
}

// Useless with ARC
//- (void)dealloc
//{
//	[callbackId release];
//	[super dealloc];
//}

@end
