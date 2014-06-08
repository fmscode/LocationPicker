//
//  LocationPicker.m
//  Pods
//
//  Created by Frank Michael on 6/8/14.
//
//

#import "LocationPicker.h"

@interface LocationPicker () <UIPickerViewDataSource,UIPickerViewDelegate> {
    NSArray *locations;
}

@end

@implementation LocationPicker

- (id)initWithDataType:(LocationData)type andDelegate:(id<LocationPickerDelegate>)delegate{
    self = [super init];
    if (self){
        _dataType = type;
        _locationDelegate = delegate;
        [self setupPicker];
    }
    return self;
}

- (void)setupPicker{
    self.delegate = self;
    self.dataSource = self;
    
    NSString *filePath;
    if (_dataType == LocationDataUnitedStates) {
        filePath = [[NSBundle mainBundle] pathForResource:@"states" ofType:@"json"];
    }else{
        filePath = [[NSBundle mainBundle] pathForResource:@"countries" ofType:@"json"];
    }
    locations = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:filePath] options:NSJSONReadingMutableLeaves error:nil];
}
- (void)setDataType:(LocationData)dataType{
    _dataType = dataType;
    [self setupPicker];
    [self reloadAllComponents];
}
#pragma mark - UIPickerDataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return locations.count;
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    NSDictionary *location = locations[row];
    if (_currentStyle == LocationDisplayStyleDefault){
        return location[@"name"];
    }
    return nil;
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if (_locationDelegate && [_locationDelegate respondsToSelector:@selector(locationPicked:)]){
        [_locationDelegate locationPicked:locations[row]];
    }
}

@end
