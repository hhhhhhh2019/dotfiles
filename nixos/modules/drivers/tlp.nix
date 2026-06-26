{
  flake.nixosModules.tlp = {
    services.power-profiles-daemon.enable = false;

    services.tlp = {
      enable = true;
      pd.enable = true;
      settings = {
        TLP_AUTO_SWITCH = 0;
        TLP_DEFAULT_MODE = "BAL";

        WIFI_PWR_ON_AC = "off";
        WIFI_PWR_ON_BAT = "off";
        WIFI_PWR_ON_SAV = "on";

        RESTORE_DEVICE_STATE_ON_STARTUP = 1;

        PLATFORM_PROFILE_ON_AC = "balanced-performance";
        PLATFORM_PROFILE_ON_BAT = "balanced";
        PLATFORM_PROFILE_ON_SAV = "low-power";

        CPU_DRIVER_OPMODE_ON_AC = "active";
        CPU_DRIVER_OPMODE_ON_BAT = "active";
        CPU_DRIVER_OPMODE_ON_SAV = "active";

        CPU_SCALING_GOVERNOR_ON_AC = "performance";
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
        CPU_SCALING_GOVERNOR_ON_SAV = "powersave";

        CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
        CPU_ENERGY_PERF_POLICY_ON_BAT = "balance_power";
        CPU_ENERGY_PERF_POLICY_ON_SAV = "power";

        RUNTIME_PM_ON_AC = "on";
        RUNTIME_PM_ON_BAT = "auto";
        RUNTIME_PM_ON_SAV = "auto";

        PCIE_ASPM_ON_AC = "default";
        PCIE_ASPM_ON_BAT = "powersave";
        PCIE_ASPM_ON_SAV = "powersupersave";
      };
    };
  };
}
