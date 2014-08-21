///:
/*****************************************************************************
 **                                                                         **
 **                               .======.                                  **
 **                               | INRI |                                  **
 **                               |      |                                  **
 **                               |      |                                  **
 **                      .========'      '========.                         **
 **                      |   _      xxxx      _   |                         **
 **                      |  /_;-.__ / _\  _.-;_\  |                         **
 **                      |     `-._`'`_/'`.-'     |                         **
 **                      '========.`\   /`========'                         **
 **                               | |  / |                                  **
 **                               |/-.(  |                                  **
 **                               |\_._\ |                                  **
 **                               | \ \`;|                                  **
 **                               |  > |/|                                  **
 **                               | / // |                                  **
 **                               | |//  |                                  **
 **                               | \(\  |                                  **
 **                               |  ``  |                                  **
 **                               |      |                                  **
 **                               |      |                                  **
 **                               |      |                                  **
 **                               |      |                                  **
 **                   \\    _  _\\| \//  |//_   _ \// _                     **
 **                  ^ `^`^ ^`` `^ ^` ``^^`  `^^` `^ `^                     **
 **                                                                         **
 **                       Copyright (c) 2014 Tong G.                        **
 **                          ALL RIGHTS RESERVED.                           **
 **                                                                         **
 ****************************************************************************/

#import "OMFMainPanelController.h"
#import "OMFStatusItemView.h"
#import "OMFPanelBackgroundView.h"

// OMFMainPanelController class
@implementation OMFMainPanelController

@synthesize delegate = _delegate;
@synthesize backgrondView = _backgroundView;

#pragma mark Initializers & Deallocators
+ ( id ) mainPanelControllerWithDelegate: ( id <OMFMainPanelControllerDelegate> )_Delegate
    {
    return [ [ [ [ self class ] alloc ] initWithDelegate: _Delegate ] autorelease ];
    }

- ( id ) initWithDelegate: ( id <OMFMainPanelControllerDelegate> )_Delegate
    {
    if ( self = [ super initWithWindowNibName: @"OMFMainPanel" ] )
        {
        self.delegate = _Delegate;
        }

    return self;
    }

#pragma mark Conforms <NSAwakeFromNib> protocol
- ( void ) awakeFromNib
    {
    [ self.window setOpaque: NO ];
    [ self.window setBackgroundColor: [ NSColor clearColor ] ];
    [ self.window setLevel: NSPopUpMenuWindowLevel ];

    [ self.backgrondView setArrowX: NSWidth( [ self.window frame ] ) / 2 ];
    }

#pragma mark Panel Handling
- ( void ) openPanel
    {
    NSRect frameOfStatusItemView = [ [ self.delegate statusItemViewForPanelController: self ] globalRect ];

    NSRect frame = [ self.window frame ];
    NSPoint origin = NSMakePoint( NSMidX( frameOfStatusItemView ) - NSWidth( frame ) / 2
                                , NSMinY( frameOfStatusItemView ) - NSHeight( frame )
                                );
    frame.origin = origin;
    [ self.window setFrame: frame display: YES ];

    [ self.window makeKeyAndOrderFront: self ];
    [ NSApp activateIgnoringOtherApps: YES ];
    }

- ( void ) closePanel
    {
    [ self.window orderOut: self ];
    }

#pragma mark Conforms <NSWindowDelegate> protocol
- ( void ) windowDidResize: ( NSNotification* )_Notif
    {
    [ self.backgrondView setArrowX: NSWidth( [ self.window frame ] ) / 2 ];
    }

- ( void ) windowDidResignKey: ( NSNotification* )_Notif
    {
    [ [ self.delegate statusItemViewForPanelController: self ] setHighlighting: NO ];

    [ self closePanel ];
    }

@end // OMFMainPanelController

/////////////////////////////////////////////////////////////////////////////

/****************************************************************************
 **                                                                        **
 **      _________                                      _______            **
 **     |___   ___|                                   / ______ \           **
 **         | |     _______   _______   _______      | /      |_|          **
 **         | |    ||     || ||     || ||     ||     | |    _ __           **
 **         | |    ||     || ||     || ||     ||     | |   |__  \          **
 **         | |    ||     || ||     || ||     ||     | \_ _ __| |  _       **
 **         |_|    ||_____|| ||     || ||_____||      \________/  |_|      **
 **                                           ||                           **
 **                                    ||_____||                           **
 **                                                                        **
 ***************************************************************************/
///:~