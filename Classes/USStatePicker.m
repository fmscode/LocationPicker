//
//  USStatePicker.m
//  
//
//  Created by Frank Michael on 4/17/14.
//
//

#import "USStatePicker.h"

@interface USStatePicker () <UIPickerViewDataSource,UIPickerViewDelegate>{
    NSArray *states;
}

@end

@implementation USStatePicker

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self){
        [self setupPicker];
    }
    return self;
}
- (id)init{
    self = [super init];
    if (self){
        [self setupPicker];
    }
    return self;
}
- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupPicker];
    }
    return self;
}
- (void)setupPicker{
    self.delegate = self;
    self.dataSource = self;
    NSString *statesFile = [[NSBundle mainBundle] pathForResource:@"states" ofType:@"plist"];
    states = [NSArray arrayWithContentsOfFile:statesFile];
    _currentStyle = StateStyleDefault;
}
- (void)setCurrentStyle:(StateStyle)currentStyle{
    _currentStyle = currentStyle;
    [self reloadAllComponents];
}
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return states.count;
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    NSString *stateText;
    NSDictionary *state = states[row];
    
    switch (_currentStyle) {
        case StateStyleShort:
            stateText = state[@"short"];
            break;
        case StateStyleLong:
            stateText = [NSString stringWithFormat:@"%@-%@",state[@"name"],state[@"short"]];
            break;
        default:
            stateText = state[@"name"];
            break;
    }
    
    return stateText;
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if (_stateDelegate && [_stateDelegate respondsToSelector:@selector(statePicked:)]){
        [_stateDelegate statePicked:states[row]];
    }
}

@end
