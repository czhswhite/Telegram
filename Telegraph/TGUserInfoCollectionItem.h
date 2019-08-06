/*
 * This is the source code of Telegram for iOS v. 1.1
 * It is licensed under GNU GPL v. 2 or later.
 * You should have received a copy of the license in this archive (see LICENSE).
 *
 * Copyright Peter Iakovlev, 2013.
 */

#import "TGCollectionItem.h"

#import <LegacyComponents/LegacyComponents.h>

#import <LegacyComponents/ASWatcher.h>

@interface TGUserInfoCollectionItem : TGCollectionItem <ASWatcher>

@property (nonatomic, strong) ASHandle *actionHandle;
@property (nonatomic, strong) ASHandle *interfaceHandle;

@property (nonatomic) bool automaticallyManageUserPresence;
@property (nonatomic) bool useRealName;
@property (nonatomic) bool disableAvatar;
@property (nonatomic) bool disableAvatarPlaceholder;
@property (nonatomic) bool showCall;
@property (nonatomic) CGFloat additinalHeight;
@property (nonatomic) CGSize avatarOffset;
@property (nonatomic) CGSize nameOffset;
@property (nonatomic, strong) NSString *customStatus;
@property (nonatomic) bool multilineName;

- (void)setUser:(TGUser *)user animated:(bool)animated;
- (void)setEditing:(bool)editing animated:(bool)animated;

- (void)setUpdatingFirstName:(NSString *)updatingFirstName updatingLastName:(NSString *)updatingLastName;

- (void)setUpdatingAvatar:(UIImage *)updatingAvatar hasUpdatingAvatar:(bool)hasUpdatingAvatar;
- (void)resetUpdatingAvatar:(NSString *)url;

- (void)setHasUpdatingAvatar:(bool)hasUpdatingAvatar;
- (bool)hasUpdatingAvatar;

- (void)updateTimestamp;

- (void)setAvatarHidden:(bool)hidden animated:(bool)animated;
- (id)visibleAvatarView;
- (id)avatarView;
- (void)makeNameFieldFirstResponder;
- (void)copyUpdatingAvatarToCacheWithUri:(NSString *)uri;
- (NSString *)editingFirstName;
- (NSString *)editingLastName;

@end
