#import <Flipswitch/FSSwitchDataSource.h>
#import <Flipswitch/FSSwitchPanel.h>

@interface ShowLowercaseKeysSwitch : NSObject <FSSwitchDataSource>
@end

extern "C" BOOL _AXSLowercaseKeyboardDisplayEnabled();
extern "C" void _AXSSetLowercaseKeyboardDisplayEnabled(BOOL);

@implementation ShowLowercaseKeysSwitch

- (FSSwitchState)stateForSwitchIdentifier:(NSString *)switchIdentifier
{
	return _AXSLowercaseKeyboardDisplayEnabled() ? FSSwitchStateOn : FSSwitchStateOff;
}

- (void)applyState:(FSSwitchState)newState forSwitchIdentifier:(NSString *)switchIdentifier
{
	if (newState == FSSwitchStateIndeterminate)
		return;
	_AXSSetLowercaseKeyboardDisplayEnabled(newState == FSSwitchStateOn);
}

@end
