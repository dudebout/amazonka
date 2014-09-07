{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE NoImplicitPrelude           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.Route53Domains.V2014_05_15.ListDomains
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | This operation returns all the domain names registered with Amazon Route 53
-- for the current AWS account. ListDomains Example POST / HTTP/1.1
-- host:route53domains.us-east-1.amazonaws.com x-amz-date:20140711T205230Z
-- authorization:AWS4-HMAC-SHA256
-- Credential=AKIAIOSFODNN7EXAMPLE/20140711/us-east-1/route53domains/aws4_request,
-- 
-- SignedHeaders=content-length;content-type;host;user-agent;x-amz-date;x-amz-target,
-- Signature=[calculated-signature]
-- x-amz-target:Route53Domains_v20140515.ListDomains
-- user-agent:aws-sdk-java/1.8.3 Linux/2.6.18-164.el5PAE Java_HotSpot (TM
-- )_Server_VM/24.60-b09/1.7.0_60 content-type:application/x-amz-json-1.1
-- content-length:[number of characters in the JSON string] {
-- "Marker":"AxDAClaROQAXasf29GHWAIKPLA=", "MaxItems":20 } HTTP/1.1 200
-- Content-Length:[number of characters in the JSON string] { "Domains":[ {
-- "AutoRenew":false, "DomainName":"example.com", "Expiry":1431203765,
-- "TransferLock":false }, { "AutoRenew":false, "DomainName":"example.net",
-- "Expiry":1431539260, "TransferLock":false }, { "AutoRenew":false,
-- "DomainName":"example.org", "Expiry":1431240024, "TransferLock":false }, {
-- "AutoRenew":false, "DomainName":"example.test", "Expiry":1431539259,
-- "TransferLock":false } ] }.
module Network.AWS.Route53Domains.V2014_05_15.ListDomains
    (
    -- * Request
      ListDomains
    -- ** Request constructor
    , mkListDomains
    -- ** Request lenses
    , ldMarker
    , ldMaxItems

    -- * Response
    , ListDomainsResponse
    -- ** Response lenses
    , ldrsDomains
    , ldrsNextPageMarker
    ) where

import           Network.AWS.Route53Domains.V2014_05_15.Types
import           Network.AWS.Prelude
import           Network.AWS.Request.JSON
import qualified Network.AWS.Types.Map    as Map

-- | The ListDomains request includes the following elements.
data ListDomains = ListDomains
    { _ldMarker :: Maybe Text
    , _ldMaxItems :: Maybe Integer
    } deriving (Show, Generic)

-- | Smart constructor for the minimum required parameters to construct
-- a valid 'ListDomains' request.
mkListDomains :: ListDomains
mkListDomains = ListDomains
    { _ldMarker = Nothing
    , _ldMaxItems = Nothing
    }

-- | For an initial request for a list of domains, omit this element. If the
-- number of domains that are associated with the current AWS account is
-- greater than the value that you specified for MaxItems, you can use Marker
-- to return additional domains. Get the value of NextPageMarker from the
-- previous response, and submit another request that includes the value of
-- NextPageMarker in the Marker element. Type: String Default: None
-- Constraints: The marker must match the value specified in the previous
-- request. Required: No.
ldMarker :: Lens' ListDomains (Maybe Text)
ldMarker = lens _ldMarker (\s a -> s { _ldMarker = a })

-- | Number of domains to be returned. Type: Integer Default: 20 Constraints: A
-- numeral between 1 and 100. Required: No.
ldMaxItems :: Lens' ListDomains (Maybe Integer)
ldMaxItems = lens _ldMaxItems (\s a -> s { _ldMaxItems = a })

instance ToPath ListDomains

instance ToQuery ListDomains

instance ToHeaders ListDomains

instance ToJSON ListDomains

-- | The ListDomains response includes the following elements.
data ListDomainsResponse = ListDomainsResponse
    { _ldrsDomains :: [DomainSummary]
    , _ldrsNextPageMarker :: Maybe Text
    } deriving (Show, Generic)

-- | A summary of domains. Type: Complex type containing a list of domain
-- summaries. Children: AutoRenew, DomainName, Expiry, TransferLock.
ldrsDomains :: Lens' ListDomainsResponse [DomainSummary]
ldrsDomains = lens _ldrsDomains (\s a -> s { _ldrsDomains = a })

-- | If there are more domains than you specified for MaxItems in the request,
-- submit another request and include the value of NextPageMarker in the value
-- of Marker. Type: String Parent: Operations.
ldrsNextPageMarker :: Lens' ListDomainsResponse (Maybe Text)
ldrsNextPageMarker =
    lens _ldrsNextPageMarker (\s a -> s { _ldrsNextPageMarker = a })

instance FromJSON ListDomainsResponse

instance AWSRequest ListDomains where
    type Sv ListDomains = Route53Domains
    type Rs ListDomains = ListDomainsResponse

    request = get
    response _ = jsonResponse
