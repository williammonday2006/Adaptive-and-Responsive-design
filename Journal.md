### Phase 1

ThemeData is convenient because I can define the colors and typography for the entire application in one place. This makes the design more consistent and means I do not have to manually set the same styles on every widget.

One complicated part is that ThemeData has many different properties and styles, so it can take some time to understand which one controls each part of the interface.

### Phase 2

When designing breakpoints, I need to consider how much space the interface needs to remain usable. A layout that works well on a desktop may not have enough room on a phone.

MediaQuery can be used to check the width and height of the screen as well as other information about the device. I can use the width to change navigation, spacing, or the number of elements shown depending on the available screen space.

### Phase 3

We use LayoutBuilder here because we want to know how much space the specific content area has available. MediaQuery measures the overall window, but the DealDashboard might only occupy part of that window.

LayoutBuilder lets the dashboard switch between a one-column list and a two-column grid based on its actual available width.

### Phase 4

I would prefer using ThemeData and local Theme overrides for specialized widgets because it keeps the design organized and makes it easier to maintain a consistent visual style.

Hard-coding values directly in widgets can be simpler for a small component, but it can become difficult to update when the application has many widgets using the same styles. Using themes makes those styles easier to change and reuse.
