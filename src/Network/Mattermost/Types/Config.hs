{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE OverloadedStrings #-}

module Network.Mattermost.Types.Config where

import qualified Data.Aeson as A
import           Data.Text (Text)
import qualified Data.Text as T

data ServerConfig = ServerConfig
  {
  -- { configSqlsettings :: UnknownObject
  -- , configPrivacysettings :: PrivacySettings
  -- , configLogsettings :: LogSettings
  -- , configCompliancesettings :: ComplianceSettings
    configEmailsettings :: EmailSettings
  -- , configFilesettings :: FileSettings
  -- , configGitlabsettings :: GitLabSettings
  -- , configNativeappsettings :: NativeAppSettings
  -- , configLdapsettings :: LdapSettings
  -- , configServicesettings :: ServiceSettings
  -- , configOffice365settings :: Office365Settings
  -- , configGooglesettings :: GoogleSettings
  -- , configPasswordsettings :: PasswordSettings
  , configTeamsettings :: TeamSettings
  -- , configSamlsettings :: SamlSettings
  -- , configClustersettings :: ClusterSettings
  -- , configRatelimitsettings :: RateLimitSettings
  -- , configLocalizationsettings :: LocalizationSettings
  -- , configSupportsettings :: SupportSettings
  -- , configAnalyticssettings :: Integer
  -- , configMetricssettings :: MetricsSettings
  , configWebrtcsettings :: WebrtcSettings
  } deriving (Read, Show, Eq)

instance A.FromJSON ServerConfig where
  parseJSON = A.withObject "config" $ \v -> do
    -- configSqlsettings <- v A..: "SqlSettings"
    -- configPrivacysettings <- v A..: "PrivacySettings"
    -- configLogsettings <- v A..: "LogSettings"
    -- configCompliancesettings <- v A..: "ComplianceSettings"
    configEmailsettings <- v A..: "EmailSettings"
    -- configFilesettings <- v A..: "FileSettings"
    -- configGitlabsettings <- v A..: "GitLabSettings"
    -- configNativeappsettings <- v A..: "NativeAppSettings"
    -- configLdapsettings <- v A..: "LdapSettings"
    -- configServicesettings <- v A..: "ServiceSettings"
    -- configOffice365settings <- v A..: "Office365Settings"
    -- configGooglesettings <- v A..: "GoogleSettings"
    -- configPasswordsettings <- v A..: "PasswordSettings"
    configTeamsettings <- v A..: "TeamSettings"
    -- configSamlsettings <- v A..: "SamlSettings"
    -- configClustersettings <- v A..: "ClusterSettings"
    -- configRatelimitsettings <- v A..: "RateLimitSettings"
    -- configLocalizationsettings <- v A..: "LocalizationSettings"
    -- configSupportsettings <- v A..: "SupportSettings"
    -- configAnalyticssettings <- v A..: "AnalyticsSettings"
    -- configMetricssettings <- v A..: "MetricsSettings"
    configWebrtcsettings <- v A..: "WebrtcSettings"
    return ServerConfig { .. }

instance A.ToJSON ServerConfig where
  toJSON ServerConfig { .. } = A.object
    [ "EmailSettings" A..= configEmailsettings
    , "WebrtcSettings" A..= configWebrtcsettings
    ]
    -- [ "SqlSettings" A..= configSqlsettings
    -- , "PrivacySettings" A..= configPrivacysettings
    -- , "LogSettings" A..= configLogsettings
    -- , "ComplianceSettings" A..= configCompliancesettings
    -- , "EmailSettings" A..= configEmailsettings
    -- , "FileSettings" A..= configFilesettings
    -- , "GitLabSettings" A..= configGitlabsettings
    -- , "NativeAppSettings" A..= configNativeappsettings
    -- , "LdapSettings" A..= configLdapsettings
    -- , "ServiceSettings" A..= configServicesettings
    -- , "Office365Settings" A..= configOffice365settings
    -- , "GoogleSettings" A..= configGooglesettings
    -- , "PasswordSettings" A..= configPasswordsettings
    -- , "TeamSettings" A..= configTeamsettings
    -- , "SamlSettings" A..= configSamlsettings
    -- , "ClusterSettings" A..= configClustersettings
    -- , "RateLimitSettings" A..= configRatelimitsettings
    -- , "LocalizationSettings" A..= configLocalizationsettings
    -- , "SupportSettings" A..= configSupportsettings
    -- , "AnalyticsSettings" A..= configAnalyticssettings
    -- , "MetricsSettings" A..= configMetricssettings
    -- , "WebrtcSettings" A..= configWebrtcsettings
    -- ]

-- --

data EmailSettings = EmailSettings
  { emailSettingsSendemailnotifications :: Bool
  , emailSettingsPasswordresetsalt :: Maybe T.Text
  , emailSettingsEnablesignupwithemail :: Bool
  , emailSettingsSmtpusername ::T.Text
  , emailSettingsEmailbatchinginterval :: Int
  , emailSettingsFeedbackname ::T.Text
  , emailSettingsRequireemailverification :: Bool
  , emailSettingsSmtpserver ::T.Text
  , emailSettingsSmtppassword ::T.Text
  , emailSettingsEnablesigninwithemail :: Bool
  , emailSettingsPushnotificationcontents ::T.Text
  , emailSettingsPushnotificationserver ::T.Text
  , emailSettingsEnableemailbatching :: Bool
  , emailSettingsEmailbatchingbuffersize :: Int
  , emailSettingsConnectionsecurity ::T.Text
  , emailSettingsSmtpport ::T.Text
  , emailSettingsFeedbackemail ::T.Text
  , emailSettingsSendpushnotifications :: Bool
  , emailSettingsFeedbackorganization ::T.Text
  , emailSettingsInvitesalt ::T.Text
  , emailSettingsEnablesigninwithusername :: Bool
  } deriving (Read, Show, Eq)

instance A.FromJSON EmailSettings where
  parseJSON = A.withObject "emailSettings" $ \v -> do
    emailSettingsSendemailnotifications <- v A..: "SendEmailNotifications"
    emailSettingsPasswordresetsalt <- v A..:? "PasswordResetSalt"
    emailSettingsEnablesignupwithemail <- v A..: "EnableSignUpWithEmail"
    emailSettingsSmtpusername <- v A..: "SMTPUsername"
    emailSettingsEmailbatchinginterval <- v A..: "EmailBatchingInterval"
    emailSettingsFeedbackname <- v A..: "FeedbackName"
    emailSettingsRequireemailverification <- v A..: "RequireEmailVerification"
    emailSettingsSmtpserver <- v A..: "SMTPServer"
    emailSettingsSmtppassword <- v A..: "SMTPPassword"
    emailSettingsEnablesigninwithemail <- v A..: "EnableSignInWithEmail"
    emailSettingsPushnotificationcontents <- v A..: "PushNotificationContents"
    emailSettingsPushnotificationserver <- v A..: "PushNotificationServer"
    emailSettingsEnableemailbatching <- v A..: "EnableEmailBatching"
    emailSettingsEmailbatchingbuffersize <- v A..: "EmailBatchingBufferSize"
    emailSettingsConnectionsecurity <- v A..: "ConnectionSecurity"
    emailSettingsSmtpport <- v A..: "SMTPPort"
    emailSettingsFeedbackemail <- v A..: "FeedbackEmail"
    emailSettingsSendpushnotifications <- v A..: "SendPushNotifications"
    emailSettingsFeedbackorganization <- v A..: "FeedbackOrganization"
    emailSettingsInvitesalt <- v A..: "InviteSalt"
    emailSettingsEnablesigninwithusername <- v A..: "EnableSignInWithUsername"
    return EmailSettings { .. }

instance A.ToJSON EmailSettings where
  toJSON EmailSettings { .. } = A.object $
    [ "SendEmailNotifications" A..= emailSettingsSendemailnotifications
    , "EnableSignUpWithEmail" A..= emailSettingsEnablesignupwithemail
    , "SMTPUsername" A..= emailSettingsSmtpusername
    , "EmailBatchingInterval" A..= emailSettingsEmailbatchinginterval
    , "FeedbackName" A..= emailSettingsFeedbackname
    , "RequireEmailVerification" A..= emailSettingsRequireemailverification
    , "SMTPServer" A..= emailSettingsSmtpserver
    , "SMTPPassword" A..= emailSettingsSmtppassword
    , "EnableSignInWithEmail" A..= emailSettingsEnablesigninwithemail
    , "PushNotificationContents" A..= emailSettingsPushnotificationcontents
    , "PushNotificationServer" A..= emailSettingsPushnotificationserver
    , "EnableEmailBatching" A..= emailSettingsEnableemailbatching
    , "EmailBatchingBufferSize" A..= emailSettingsEmailbatchingbuffersize
    , "ConnectionSecurity" A..= emailSettingsConnectionsecurity
    , "SMTPPort" A..= emailSettingsSmtpport
    , "FeedbackEmail" A..= emailSettingsFeedbackemail
    , "SendPushNotifications" A..= emailSettingsSendpushnotifications
    , "FeedbackOrganization" A..= emailSettingsFeedbackorganization
    , "InviteSalt" A..= emailSettingsInvitesalt
    , "EnableSignInWithUsername" A..= emailSettingsEnablesigninwithusername
    ] ++
    [ "PasswordResetSalt" A..= x | Just x <- [emailSettingsPasswordresetsalt] ]

data ClientConfig = ClientConfig
  { clientConfigVersion :: T.Text
  , clientConfigBuildNumber :: T.Text
  , clientConfigBuildDate :: T.Text
  , clientConfigBuildHash :: T.Text
  , clientConfigBuildHashEnterprise :: T.Text
  , clientConfigBuildEnterpriseReady :: T.Text

  , clientConfigSiteURL :: T.Text
  , clientConfigSiteName :: T.Text
  , clientConfigEnableTeamCreation :: T.Text
  , clientConfigEnableUserCreation :: T.Text
  , clientConfigEnableOpenServer :: T.Text
  , clientConfigRestrictDirectMessage :: T.Text
  , clientConfigRestrictTeamInvite :: T.Text
  , clientConfigRestrictPublicChannelCreation :: T.Text
  , clientConfigRestrictPrivateChannelCreation :: T.Text
  , clientConfigRestrictPublicChannelManagement :: T.Text
  , clientConfigRestrictPrivateChannelManagement :: T.Text
  , clientConfigRestrictPublicChannelDeletion :: T.Text
  , clientConfigRestrictPrivateChannelDeletion :: T.Text
  , clientConfigRestrictPrivateChannelManageMembers :: T.Text
  , clientConfigTeammateNameDisplay :: T.Text

  , clientConfigEnableOAuthServiceProvider :: T.Text
  , clientConfigGoogleDeveloperKey :: T.Text
  , clientConfigEnableIncomingWebhooks :: T.Text
  , clientConfigEnableOutgoingWebhooks :: T.Text
  , clientConfigEnableCommands :: T.Text
  , clientConfigEnableOnlyAdminIntegrations :: T.Text
  , clientConfigEnablePostUsernameOverride :: T.Text
  , clientConfigEnablePostIconOverride :: T.Text
  , clientConfigEnableLinkPreviews :: T.Text
  , clientConfigEnableTesting :: T.Text
  , clientConfigEnableDeveloper :: T.Text
  , clientConfigEnableDiagnostics :: T.Text
  , clientConfigRestrictPostDelete :: T.Text
  , clientConfigAllowEditPost :: T.Text
  , clientConfigPostEditTimeLimit :: T.Text

  , clientConfigSendEmailNotifications :: T.Text
  , clientConfigSendPushNotifications :: T.Text
  , clientConfigEnableSignUpWithEmail :: T.Text
  , clientConfigEnableSignInWithEmail :: T.Text
  , clientConfigEnableSignInWithUsername :: T.Text
  , clientConfigRequireEmailVerification :: T.Text
  , clientConfigEnableEmailBatching :: T.Text

  , clientConfigEnableSignUpWithGitLab :: T.Text

  , clientConfigShowEmailAddress :: T.Text

  , clientConfigTermsOfServiceLink :: T.Text
  , clientConfigPrivacyPolicyLink :: T.Text
  , clientConfigAboutLink :: T.Text
  , clientConfigHelpLink :: T.Text
  , clientConfigReportAProblemLink :: T.Text
  , clientConfigAdministratorsGuideLink :: Maybe T.Text
  , clientConfigTroubleshootingForumLink :: Maybe T.Text
  , clientConfigCommercialSupportLink :: Maybe T.Text
  , clientConfigSupportEmail :: T.Text

  , clientConfigEnableFileAttachments :: T.Text
  , clientConfigEnablePublicLink :: T.Text

  , clientConfigWebsocketPort :: T.Text
  , clientConfigWebsocketSecurePort :: T.Text

  , clientConfigDefaultClientLocale :: T.Text
  , clientConfigAvailableLocales :: T.Text
  , clientConfigSQLDriverName :: T.Text

  , clientConfigEnableCustomEmoji :: T.Text
  , clientConfigEnableEmojiPicker :: T.Text
  , clientConfigRestrictCustomEmojiCreation :: T.Text
  , clientConfigMaxFileSize :: T.Text

  , clientConfigAppDownloadLink :: T.Text
  , clientConfigAndroidAppDownloadLink :: T.Text
  , clientConfigIosAppDownloadLink :: T.Text

  , clientConfigEnableWebrtc :: T.Text

  , clientConfigMaxNotificationsPerChannel :: T.Text
  , clientConfigTimeBetweenUserTypingUpdatesMilliseconds :: T.Text
  , clientConfigEnableUserTypingMessages :: T.Text
  , clientConfigEnableChannelViewedMessages :: T.Text

  , clientConfigDiagnosticId :: T.Text
  , clientConfigDiagnosticsEnabled :: T.Text
  } deriving (Read, Show, Eq)


instance A.FromJSON ClientConfig where
  parseJSON = A.withObject "ClientConfig" $ \o -> do
    clientConfigVersion <- o A..: "Version"
    clientConfigBuildNumber <- o A..: "BuildNumber"
    clientConfigBuildDate <- o A..: "BuildDate"
    clientConfigBuildHash <- o A..: "BuildHash"
    clientConfigBuildHashEnterprise <- o A..: "BuildHashEnterprise"
    clientConfigBuildEnterpriseReady <- o A..: "BuildEnterpriseReady"

    clientConfigSiteURL <- o A..: "SiteURL"
    clientConfigSiteName <- o A..: "SiteName"
    clientConfigEnableTeamCreation <- o A..: "EnableTeamCreation"
    clientConfigEnableUserCreation <- o A..: "EnableUserCreation"
    clientConfigEnableOpenServer <- o A..: "EnableOpenServer"
    clientConfigRestrictDirectMessage <- o A..: "RestrictDirectMessage"
    clientConfigRestrictTeamInvite <- o A..: "RestrictTeamInvite"
    clientConfigRestrictPublicChannelCreation <- o A..: "RestrictPublicChannelCreation"
    clientConfigRestrictPrivateChannelCreation <- o A..: "RestrictPrivateChannelCreation"
    clientConfigRestrictPublicChannelManagement <- o A..: "RestrictPublicChannelManagement"
    clientConfigRestrictPrivateChannelManagement <- o A..: "RestrictPrivateChannelManagement"
    clientConfigRestrictPublicChannelDeletion <- o A..: "RestrictPublicChannelDeletion"
    clientConfigRestrictPrivateChannelDeletion <- o A..: "RestrictPrivateChannelDeletion"
    clientConfigRestrictPrivateChannelManageMembers <- o A..: "RestrictPrivateChannelManageMembers"
    clientConfigTeammateNameDisplay <- o A..: "TeammateNameDisplay"

    clientConfigEnableOAuthServiceProvider <- o A..: "EnableOAuthServiceProvider"
    clientConfigGoogleDeveloperKey <- o A..: "GoogleDeveloperKey"
    clientConfigEnableIncomingWebhooks <- o A..: "EnableIncomingWebhooks"
    clientConfigEnableOutgoingWebhooks <- o A..: "EnableOutgoingWebhooks"
    clientConfigEnableCommands <- o A..: "EnableCommands"
    clientConfigEnableOnlyAdminIntegrations <- o A..: "EnableOnlyAdminIntegrations"
    clientConfigEnablePostUsernameOverride <- o A..: "EnablePostUsernameOverride"
    clientConfigEnablePostIconOverride <- o A..: "EnablePostIconOverride"
    clientConfigEnableLinkPreviews <- o A..: "EnableLinkPreviews"
    clientConfigEnableTesting <- o A..: "EnableTesting"
    clientConfigEnableDeveloper <- o A..: "EnableDeveloper"
    clientConfigEnableDiagnostics <- o A..: "EnableDiagnostics"
    clientConfigRestrictPostDelete <- o A..: "RestrictPostDelete"
    clientConfigAllowEditPost <- o A..: "AllowEditPost"
    clientConfigPostEditTimeLimit <- o A..: "PostEditTimeLimit"

    clientConfigSendEmailNotifications <- o A..: "SendEmailNotifications"
    clientConfigSendPushNotifications <- o A..: "SendPushNotifications"
    clientConfigEnableSignUpWithEmail <- o A..: "EnableSignUpWithEmail"
    clientConfigEnableSignInWithEmail <- o A..: "EnableSignInWithEmail"
    clientConfigEnableSignInWithUsername <- o A..: "EnableSignInWithUsername"
    clientConfigRequireEmailVerification <- o A..: "RequireEmailVerification"
    clientConfigEnableEmailBatching <- o A..: "EnableEmailBatching"

    clientConfigEnableSignUpWithGitLab <- o A..: "EnableSignUpWithGitLab"

    clientConfigShowEmailAddress <- o A..: "ShowEmailAddress"

    clientConfigTermsOfServiceLink <- o A..: "TermsOfServiceLink"
    clientConfigPrivacyPolicyLink <- o A..: "PrivacyPolicyLink"
    clientConfigAboutLink <- o A..: "AboutLink"
    clientConfigHelpLink <- o A..: "HelpLink"
    clientConfigReportAProblemLink <- o A..: "ReportAProblemLink"
    clientConfigAdministratorsGuideLink <- o A..:? "AdministratorsGuideLink"
    clientConfigTroubleshootingForumLink <- o A..:? "TroubleshootingForumLink"
    clientConfigCommercialSupportLink <- o A..:? "CommercialSupportLink"
    clientConfigSupportEmail <- o A..: "SupportEmail"

    clientConfigEnableFileAttachments <- o A..: "EnableFileAttachments"
    clientConfigEnablePublicLink <- o A..: "EnablePublicLink"

    clientConfigWebsocketPort <- o A..: "WebsocketPort"
    clientConfigWebsocketSecurePort <- o A..: "WebsocketSecurePort"

    clientConfigDefaultClientLocale <- o A..: "DefaultClientLocale"
    clientConfigAvailableLocales <- o A..: "AvailableLocales"
    clientConfigSQLDriverName <- o A..: "SQLDriverName"

    clientConfigEnableCustomEmoji <- o A..: "EnableCustomEmoji"
    clientConfigEnableEmojiPicker <- o A..: "EnableEmojiPicker"
    clientConfigRestrictCustomEmojiCreation <- o A..: "RestrictCustomEmojiCreation"
    clientConfigMaxFileSize <- o A..: "MaxFileSize"

    clientConfigAppDownloadLink <- o A..: "AppDownloadLink"
    clientConfigAndroidAppDownloadLink <- o A..: "AndroidAppDownloadLink"
    clientConfigIosAppDownloadLink <- o A..: "IosAppDownloadLink"

    clientConfigEnableWebrtc <- o A..: "EnableWebrtc"

    clientConfigMaxNotificationsPerChannel <- o A..: "MaxNotificationsPerChannel"
    clientConfigTimeBetweenUserTypingUpdatesMilliseconds <- o A..: "TimeBetweenUserTypingUpdatesMilliseconds"
    clientConfigEnableUserTypingMessages <- o A..: "EnableUserTypingMessages"
    clientConfigEnableChannelViewedMessages <- o A..: "EnableChannelViewedMessages"

    clientConfigDiagnosticId <- o A..: "DiagnosticId"
    clientConfigDiagnosticsEnabled <- o A..: "DiagnosticsEnabled"
    return ClientConfig { .. }


data TeamSettings = TeamSettings
  { teamSettingsRestrictpublicchanneldeletion :: Text
  , teamSettingsRestrictcreationtodomains :: Text
  , teamSettingsMaxusersperteam :: Int
  , teamSettingsCustomdescriptiontext :: Text
  , teamSettingsEnableopenserver :: Bool
  , teamSettingsEnableusercreation :: Bool
  , teamSettingsCustombrandtext :: Text
  , teamSettingsRestrictprivatechanneldeletion :: Text
  , teamSettingsMaxchannelsperteam :: Int
  , teamSettingsRestrictteaminvite :: Text
  , teamSettingsEnableteamcreation :: Bool
  , teamSettingsSitename :: Text
  , teamSettingsRestrictpublicchannelmanagement :: Text
  , teamSettingsMaxnotificationsperchannel :: Int
  , teamSettingsRestrictdirectmessage :: Text
  , teamSettingsUserstatusawaytimeout :: Int
  , teamSettingsEnablecustombrand :: Bool
  , teamSettingsRestrictprivatechannelmanagement :: Text
  , teamSettingsRestrictprivatechannelcreation :: Text
  , teamSettingsRestrictpublicchannelcreation :: Text
  } deriving (Read, Show, Eq)

instance A.FromJSON TeamSettings where
  parseJSON = A.withObject "teamSettings" $ \v -> do
    teamSettingsRestrictpublicchanneldeletion <- v A..: "RestrictPublicChannelDeletion"
    teamSettingsRestrictcreationtodomains <- v A..: "RestrictCreationToDomains"
    teamSettingsMaxusersperteam <- v A..: "MaxUsersPerTeam"
    teamSettingsCustomdescriptiontext <- v A..: "CustomDescriptionText"
    teamSettingsEnableopenserver <- v A..: "EnableOpenServer"
    teamSettingsEnableusercreation <- v A..: "EnableUserCreation"
    teamSettingsCustombrandtext <- v A..: "CustomBrandText"
    teamSettingsRestrictprivatechanneldeletion <- v A..: "RestrictPrivateChannelDeletion"
    teamSettingsMaxchannelsperteam <- v A..: "MaxChannelsPerTeam"
    teamSettingsRestrictteaminvite <- v A..: "RestrictTeamInvite"
    teamSettingsEnableteamcreation <- v A..: "EnableTeamCreation"
    teamSettingsSitename <- v A..: "SiteName"
    teamSettingsRestrictpublicchannelmanagement <- v A..: "RestrictPublicChannelManagement"
    teamSettingsMaxnotificationsperchannel <- v A..: "MaxNotificationsPerChannel"
    teamSettingsRestrictdirectmessage <- v A..: "RestrictDirectMessage"
    teamSettingsUserstatusawaytimeout <- v A..: "UserStatusAwayTimeout"
    teamSettingsEnablecustombrand <- v A..: "EnableCustomBrand"
    teamSettingsRestrictprivatechannelmanagement <- v A..: "RestrictPrivateChannelManagement"
    teamSettingsRestrictprivatechannelcreation <- v A..: "RestrictPrivateChannelCreation"
    teamSettingsRestrictpublicchannelcreation <- v A..: "RestrictPublicChannelCreation"
    return TeamSettings { .. }

instance A.ToJSON TeamSettings where
  toJSON TeamSettings { .. } = A.object
    [ "RestrictPublicChannelDeletion" A..= teamSettingsRestrictpublicchanneldeletion
    , "RestrictCreationToDomains" A..= teamSettingsRestrictcreationtodomains
    , "MaxUsersPerTeam" A..= teamSettingsMaxusersperteam
    , "CustomDescriptionText" A..= teamSettingsCustomdescriptiontext
    , "EnableOpenServer" A..= teamSettingsEnableopenserver
    , "EnableUserCreation" A..= teamSettingsEnableusercreation
    , "CustomBrandText" A..= teamSettingsCustombrandtext
    , "RestrictPrivateChannelDeletion" A..= teamSettingsRestrictprivatechanneldeletion
    , "MaxChannelsPerTeam" A..= teamSettingsMaxchannelsperteam
    , "RestrictTeamInvite" A..= teamSettingsRestrictteaminvite
    , "EnableTeamCreation" A..= teamSettingsEnableteamcreation
    , "SiteName" A..= teamSettingsSitename
    , "RestrictPublicChannelManagement" A..= teamSettingsRestrictpublicchannelmanagement
    , "MaxNotificationsPerChannel" A..= teamSettingsMaxnotificationsperchannel
    , "RestrictDirectMessage" A..= teamSettingsRestrictdirectmessage
    , "UserStatusAwayTimeout" A..= teamSettingsUserstatusawaytimeout
    , "EnableCustomBrand" A..= teamSettingsEnablecustombrand
    , "RestrictPrivateChannelManagement" A..= teamSettingsRestrictprivatechannelmanagement
    , "RestrictPrivateChannelCreation" A..= teamSettingsRestrictprivatechannelcreation
    , "RestrictPublicChannelCreation" A..= teamSettingsRestrictpublicchannelcreation
    ]


data WebrtcSettings = WebrtcSettings
  { webrtcSettingsStunuri :: Text
  , webrtcSettingsTurnsharedkey :: Text
  , webrtcSettingsEnable :: Bool
  , webrtcSettingsGatewayadminsecret :: Text
  , webrtcSettingsTurnuri :: Text
  , webrtcSettingsGatewayadminurl :: Text
  , webrtcSettingsTurnusername :: Text
  , webrtcSettingsGatewaywebsocketurl :: Text
  } deriving (Read, Show, Eq)

instance A.FromJSON WebrtcSettings where
  parseJSON = A.withObject "webrtcSettings" $ \v -> do
    webrtcSettingsStunuri <- v A..: "StunURI"
    webrtcSettingsTurnsharedkey <- v A..: "TurnSharedKey"
    webrtcSettingsEnable <- v A..: "Enable"
    webrtcSettingsGatewayadminsecret <- v A..: "GatewayAdminSecret"
    webrtcSettingsTurnuri <- v A..: "TurnURI"
    webrtcSettingsGatewayadminurl <- v A..: "GatewayAdminUrl"
    webrtcSettingsTurnusername <- v A..: "TurnUsername"
    webrtcSettingsGatewaywebsocketurl <- v A..: "GatewayWebsocketUrl"
    return WebrtcSettings { .. }

instance A.ToJSON WebrtcSettings where
  toJSON WebrtcSettings { .. } = A.object
    [ "StunURI" A..= webrtcSettingsStunuri
    , "TurnSharedKey" A..= webrtcSettingsTurnsharedkey
    , "Enable" A..= webrtcSettingsEnable
    , "GatewayAdminSecret" A..= webrtcSettingsGatewayadminsecret
    , "TurnURI" A..= webrtcSettingsTurnuri
    , "GatewayAdminUrl" A..= webrtcSettingsGatewayadminurl
    , "TurnUsername" A..= webrtcSettingsTurnusername
    , "GatewayWebsocketUrl" A..= webrtcSettingsGatewaywebsocketurl
    ]
