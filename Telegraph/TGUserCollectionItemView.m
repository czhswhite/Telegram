#import "TGUserCollectionItemView.h"

#import <LegacyComponents/LegacyComponents.h>

#import <LegacyComponents/TGRemoteImageView.h>

#import <LegacyComponents/TGLetteredAvatarView.h>

#import "TGPresentation.h"

@interface TGUserCollectionItemView ()
{
    UILabel *_titleLabel;
    UIImageView *_disclosureIndicator;
    
    TGLetteredAvatarView *_avatarView;
}

@end

@implementation TGUserCollectionItemView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self != nil)
    {
        _avatarView = [[TGLetteredAvatarView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 40.0f, 40.0f)];
        [_avatarView setSingleFontSize:18.0f doubleFontSize:18.0f useBoldFont:true];
        _avatarView.fadeTransition = true;
        [self.editingContentView addSubview:_avatarView];
        
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.backgroundColor = [UIColor clearColor];
        _titleLabel.font = TGSystemFontOfSize(17);
        [self.editingContentView addSubview:_titleLabel];
        
        _disclosureIndicator = [[UIImageView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 8.0f, 14.0f)];
        [self.editingContentView addSubview:_disclosureIndicator];
    }
    return self;
}

- (void)setPresentation:(TGPresentation *)presentation
{
    [super setPresentation:presentation];
    
    _titleLabel.textColor = presentation.pallete.collectionMenuTextColor;
    _disclosureIndicator.image = presentation.images.collectionMenuDisclosureIcon;
}

- (void)setShowAvatar:(bool)showAvatar
{
    _avatarView.hidden = !showAvatar;
    self.separatorInset = showAvatar ? (15.0f + 40.0f + 8.0f) : 15.0f;
}

- (void)setFirstName:(NSString *)firstName lastName:(NSString *)lastName uidForPlaceholderCalculation:(int32_t)uidForPlaceholderCalculation avatarUri:(NSString *)avatarUri
{
    if (firstName.length != 0 && lastName.length != 0)
    {
        _titleLabel.text = [[NSString alloc] initWithFormat:@"%@ %@", firstName, lastName];
    }
    else if (firstName.length != 0)
        _titleLabel.text = firstName;
    else if (lastName.length != 0)
        _titleLabel.text = lastName;
    else
        _titleLabel.text = @"";
    
    UIImage *placeholder = [self.presentation.images avatarPlaceholderWithDiameter:40.0f];    
    if (avatarUri.length == 0)
        [_avatarView loadUserPlaceholderWithSize:CGSizeMake(40.0f, 40.0f) uid:uidForPlaceholderCalculation firstName:firstName lastName:lastName placeholder:placeholder];
    else if (!TGStringCompare([_avatarView currentUrl], avatarUri))
        [_avatarView loadImage:avatarUri filter:@"circle:40x40" placeholder:placeholder];
    
    [self setNeedsLayout];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGRect bounds = self.bounds;
    
    CGFloat leftInset = self.showsDeleteIndicator ? 38.0f : 0.0f;
    leftInset += self.safeAreaInset.left;
    
    if (!_avatarView.hidden)
    {
        _avatarView.frame = CGRectMake(leftInset + 12.0f, CGFloor((bounds.size.height - _avatarView.frame.size.height) / 2.0f), _avatarView.frame.size.width, _avatarView.frame.size.height);
        leftInset += _avatarView.frame.size.width + 10.0f;
    }
    
    _titleLabel.frame = CGRectMake(15.0f + leftInset, CGFloor((bounds.size.height - 26.0f) / 2), bounds.size.width - 15.0f - leftInset - 40.0f, 26.0f);
    
    _disclosureIndicator.alpha = self.showsDeleteIndicator ? 0.0f : 1.0f;
    _disclosureIndicator.frame = CGRectMake(bounds.size.width + (self.showsDeleteIndicator ? 0.0f : (-_disclosureIndicator.frame.size.width - 15.0f)) - self.safeAreaInset.right, CGFloor((bounds.size.height - _disclosureIndicator.frame.size.height) / 2), _disclosureIndicator.frame.size.width, _disclosureIndicator.frame.size.height);
}

#pragma mark -

- (void)deleteAction
{
    id<TGUserCollectionItemViewDelegate> delegate = _delegate;
    if ([delegate respondsToSelector:@selector(userCollectionItemViewRequestedDeleteAction:)])
        [delegate userCollectionItemViewRequestedDeleteAction:self];
}

@end
