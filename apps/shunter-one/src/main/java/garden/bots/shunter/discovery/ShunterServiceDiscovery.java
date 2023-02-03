package io.smallrye.stork.servicediscovery.shunter;

import io.smallrye.mutiny.Uni;
import io.smallrye.stork.api.ServiceDiscovery;
import io.smallrye.stork.api.ServiceInstance;

import java.util.List;

public class ShunterServiceDiscovery implements ServiceDiscovery {
  public ShunterServiceDiscovery(ShunterServiceDiscoveryProviderConfiguration shunterConfiguration) {

  }

  @Override
  public Uni<List<ServiceInstance>> getServiceInstances() {
    return null;
  }
}
