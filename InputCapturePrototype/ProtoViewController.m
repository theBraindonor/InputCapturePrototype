//
//  ProtoViewController.m
//  InputCapturePrototype
//  
//  Created by John Hoff on 1/17/2012
//  Copyright (c) 2012 John Hoff <john.hoff@braindonor.net>
//  
//  This file is part of InputCapturePrototype.
//  
//  InputCapturePrototype is free software: you can redistribute it and/or
//  modify it under the terms of the GNU General Public License as published
//  by the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//  
//  InputCapturePrototype is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//  
//  You should have received a copy of the GNU General Public License
//  along with Foobar.  If not, see <http://www.gnu.org/licenses/>.
//  

#import "ProtoViewController.h"

@implementation ProtoViewController

@synthesize textView;
@synthesize rfidLabel;
@synthesize clearButton;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [textView becomeFirstResponder];
    
    rfidBuffer = [[NSMutableArray alloc] init];
    
    NSLog(@"Text Capture View Loaded");
}

- (IBAction)clearButtonPressed:(id)sender
{
    [rfidLabel setText:@"RFID"];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if ([text isEqualToString:@"\n"])
    {
        NSLog(@"Recieved RFID: %@", [rfidBuffer componentsJoinedByString:@""]);
        [rfidLabel setText:[rfidBuffer componentsJoinedByString:@""]];
        [rfidBuffer removeAllObjects];
    }
    else
    {
        [rfidBuffer addObject:text];
    }
    return NO;
}

@end
