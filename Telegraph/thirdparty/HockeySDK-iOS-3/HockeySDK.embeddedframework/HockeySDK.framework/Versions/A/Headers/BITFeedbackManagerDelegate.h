/*
 * This is the source code of Telegram for iOS v. 1.1
 * It is licensed under GNU GPL v. 2 or later.
 * You should have received a copy of the license in this archive (see LICENSE).
 *
 * Copyright Peter Iakovlev, 2013.
 */

//
//  BITFeedbackManagerDelegate.h
//  HockeySDK
//
//  Created by Stephan Diederich on 26.07.13.
//
//

#import <Foundation/Foundation.h>

@class BITFeedbackManager;

/**
 *	Delegate protocol which is notified about changes in the feedbackManager
 *  @TODO 
 *    * move shouldShowUpdateAlert from feedbackManager here
 */
@protocol BITFeedbackManagerDelegate <NSObject>

@optional

/**
 *	can be implemented to know when new feedback from the server arrived
 *
 *	@param	feedbackManager	The feedbackManager which did detect the new messages
 */
- (void) feedbackManagerDidReceiveNewFeedback:(BITFeedbackManager*) feedbackManager;

@end
