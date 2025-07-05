# Number City Searchlights

[Number City](https://talkingmathsinpublic.uk/number-city/) was a big, ridiculous maths project run in 2024 through the [MEGA grant](https://talkingmathsinpublic.uk/mega-grant/). The idea was to demonstrate how the prime factors of numbers are arranged by stacking boxes to represent them. You can get an idea of what it looked like using [their Geogebra applet](https://www.geogebra.org/classic/jga6adzg) although bear in mind the actual project used some _pretty big_ boxes, half a metre to a side.

There are a few other activities on the Number City website — this app came from [Where In Number City](https://www.andrewt.net/where-in-number-city/) — the idea was that we would show an image of some part of the final box arrangement illuminated by a spotlight in an otherwise pitch black space, and ask people if they could figure out exactly where in Number City they were. It's not easy, but it can usually be done (and of course we simply didn't use any images where it can't).

The two sensible ways to do something like that are to work out what images you want and then make just those images in Blender, or to make a little tool in Godot so you can explore more freely. The second one is harder, in principle, but I didn't know any Blender so actually the second one was quite a lot easier.

If you have [Godot](https://godotengine.org/) (it's free) you can clone this repo and load it yourself. Otherwise [you can use the tool in your browser](https://github.andrewt.net/number-city-searchlights/web-export/Number%20City%20Searchlights.html) although this does seem to result in some strange hatching on obliquely-lit surfaces. I don't know why, I'm not a game developer (ok [I guess I kind of am](https://www.andrewt.net/puzzles/cell-tower/) but you know what I mean) but they don't seem to appear when it's running natively, so I haven't fixed it. If you know how to fix it, feel free to send a pull request.

The other thing to note is that, because this was a tool put together for one project, it isn't very polished. There's no UI to speak of and everything is controlled by undocumented keyboard buttons. It is the `vim` of Number City.

To that end, assuming at all times that the camera is pointed at a point (_n_, _p_) where, for example, the box representing the 5 in the prime factorisation of 15 is at (15, 5), the controls are:

| Keyboard | Joypad | Function |
|----------|--------|----------|
| Plus | D-pad up | Increase _n_ |
| Minus | D-pad down | Decrease _n_ |
| \] | D-pad left | Increase _n_ |
| \[ | D-pad right | Decrease _n_ |
| Up arrow | Right thumbstick up | Move the camera up |
| Down arrow | Right thumbstick down | Move the camera down |
| Left arrow | Right thumbstick left | Move the camera left |
| Right arrow | Right thumbstick right | Move the camera right |
| Apostrophe | Right face button | Move the camera up |
| Slash | Bottom face button | Move the camera down |
| Full stop | Right shoulder button | Zoom the camera in |
| Comma | Right trigger | Zoom the camera out |
| Up arrow | Left thumbstick up | Move the spotlight up |
| Down arrow | Left thumbstick down | Move the spotlight down |
| Left arrow | Left thumbstick left | Move the spotlight left |
| Right arrow | Left thumbstick right | Move the spotlight right |
| E | Left shoulder button | Make the light bigger |
| Q | Left trigger | Make the light smaller |
| Shift | Left face button | Hold to illuminate the whole scene |
| R | Top face button | Randomise _n_, _p_ and the camera and light settings |

Also bear in mind that the way Number City was laid out in physical space, large values of _n_ are to the right of small values of _n_ when you stand on the _p_ axis. The game is much easier if you have a look around the examples on [the Number City site](https://talkingmathsinpublic.uk/number-city/) before diving in so you have a feel for where things are.
