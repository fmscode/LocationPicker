//
//  ViewController.m
//  LocationPicker
//
//  Created by Frank Michael on 6/8/14.
//  Copyright (c) 2014 Frank Michael Sanchez. All rights reserved.
//

#import "ViewController.h"
#import <LocationPicker.h>

@interface ViewController () <LocationPickerDelegate>{
    LocationPicker *statePicker;
    LocationPicker *countryPicker;
}

@property (nonatomic) IBOutlet UITextField *stateField;
@property (nonatomic) IBOutlet UITextField *countryField;

@end

@implementation ViewController

- (void)viewDidLoad{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    statePicker = [[LocationPicker alloc] initWithDataType:LocationDataUnitedStates andDelegate:self];
    countryPicker = [[LocationPicker alloc] initWithDataType:LocationDataCountries andDelegate:self];
    [_stateField setInputView:statePicker];
    [_countryField setInputView:countryPicker];
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)locationPicker:(LocationPicker *)picker didPickLocation:(NSDictionary *)location{
    if (picker == statePicker){
        _stateField.text = location[@"name"];
    }else{
        _countryField.text = location[@"name"];
    }
}
@end
