Vimroom
=======

Configuration
By default, VimRoom binds <Leader>V to <Plug>VimroomToggle, and sets up an 80 column workspace with at least 5 columns of space on either side (it doesn’t help at all to have single-column sidebars, you see), and 3 lines of space above and below. It assumes a black background when hiding visual distractions. As of v0.4, VimRoom also sets up a :VimroomToggle command that has the same effect.

Changing any of these assumptions is a simple matter of setting variables in your .vimrc.

g:vimroom_background is the background color to be used for hiding elements. Set this to your terminal’s background color (“white”, “black”, etc.)
g:vimroom_min_sidebar_width is the minimum sidebar width. This will automatically expand to take up all the free space left after setting the main workspace window to g:vimroom_width columns.
g:vimroom_navigational_keys determines whether Vimroom will map keys like <Up>, <Down>, j, and k to navigate over “display” lines, rather than “logical” lines. This defaults to 1 (on), if you’d prefer the mapping not take place, set it to 0 (off).
g:vimroom_scrolloff specifies how many lines of text ought appear before and after the cursor. This defaults to 999, which centers the cursor on the screen.
g:vimroom_sidebar_height sets the height of the upper and lower “sidebars.” If you don’t want vertical padding, set this to 0.
g:vimroom_width is the width of your workspace.
You can bind the <Plug>VimroomToggle function to any key combination you like via the usual mechanisms. For example:

nnoremap <silent> <Leader>mz <Plug>VimroomToggle
