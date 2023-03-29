local attempt=require'attempt'
local nno=require'utils.keymap'.nno
attempt.setup{
    ext_options={'lua','js','py','fnl','cpp','c','norg','fish','zig','rs','go','java'},
    initial_content={zig=[[
const std = @import("std");

pub fn main() void {
    std.debug.print("Hello, {s}!\n", .{"World"});
}]]
    }}
nno('<leader>an',attempt.new_select)
nno('<leader>ai',attempt.new_input_ext)
nno('<leader>ad',attempt.delete_buf)
nno('<leader>ac',attempt.rename_buf)
nno('<leader>al',':Telescope attempt attempt\r')
