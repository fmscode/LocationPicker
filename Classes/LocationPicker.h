//
//  LocationPicker.h
//  Pods
//
//  Created by Frank Michael on 6/8/14.
//
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, LocationData) {
    LocationDataUnitedStates = 0,   // Show all the states in the US.
    LocationDataCountries           // Show all countries.
};

typedef NS_ENUM(NSInteger, LocationDisplayStyle){
    LocationDisplayStyleDefault = 0,
    LocationDisplayStyleUSPriority
};

@protocol LocationPickerDelegate;

@interface LocationPicker : UIPickerView

- (id)initWithDataType:(LocationData)type andDelegate:(id<LocationPickerDelegate>)delegate;

@property (nonatomic) LocationDisplayStyle currentStyle;
@property (nonatomic) LocationData dataType;
@property (nonatomic,assign) id <LocationPickerDelegate> locationDelegate;

@end

@protocol LocationPickerDelegate <NSObject>

- (void)locationPicker:(LocationPicker *)picker didPickLocation:(NSDictionary *)location;

@end
