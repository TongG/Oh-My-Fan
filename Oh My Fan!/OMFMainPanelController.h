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

#import <Cocoa/Cocoa.h>

@class OMFStatusItemView;
@class OMFMainPanelController;
@class OMFDashboardView;

@class OMFPanelBackgroundView;

// OMFMainPanelControllerDelegate protocol
@protocol OMFMainPanelControllerDelegate <NSObject>

@required
- ( OMFStatusItemView* ) statusItemViewForPanelController: ( OMFMainPanelController* )_PanelController;

@end // OMFMainPanelControllerDelegate

// OMFMainPanelController class
@interface OMFMainPanelController : NSWindowController <NSWindowDelegate>
    {
@private
    id <OMFMainPanelControllerDelegate> _delegate;

    OMFPanelBackgroundView* _backgroundView;
    OMFDashboardView*       _dashboardView;
    }

@property ( nonatomic, retain ) id <OMFMainPanelControllerDelegate> delegate;

@property ( nonatomic, assign ) IBOutlet OMFPanelBackgroundView* backgrondView;
    @property ( nonatomic, assign ) IBOutlet OMFDashboardView* dashboardView;
        @property ( nonatomic, assign ) IBOutlet NSPopUpButton* settingPullDownButton;

+ ( id ) mainPanelControllerWithDelegate: ( id <OMFMainPanelControllerDelegate> )_Delegate;
- ( id ) initWithDelegate: ( id <OMFMainPanelControllerDelegate> )_Delegate;

#pragma mark Panel Handling
- ( void ) openPanel;
- ( void ) closePanel;

- ( void ) _fuckPanel: ( BOOL )_IsHighlighting;

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