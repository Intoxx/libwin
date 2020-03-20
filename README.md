# libwin 0.0.1
**_This project is still in alpha, many features will be added over time._**

This library allows you to create **GUI** *(Graphical User Interfaces)* for **World of Warcraft** while respecting a **MVC** *(Model View Controller)* design pattern.

It is a very lightweight library and every widget supports **theming**.

## How does it work
You basically have access to the following :

### Widgets
- Layout *(HORIZONTAL and VERTICAL)*
- Window *(titlebar, minimize, maximize and close buttons)*
- Line *(border, separator ...)*
- Label
- Button

### Events
Every widget has access to **3 different STATES**.
- NORMAL *(default state)*
- HOVER *(when hovering with the mouse)*
- FOCUS *(when selecting the widget through your mouse or keyboard)*

### Theming
Every widget supports theming.

## Example : window layout with buttons
```lua
-- Create a window with "Example" as the title
local w = libwin.window:new(UIParent, 300, 200, "Example");
-- Create an horizontal layout which will manage our widgets
local hlayout = libwin.hlayout:new(w.f);
-- Create two buttons
local search = libwin.button:new(hlayout.f, "search");
local save = libwin.button:new(hlayout.f, "save");
-- Add them to the layout
hlayout:add(search, "search");
hlayout:add(save, "save");
-- Tell the window to use the layout
w:set_layout(hlayout);
```
