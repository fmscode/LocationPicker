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
- (void)setCurrentStyle:(LocationDisplayStyle)currentStyle{
    _currentStyle = currentStyle;
    if (_currentStyle == LocationDisplayStyleUSPriority){
        if (_dataType == LocationDataCountries){
            NSPredicate *pred = [NSPredicate predicateWithFormat:@"cca2 = 'US'"];
            NSArray *found = [locations filteredArrayUsingPredicate:pred];
            
            NSInteger index = [locations indexOfObject:found.lastObject];
            
            NSMutableArray *locationsMutable = [[NSMutableArray alloc] initWithArray:locations];
            [locationsMutable insertObject:found.lastObject atIndex:0];
            [locationsMutable removeObjectAtIndex:index+1];
            locations = nil;
            locations = [NSArray arrayWithArray:locationsMutable];
        }
    }
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

    return location[@"name"];
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if (_locationDelegate && [_locationDelegate respondsToSelector:@selector(locationPicker:didPickLocation:)]){
        [_locationDelegate locationPicker:self didPickLocation:locations[row]];
    }
}

@end
