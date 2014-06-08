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

- (id)initWithStyle:(LocationStyle)style andDelegate:(id<LocationPickerDelegate>)delegate{
    self = [super init];
    if (self){
        _currentStyle = style;
        _locationDelegate = delegate;
    }
    return self;
}
- (void)setupPicker{
    self.delegate = self;
    self.dataSource = self;
    if (_currentStyle == LocationStyleUnitedStates) {
        NSString *statesFile = [[NSBundle mainBundle] pathForResource:@"states" ofType:@"plist"];
        locations = [NSArray arrayWithContentsOfFile:statesFile];
    }else{
        NSString *countriesFile = [[NSBundle mainBundle] pathForResource:@"countries" ofType:@"plist"];
        locations = [NSArray arrayWithContentsOfFile:countriesFile];
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
