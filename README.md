# libwin
**_This project is still in alpha, many features will be added over time._**

This library allows you to create **GUI** *(Graphical User Interfaces)* for **World of Warcraft** while respecting a **MVC** *(Model View Controller)* design pattern.
Every widget supports **theming**.
Start using now and create your shiny interfaces without any headaches!

### Functionalities
- Basic widgets
- Theming

### Example
```lua
-- Create a window to hold our layout
local w = libwin.window:new(UIParent, 300, 200, "My title");
-- Create an horizontal layout which will manage our widgets
local hlayout = libwin.hlayout:new(w.f);
-- Create two buttons
local search = libwin.button:new(layout.f, "search");
local save = libwin.button:new(layout.f, "save");
-- Add them to the layout
hlayout:add(search, "search");
hlayout:add(save, "save");
-- Set the window layout
w:set_layout(hlayout);
```
