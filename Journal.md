### Phase 1

ThemeData is convenient because I can define the colors and typography for the entire application in one place. This makes the design more consistent and means I do not have to manually set the same styles on every widget.

One complicated part is that ThemeData has many different properties and styles, so it can take some time to understand which one controls each part of the interface.

### Phase 2

When designing breakpoints, I need to consider how much space the interface needs to remain usable. A layout that works well on a desktop may not have enough room on a phone.

MediaQuery can be used to check the width and height of the screen as well as other information about the device. I can use the width to change navigation, spacing, or the number of elements shown depending on the available screen space.
