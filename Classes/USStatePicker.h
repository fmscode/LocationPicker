//
//  USStatePicker.h
//  
//
//  Created by Frank Michael on 4/17/14.
//
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, StateStyle) {
    StateStyleDefault = 0,      // Just the state name, New York
    StateStyleShort,            // Just the state abbreviation, NY
    StateStyleLong              // Both the name and abbreviation, New York-NY
};

@protocol StatePickerDelegate;

@interface USStatePicker : UIPickerView

- (id)initWithStyle:(StateStyle)style andDelegate:(id)delegate;

@property (nonatomic) id <StatePickerDelegate> stateDelegate;
@property (nonatomic) StateStyle currentStyle;

@end

@protocol StatePickerDelegate <NSObject>

- (void)statePicked:(NSDictionary *)state;

@end