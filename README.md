# libwin
**_This project is still in alpha, many features will be added over time._**

This library allows you to create **GUI** *(Graphical User Interfaces)* for **World of Warcraft** while respecting a **MVC** *(Model View Controller)* design pattern.

Every widget supports **theming**.

### Functionalities
- Basic widgets
- Theming
- Events

### Example : window layout with buttons
```lua
-- Create a window with "Example" as the title
local w = libwin.window:new(UIParent, 300, 200, "Example");
-- Create two buttons
local search = libwin.button:new(layout.f, "search");
local save = libwin.button:new(layout.f, "save");
-- Create an horizontal layout which will manage our widgets
local hlayout = libwin.hlayout:new(w.f);
hlayout:add(search, "search");
hlayout:add(save, "save");
-- Tell the window to use the layout
w:set_layout(hlayout);
```
