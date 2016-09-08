{-# LANGUAGE OverloadedStrings #-}
{-# OPTIONS_GHC -fno-warn-name-shadowing #-}
-- Note: See LocalConfig.hs to configure example for your server
module Main (main) where
import           Text.Show.Pretty ( pPrint )
import qualified Data.HashMap.Strict as HM
import qualified Data.Text as T
import           Network.Connection
import           Data.Foldable
import           Control.Monad ( when, join )

import           Network.Mattermost

import           Config
import           LocalConfig -- You will need to define a function:
                             -- getConfig :: IO Config
                             -- See Config.hs

main :: IO ()
main = do
  config <- getConfig -- see LocalConfig import
  ctx    <- initConnectionContext
  let cd = mkConnectionData (T.unpack (configHostname config))
                            (fromIntegral (configPort config)) ctx

  let login = Login { username = configUsername config
                    , password = configPassword config
                    }

  (token, mmUser) <- join (hoistE <$> mmLogin cd login)
  putStrLn "Authenticated as:"
  pPrint mmUser

  i <- mmGetInitialLoad cd token
  forM_ (initialLoadTeams i) $ \t -> do
    when (teamName t == configTeam config) $ do
      Channels chans cm <- mmGetChannels cd token (teamId t)
      forM_ chans $ \chan -> do
        channel <- mmGetChannel cd token (teamId t) (channelId chan)
        pPrint channel
        pPrint (cm HM.! getId channel)
        putStrLn ""
