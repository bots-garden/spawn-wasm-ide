package io.smallrye.stork.servicediscovery.shunter;

import io.smallrye.stork.api.ServiceDiscovery;
import io.smallrye.stork.api.config.ServiceConfig;
import io.smallrye.stork.api.config.ServiceDiscoveryAttribute;
import io.smallrye.stork.api.config.ServiceDiscoveryType;
import io.smallrye.stork.servicediscovery.shunter.ShunterServiceDiscovery;
import io.smallrye.stork.spi.ServiceDiscoveryProvider;
import io.smallrye.stork.spi.StorkInfrastructure;

@ServiceDiscoveryType("shunter")
@ServiceDiscoveryAttribute(name = "host",
  description = "Host name of the service discovery server.", required = true)
@ServiceDiscoveryAttribute(name = "port",
  description = "Host of the service discovery server.", required = false)

public class ShunterServiceDiscoveryProvider implements ServiceDiscoveryProvider<ShunterServiceDiscoveryProviderConfiguration> {
  @Override
  public ServiceDiscovery createServiceDiscovery(ShunterServiceDiscoveryProviderConfiguration shunterConfiguration, String s, ServiceConfig serviceConfig, StorkInfrastructure storkInfrastructure) {
    return new ShunterServiceDiscovery(shunterConfiguration);
  }
}

