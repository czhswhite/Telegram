/*
 * This is the source code of Telegram for iOS v. 1.1
 * It is licensed under GNU GPL v. 2 or later.
 * You should have received a copy of the license in this archive (see LICENSE).
 *
 * Copyright Peter Iakovlev, 2013.
 */

#import <Foundation/Foundation.h>

@class TGWallpaperInfo;

@interface TGWallpaperManager : NSObject

+ (instancetype)instance;

- (void)restoreCurrentWallpaper;
- (void)setCurrentWallpaperWithInfo:(TGWallpaperInfo *)wallpaperInfo;
- (void)setCurrentWallpaperWithInfo:(TGWallpaperInfo *)wallpaperInfo temporary:(bool)temporary;

- (UIImage *)currentWallpaperImage;
- (TGWallpaperInfo *)currentWallpaperInfo;
- (TGWallpaperInfo *)savedWallpaperInfo;

- (NSArray *)builtinWallpaperList;

@end
