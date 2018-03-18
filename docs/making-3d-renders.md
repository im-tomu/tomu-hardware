# Making 3D renders

This walks through the steps involved in making a 3D render, and annotating it in an SVG file.

You'll need both KiCad and Inkscape installed. This document assumes some level of familiarity with Inkscape.

## Render the PCB

1. Load `./pcb/tomu.pro` in KiCad.

2. Open `tomu.sch` from within the project.

3. `View` > `3D Viewer`.

Viewport parameters used for export:

- `dx` = 0
- `dy` = 0
- `zoom` = 16.4
- `background colour`: white (#FFFFFF)

Use the fixed top view and bottom view.  Bottom view also requires rotation on the Y axis by 180 degrees.

Export as PNG.  Flatten the image and autocrop.

These should come out as:

- Top: 907x655 px
- Bottom: 891x645 px

Don't worry about resizing them or if they don't match exactly. You just need to get "enough" resolution that it looks nice in Inkscape.

## Import into Inkscape

Parameters used for Inkscape:

- Page size: A4 (landscape) / 297 x 210 mm
- Object size: 100mm wide (fixed aspect ratio)

Import the two images (the top and bottom) into Inkscape, into the same document.

For each image:

1. `Path` > `Trace Bitmap`

2. Select `Multiple Scans` > `Colors`, and tick `Remove background`.  Other options should be left as defaults.

3. Click `OK`.  This will take a couple of seconds to scan the image (the OK button will be disabled while processing), and then you can close the Trace window.

4. The Trace (group) will be placed on top of the Image.  Move them apart, and delete the Image, so you have only the trace.

5. Adjust the size of the trace to be 100mm width (fixed aspect ratio).

Save the document as SVG.  You will now have two vectors that you can use to annotate the PCB in Inkscape.

## Style

The main font used is `Roboto Condensed`.

* Headers: Bold font width
* Other text: Light font width

## PDF

Export as PDF using Inkscape. Include embedded fonts.