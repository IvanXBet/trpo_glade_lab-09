lgi = require 'lgi'

gtk = lgi.Gtk
gtk.init()

bld = gtk.Builder()
bld:add_from_file('Lab_09.glade')

ui = bld.objects
--
local x = 0;
local y = 0;
local button = false;
local scale = 1;
--
function ui.Canvas:on_button_press_event(eve)
  print('press');
  button = true;
  ui.Canvas:queue_draw();
end

function ui.Canvas:on_button_release_event(eve)
  print('release');
  button = false;
  ui.Canvas:queue_draw();
end

function ui.Canvas:on_motion_notify_event(eve)
  print('move');
  x = eve.x;
  y = eve.y;
  ui.Canvas:queue_draw();
end

function ui.Canvas:on_draw(context)
  print('draw');
  if(button) then
    scale = 3;
  else
    scale = 1;
  end
  context:set_source_rgb(ui.Red_Scale:get_value(),
  ui.Green_Scale:get_value(), 
  ui.Blue_Scale:get_value());

  context:rectangle(x, y, 5 * scale, 5 * scale);
  context:fill();
end

function ui.Main_Window:on_destroy(...)
  gtk.main_quit()
  end


ui.Main_Window.title = 'Lab_09'
ui.Main_Window:show_all()

gtk.main()
  
