{ pkgs, ... }:
{
  home-manager.users.user = {
    home.packages = with pkgs; [ openboard rnote ];
  };

  nixpkgs.config.permittedInsecurePackages = [
    "qtwebkit-5.212.0-alpha4"
  ];

  home-manager.users.user.dconf.settings = {
    "com/github/flxzt/rnote" = {
      # TODO: move to another file
      engine-config = ''{"document":{"background":{"color":{"a":1.0,"b":1.0,"g":1.0,"r":1.0},"pattern":"dots","pattern_color":{"a":1.0,"b":1.0,"g":0.9,"r":0.8},"pattern_size":[32.0,32.0]},"format":{"border_color":{"a":1.0,"b":0.8549019607843137,"g":0.8666666666666667,"r":0.8705882352941177},"dpi":96.0,"height":1587.0,"orientation":"portrait","show_borders":false,"width":1123.0},"height":7118.0,"layout":"infinite","width":5619.0,"x":-2246.0,"y":-3174.0},"penholder":{"brush":{"builder_type":"modeled","marker_options":{"fill_color":null,"pressure_curve":"const","stroke_color":{"a":1.0,"b":0.0,"g":0.0,"r":0.0},"stroke_width":2.5000000000000004},"solid_options":{"fill_color":null,"pressure_curve":"linear","stroke_color":{"a":1.0,"b":0.0,"g":0.0,"r":0.0},"stroke_width":2.0},"style":"marker","textured_options":{"density":5.0,"distribution":"Normal","pressure_curve":"linear","radii":[2.0,0.3],"seed":12384423602656167181,"stroke_color":{"a":1.0,"b":0.0,"g":0.0,"r":0.0},"stroke_width":2.0}},"eraser":{"style":"split_colliding_strokes","width":48.0},"pen_mode_state":{"pen_mode":"pen","penmode_eraser_style":"eraser","penmode_pen_style":"brush"},"selector":{"resize_lock_aspectratio":false,"style":"rectangle"},"shaper":{"builder_type":"line","constraints":{"enabled":false,"ratios":[]},"rough_options":{"bowing":1.0,"curve_fitting":0.95,"curve_stepcount":12.0,"curve_tightness":0.0,"dash_gap":-1.0,"dash_offset":-1.0,"disable_multistroke":false,"disable_multistroke_fill":false,"fill_color":{"a":1.0,"b":0.0,"g":0.0,"r":0.0},"fill_line_dash":[],"fill_line_dash_offset":0.0,"fill_style":"Hachure","fill_weight":-1.0,"fixed_decimal_place_digits":0.0,"hachure_angle":-41.0,"hachure_gap":-1.0,"max_randomness_offset":2.0,"preserve_vertices":false,"roughness":1.0,"seed":6722379074851566265,"simplification":0.0,"stroke_color":{"a":1.0,"b":0.0,"g":0.0,"r":0.0},"stroke_line_dash":[],"stroke_line_dash_offset":0.0,"stroke_width":2.0,"zigzag_offset":-1.0},"smooth_options":{"fill_color":{"a":0.0,"b":0.0,"g":0.0,"r":0.0},"pressure_curve":"linear","stroke_color":{"a":1.0,"b":0.0,"g":0.0,"r":0.0},"stroke_width":3.000000000000001},"style":"smooth"},"shortcuts":{"mouse_secondary_button":{"change_pen_style":{"permanent":false,"style":"shaper"}},"stylus_primary_button":{"change_pen_style":{"permanent":false,"style":"selector"}},"stylus_secondary_button":{"change_pen_style":{"permanent":false,"style":"selector"}}},"tools":{"dragproximity_tool":{"radius":60.0},"offsetcamera_tool":{},"style":"verticalspace","verticalspace_tool":{}},"typewriter":{"max_width_enabled":true,"text_style":{"alignment":"start","color":{"a":1.0,"b":0.0,"g":0.0,"r":0.0},"font_family":"serif","font_size":32.0,"font_style":"regular","font_weight":500,"max_width":null,"ranged_text_attributes":[]},"text_width":600.0}},"pdf_import_prefs":{"page_spacing":"continuous","page_width_perc":50.0,"pages_type":"vector"},"pen_sounds":false}'';
    };
  };
}
