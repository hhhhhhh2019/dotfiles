{ 
  flake.nixosModules.bluetooth = {
    hardware.bluetooth = {
      enable = true;
      settings = {
        General = {
          Experimental = true;
          FastConnectable = true;
        };
      };
    };
  };
}
