//
//  Canvas2ImagePlugin.h
//  Canvas2ImagePlugin PhoneGap/Cordova plugin
//
//  Created by Tommy-Carlos Williams on 29/03/12.
//  Copyright (c) 2012 Tommy-Carlos Williams. All rights reserved.
//	MIT Licensed
//


#import <Cordova/CDVPlugin.h> Not needed with steroids (conflicts with other plugins)

@interface Canvas2ImagePlugin : CDVPlugin
{
	NSString* callbackId;
}

@property (strong, nonatomic) CDVInvokedUrlCommand* latestCommand;

- (void)saveImageDataToLibrary:(CDVInvokedUrlCommand*)command;

@end
