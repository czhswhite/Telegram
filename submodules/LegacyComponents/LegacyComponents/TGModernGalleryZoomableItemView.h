#import <LegacyComponents/TGModernGalleryItemView.h>

@class TGModernGalleryZoomableScrollView;

@interface TGModernGalleryZoomableItemView : TGModernGalleryItemView

@property (nonatomic, strong) UIView *containerView;
@property (nonatomic, strong) TGModernGalleryZoomableScrollView *scrollView;

- (CGSize)contentSize;
- (UIView *)contentView;
- (UIView *)transitionContentView;

- (void)reset;

- (void)forceUpdateLayout;

@end
