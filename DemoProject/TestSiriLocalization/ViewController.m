//
//  ViewController.m
//  TestSiriLocalization
//
//  Created by Bin Zhang on 29/12/20.
//

#ifndef let
#define let __auto_type const
#endif

#ifndef var
#define var __auto_type
#endif

#import "ViewController.h"
#import "IntentIntent.h"

@import IntentsUI;

@interface ViewController () <INUIAddVoiceShortcutButtonDelegate, INUIAddVoiceShortcutViewControllerDelegate, INUIEditVoiceShortcutViewControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    let siriButton = [[INUIAddVoiceShortcutButton alloc] initWithStyle:INUIAddVoiceShortcutButtonStyleAutomatic];
    siriButton.delegate = self;
    siriButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:siriButton];
    [siriButton.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
    [siriButton.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor].active = YES;
    [siriButton.widthAnchor constraintEqualToAnchor:self.view.widthAnchor constant:-40].active = YES;
    [siriButton.heightAnchor constraintEqualToConstant:44].active = YES;
    let intent = [[IntentIntent alloc] init];
    siriButton.shortcut = [[INShortcut alloc] initWithIntent:intent];
}

- (void)presentAddVoiceShortcutViewController:(INUIAddVoiceShortcutViewController *)addVoiceShortcutViewController forAddVoiceShortcutButton:(INUIAddVoiceShortcutButton *)addVoiceShortcutButton {
    NSLog(@"%s", __FUNCTION__);
    addVoiceShortcutViewController.delegate = self;
    [self presentViewController:addVoiceShortcutViewController animated:YES completion:nil];
}

- (void)presentEditVoiceShortcutViewController:(INUIEditVoiceShortcutViewController *)editVoiceShortcutViewController forAddVoiceShortcutButton:(INUIAddVoiceShortcutButton *)addVoiceShortcutButton {
    NSLog(@"%s", __FUNCTION__);
    editVoiceShortcutViewController.delegate = self;
    [self presentViewController:editVoiceShortcutViewController animated:YES completion:nil];
}

- (void)addVoiceShortcutViewControllerDidCancel:(INUIAddVoiceShortcutViewController *)controller {
    NSLog(@"add voice shortcut cancel");
    [controller dismissViewControllerAnimated:YES completion:nil];
}

- (void)addVoiceShortcutViewController:(INUIAddVoiceShortcutViewController *)controller didFinishWithVoiceShortcut:(INVoiceShortcut *)voiceShortcut error:(NSError *)error {
    NSLog(@"add voice shortcut finish: %@ %@", voiceShortcut, error);
    [controller dismissViewControllerAnimated:YES completion:nil];
}

- (void)editVoiceShortcutViewControllerDidCancel:(INUIEditVoiceShortcutViewController *)controller {
    NSLog(@"edit voice shortcut cancel");
    [controller dismissViewControllerAnimated:YES completion:nil];
}

- (void)editVoiceShortcutViewController:(INUIEditVoiceShortcutViewController *)controller didUpdateVoiceShortcut:(INVoiceShortcut *)voiceShortcut error:(NSError *)error {
    NSLog(@"edit voice shortcut update: %@ %@", voiceShortcut, error);
    [controller dismissViewControllerAnimated:YES completion:nil];
}

- (void)editVoiceShortcutViewController:(INUIEditVoiceShortcutViewController *)controller didDeleteVoiceShortcutWithIdentifier:(NSUUID *)deletedVoiceShortcutIdentifier {
    NSLog(@"edit voice shortcut delete: %@", deletedVoiceShortcutIdentifier);
    [controller dismissViewControllerAnimated:YES completion:nil];
}

@end
