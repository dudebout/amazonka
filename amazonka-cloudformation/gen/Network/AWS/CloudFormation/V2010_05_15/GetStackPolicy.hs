{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE NoImplicitPrelude           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.CloudFormation.V2010_05_15.GetStackPolicy
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Returns the stack policy for a specified stack. If a stack doesn't have a
-- policy, a null value is returned.
-- https://cloudformation.us-east-1.amazonaws.com/ ?Action=GetStackPolicy
-- &StackName=MyStack &Version=2010-05-15 &SignatureVersion=2
-- &Timestamp=2010-07-27T22%3A26%3A28.000Z &AWSAccessKeyId=[AWS Access KeyID]
-- &Signature=[Signature] "{ "Statement" : [ { "Effect" : "Deny", "Action" :
-- "Update:*", "Principal" : "*", "Resource" :
-- "LogicalResourceId/ProductionDatabase" }, { "Effect" : "Allow", "Action" :
-- "Update:*", "Principal" : "*", "Resource" : "*" } ] }.
module Network.AWS.CloudFormation.V2010_05_15.GetStackPolicy
    (
    -- * Request
      GetStackPolicy
    -- ** Request constructor
    , mkGetStackPolicy
    -- ** Request lenses
    , gspStackName

    -- * Response
    , GetStackPolicyResponse
    -- ** Response lenses
    , gsprsStackPolicyBody
    ) where

import Network.AWS.Request.Query
import Network.AWS.CloudFormation.V2010_05_15.Types
import Network.AWS.Prelude

-- | The input for the GetStackPolicy action.
newtype GetStackPolicy = GetStackPolicy
    { _gspStackName :: Text
    } deriving (Show, Generic)

-- | Smart constructor for the minimum required parameters to construct
-- a valid 'GetStackPolicy' request.
mkGetStackPolicy :: Text -- ^ 'gspStackName'
                 -> GetStackPolicy
mkGetStackPolicy p1 = GetStackPolicy
    { _gspStackName = p1
    }

-- | The name or stack ID that is associated with the stack whose policy you
-- want to get.
gspStackName :: Lens' GetStackPolicy Text
gspStackName = lens _gspStackName (\s a -> s { _gspStackName = a })

instance ToQuery GetStackPolicy where
    toQuery = genericQuery def

-- | The output for the GetStackPolicy action.
newtype GetStackPolicyResponse = GetStackPolicyResponse
    { _gsprsStackPolicyBody :: Maybe Text
    } deriving (Show, Generic)

-- | Structure containing the stack policy body. (For more information, go to
-- Prevent Updates to Stack Resources in the AWS CloudFormation User Guide.).
gsprsStackPolicyBody :: Lens' GetStackPolicyResponse (Maybe Text)
gsprsStackPolicyBody =
    lens _gsprsStackPolicyBody (\s a -> s { _gsprsStackPolicyBody = a })

instance FromXML GetStackPolicyResponse where
    fromXMLOptions = xmlOptions

instance AWSRequest GetStackPolicy where
    type Sv GetStackPolicy = CloudFormation
    type Rs GetStackPolicy = GetStackPolicyResponse

    request = post "GetStackPolicy"
    response _ = xmlResponse
