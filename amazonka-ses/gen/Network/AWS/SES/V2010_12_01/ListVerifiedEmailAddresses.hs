{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE NoImplicitPrelude           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.SES.V2010_12_01.ListVerifiedEmailAddresses
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Returns a list containing all of the email addresses that have been
-- verified. The ListVerifiedEmailAddresses action is deprecated as of the May
-- 15, 2012 release of Domain Verification. The ListIdentities action is now
-- preferred. This action is throttled at one request per second. POST /
-- HTTP/1.1 Date: Thu, 18 Aug 2011 22:05:09 GMT Host:
-- email.us-east-1.amazonaws.com Content-Type:
-- application/x-www-form-urlencoded X-Amzn-Authorization: AWS3
-- AWSAccessKeyId=AKIAIOSFODNN7EXAMPLE,
-- Signature=II0+vvDKGMv71vToBwzR6vZ1hxe/VUE8tWEFUNTUqgE=,
-- Algorithm=HmacSHA256, SignedHeaders=Date;Host Content-Length: 108
-- AWSAccessKeyId=AKIAIOSFODNN7EXAMPLE &Action=ListVerifiedEmailAddresses
-- &Timestamp=2011-08-18T22%3A05%3A09.000Z% example@amazon.com
-- 3dd50e97-c865-11e0-b235-099eb63d928d.
module Network.AWS.SES.V2010_12_01.ListVerifiedEmailAddresses
    (
    -- * Request
      ListVerifiedEmailAddresses
    -- ** Request constructor
    , mkListVerifiedEmailAddresses
    -- * Response
    , ListVerifiedEmailAddressesResponse
    -- ** Response lenses
    , lvearsVerifiedEmailAddresses
    ) where

import Network.AWS.Request.Query
import Network.AWS.SES.V2010_12_01.Types
import Network.AWS.Prelude

data ListVerifiedEmailAddresses = ListVerifiedEmailAddresses
    deriving (Eq, Show, Generic)

-- | Smart constructor for the minimum required parameters to construct
-- a valid 'ListVerifiedEmailAddresses' request.
mkListVerifiedEmailAddresses :: ListVerifiedEmailAddresses
mkListVerifiedEmailAddresses = ListVerifiedEmailAddresses

instance ToQuery ListVerifiedEmailAddresses where
    toQuery = genericQuery def

-- | Represents a list of all the email addresses verified for the current user.
newtype ListVerifiedEmailAddressesResponse = ListVerifiedEmailAddressesResponse
    { _lvearsVerifiedEmailAddresses :: [Text]
    } deriving (Show, Generic)

-- | A list of email addresses that have been verified.
lvearsVerifiedEmailAddresses :: Lens' ListVerifiedEmailAddressesResponse [Text]
lvearsVerifiedEmailAddresses =
    lens _lvearsVerifiedEmailAddresses
         (\s a -> s { _lvearsVerifiedEmailAddresses = a })

instance FromXML ListVerifiedEmailAddressesResponse where
    fromXMLOptions = xmlOptions

instance AWSRequest ListVerifiedEmailAddresses where
    type Sv ListVerifiedEmailAddresses = SES
    type Rs ListVerifiedEmailAddresses = ListVerifiedEmailAddressesResponse

    request = post "ListVerifiedEmailAddresses"
    response _ = xmlResponse
