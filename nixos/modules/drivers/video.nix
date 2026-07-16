{
  flake.nixosModules.video = { pkgs, config, ... }: {
    environment.systemPackages = with pkgs; [
      gst_all_1.gstreamer
      gst_all_1.gst-plugins-base
      gst_all_1.gst-plugins-good
      gst_all_1.gst-plugins-bad
      gst_all_1.gst-plugins-ugly
      gst_all_1.gst-libav
      gst_all_1.gst-plugins-bad

      ffmpeg-full
    ];

    environment.variables = {
      GST_PLUGIN_PATH = "/run/current-system/sw/lib/gstreamer-1.0/";
    };

    boot.extraModulePackages = with config.boot.kernelPackages; [
      v4l2loopback
    ];
    boot.kernelModules = [ "v4l2loopback" ];
    security.polkit.enable = true;
  };
}
