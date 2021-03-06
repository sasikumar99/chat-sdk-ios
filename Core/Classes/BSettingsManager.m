//
//  BSettingsManager.m
//  Pods
//
//  Created by Benjamin Smiley-andrews on 30/03/2016.
//
//

#import "BSettingsManager.h"

#define bMainKey @"chat_sdk"

#define bAnonymousKey @"anonymous"
#define bFacebookKey @"facebook"
#define bFirebaseKey @"firebase"
#define bParseKey @"parse"
#define bSettingsKey @"settings"
#define bTwitterKey @"twitter"
#define bGoogleKey @"google"
#define bBackendlessKey @"backendless"

#define bEnabledKey @"enabled"
#define bPathKey @"path"
#define bStorageKey @"storage_path"
#define bAppIDKey @"app_id"
#define bAppSecret @"app_secret"
#define bAppVersion @"app_version"
#define bRootPathKey @"root_path"
#define bClientKey @"client_key"
#define bApiKey @"api_key"
#define bSecretKey @"secret"
#define bImageMessagesEnabledKey @"image_messages_enabled"
#define bLocationMessagesEnabledKey @"location_messages_enabled"

@implementation BSettingsManager

+(NSDictionary *) settings {
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:bMainKey];
}

+(id) s: (NSArray *) parameters {
    id obj = self.settings;
    for (NSString * p in parameters) {
        if ([obj isKindOfClass:[NSDictionary class]]) {
            obj = obj[p];
        }
        else {
            return Nil;
        }
    }
    return obj;
}

+(NSNumber *) number_s: (NSArray *) parameters {
    id obj = [self s:parameters];
    if ([obj isKindOfClass:[NSNumber class]]) {
        return obj;
    }
    else {
        return @0;
    }
}

+(NSString *) string_s: (NSArray *) parameters {
    id obj = [self s:parameters];
    if ([obj isKindOfClass:[NSString class]]) {
        return obj;
    }
    else {
        return Nil;
    }
}

+(NSString *) twitterApiKey {
    return [self string_s:@[bTwitterKey, bApiKey]];
}

+(NSString *) twitterSecret {
    return [self string_s:@[bTwitterKey, bSecretKey]];
}

+(NSString *) googleApiKey {
    return [self string_s:@[bGoogleKey, bApiKey]];
}

+(NSString *) googleClientKey {
    return [self string_s:@[bGoogleKey, bClientKey]];
}

+(BOOL) anonymousLoginEnabled {
    return [[self number_s:@[bAnonymousKey, bEnabledKey]] boolValue];
}

+(NSString *) facebookAppId {
    return [self string_s:@[bFacebookKey, bAppIDKey]];
}

+(NSString *) firebasePath {
    return [self string_s:@[bFirebaseKey, bPathKey]];
}

+(NSString *) firebaseStoragePath {
    return [self string_s:@[bFirebaseKey, bStorageKey]];
}

+(NSString *) firebaseRootPath {
    return [self string_s:@[bFirebaseKey, bRootPathKey]];
}

+(NSString *) parseAppId {
    return [self string_s:@[bParseKey, bAppIDKey]];
}

+(NSString *) parseClientKey {
    return [self string_s:@[bParseKey, bClientKey]];
}

+(BOOL) imageMessagesEnabled {
    return [[self number_s:@[bSettingsKey, bImageMessagesEnabledKey]] boolValue];
}

+(BOOL) locationMessagesEnabled {
    return [[self number_s:@[bSettingsKey, bLocationMessagesEnabledKey]] boolValue];
}

+(NSString *) backendlessAppId {
    return [self string_s:@[bBackendlessKey, bAppIDKey]];
}

+(NSString *) backendlessSecretKey {
    return [self string_s:@[bBackendlessKey, bAppSecret]];
}

+(NSString *) backendlessVersionKey {
    return [self string_s:@[bBackendlessKey, bAppVersion]];
}


@end
