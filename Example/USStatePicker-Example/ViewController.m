//
//  ViewController.m
//  USStatePicker-Example
//
//  Created by Frank Michael on 4/17/14.
//  Copyright (c) 2014 Frank Michael Sanchez. All rights reserved.
//

#import "ViewController.h"
#import <USStatePicker.h>

@interface ViewController () <StatePickerDelegate> {
    USStatePicker *statePicker;
}
@property (nonatomic) IBOutlet UITextField *stateField;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    statePicker = [[USStatePicker alloc] initWithStyle:StateStyleLong andDelegate:self];
    _stateField.inputView = statePicker;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - StatePicker Delegate
- (void)statePicked:(NSDictionary *)state{
    NSLog(@"%@",state);
    _stateField.text = state[@"name"];
}
@end
