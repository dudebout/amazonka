{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE NoImplicitPrelude           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.ELB.V2012_06_01.DisableAvailabilityZonesForLoadBalancer
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Removes the specified EC2 Availability Zones from the set of configured
-- Availability Zones for the load balancer. There must be at least one
-- Availability Zone registered with a load balancer at all times. Once an
-- Availability Zone is removed, all the instances registered with the load
-- balancer that are in the removed Availability Zone go into the OutOfService
-- state. Upon Availability Zone removal, the load balancer attempts to
-- equally balance the traffic among its remaining usable Availability Zones.
-- Trying to remove an Availability Zone that was not associated with the load
-- balancer does nothing. For more information, see Disable an Availability
-- Zone from a Load-Balanced Application in the Elastic Load Balancing
-- Developer Guide.
-- https://elasticloadbalancing.amazonaws.com/?AvailabilityZones.member.1=us-east-1a
-- &LoadBalancerName=MyHTTPSLoadBalancer &Version=2012-06-01
-- &Action=DisableAvailabilityZonesForLoadBalancer &AUTHPARAMS us-east-1b
-- ba6267d5-2566-11e3-9c6d-eb728EXAMPLE.
module Network.AWS.ELB.V2012_06_01.DisableAvailabilityZonesForLoadBalancer
    (
    -- * Request
      DisableAvailabilityZonesForLoadBalancer
    -- ** Request constructor
    , mkDisableAvailabilityZonesForLoadBalancer
    -- ** Request lenses
    , dazflbLoadBalancerName
    , dazflbAvailabilityZones

    -- * Response
    , DisableAvailabilityZonesForLoadBalancerResponse
    -- ** Response lenses
    , dazflbrsAvailabilityZones
    ) where

import Network.AWS.Request.Query
import Network.AWS.ELB.V2012_06_01.Types
import Network.AWS.Prelude

-- | The input for the DisableAvailabilityZonesForLoadBalancer action.
data DisableAvailabilityZonesForLoadBalancer = DisableAvailabilityZonesForLoadBalancer
    { _dazflbLoadBalancerName :: Text
    , _dazflbAvailabilityZones :: [Text]
    } deriving (Show, Generic)

-- | Smart constructor for the minimum required parameters to construct
-- a valid 'DisableAvailabilityZonesForLoadBalancer' request.
mkDisableAvailabilityZonesForLoadBalancer :: Text -- ^ 'dazflbLoadBalancerName'
                                          -> [Text] -- ^ 'dazflbAvailabilityZones'
                                          -> DisableAvailabilityZonesForLoadBalancer
mkDisableAvailabilityZonesForLoadBalancer p1 p2 = DisableAvailabilityZonesForLoadBalancer
    { _dazflbLoadBalancerName = p1
    , _dazflbAvailabilityZones = p2
    }

-- | The name associated with the load balancer.
dazflbLoadBalancerName :: Lens' DisableAvailabilityZonesForLoadBalancer Text
dazflbLoadBalancerName =
    lens _dazflbLoadBalancerName (\s a -> s { _dazflbLoadBalancerName = a })

-- | A list of Availability Zones to be removed from the load balancer. There
-- must be at least one Availability Zone registered with a load balancer at
-- all times. Specified Availability Zones must be in the same region.
dazflbAvailabilityZones :: Lens' DisableAvailabilityZonesForLoadBalancer [Text]
dazflbAvailabilityZones =
    lens _dazflbAvailabilityZones
         (\s a -> s { _dazflbAvailabilityZones = a })

instance ToQuery DisableAvailabilityZonesForLoadBalancer where
    toQuery = genericQuery def

-- | The output for the DisableAvailabilityZonesForLoadBalancer action.
newtype DisableAvailabilityZonesForLoadBalancerResponse = DisableAvailabilityZonesForLoadBalancerResponse
    { _dazflbrsAvailabilityZones :: [Text]
    } deriving (Show, Generic)

-- | A list of updated Availability Zones for the load balancer.
dazflbrsAvailabilityZones :: Lens' DisableAvailabilityZonesForLoadBalancerResponse [Text]
dazflbrsAvailabilityZones =
    lens _dazflbrsAvailabilityZones
         (\s a -> s { _dazflbrsAvailabilityZones = a })

instance FromXML DisableAvailabilityZonesForLoadBalancerResponse where
    fromXMLOptions = xmlOptions

instance AWSRequest DisableAvailabilityZonesForLoadBalancer where
    type Sv DisableAvailabilityZonesForLoadBalancer = ELB
    type Rs DisableAvailabilityZonesForLoadBalancer = DisableAvailabilityZonesForLoadBalancerResponse

    request = post "DisableAvailabilityZonesForLoadBalancer"
    response _ = xmlResponse
