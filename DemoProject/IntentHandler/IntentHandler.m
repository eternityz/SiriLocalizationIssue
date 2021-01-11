//
//  IntentHandler.m
//  IntentHandler
//
//  Created by Bin Zhang on 29/12/20.
//

#import "IntentHandler.h"
#import "IntentIntent.h"

@interface IntentHandler () <IntentIntentHandling>

@end

@implementation IntentHandler

- (id)handlerForIntent:(INIntent *)intent {    
    return self;
}

- (void)handleIntent:(IntentIntent *)intent completion:(void (^)(IntentIntentResponse * _Nonnull))completion {
    NSString *text = NSLocalizedString(@"response", nil);
    __auto_type response = [IntentIntentResponse successIntentResponseWithText:text];
    completion(response);
}

@end
