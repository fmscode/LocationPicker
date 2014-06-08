//
//  LocationPicker.h
//  Pods
//
//  Created by Frank Michael on 6/8/14.
//
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, LocationStyle) {
    LocationStyleUnitedStates = 0,   // Show all the states in the US.
    LocationStyleCountries           // Show all countries.
};

@protocol LocationPickerDelegate;

@interface LocationPicker : UIPickerView

- (id)initWithStyle:(LocationStyle)style andDelegate:(id<LocationPickerDelegate>)delegate;

@property (nonatomic) LocationStyle currentStyle;
@property (nonatomic,assign) id <LocationPickerDelegate> locationDelegate;

@end

@protocol LocationPickerDelegate <NSObject>

- (void)locationPicker:(NSString *)location;

@end
