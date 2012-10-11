-- pbpaste (Mac OS X) program for Windows
-- to run: luajit clip.lua
-- it should print the clipboard (textual content)
local ffi      = require( "ffi" )
local user32   = require( "ffi/winapi/windows/user32" )
local kernel32 = require( "ffi/winapi/windows/kernel32" )

local ok1    = user32.OpenClipboard(0)
local handle = user32.GetClipboardData( ffi.C.CF_TEXT )
local size   = kernel32.GlobalSize( handle )
local mem    = kernel32.GlobalLock( handle )
local text   = ffi.string( mem, size )
local ok     = kernel32.GlobalUnlock( handle )
local ok3    = user32.CloseClipboard()

print("CLIPBOARD:["..text.."]")
