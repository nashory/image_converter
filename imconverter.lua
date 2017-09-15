-- image converter
-- last modified: 2017.09.15, nashory


require 'torch'
require 'image'
require 'lfs'
require 'math'
local utils = require 'tools.mcutils' 


-- options
local cmd = torch.CmdLine()
cmd:text()
cmd:text('Image converter for torch7')
cmd:text()
cmd:text('Input arguments')

cmd:option('--operation', 'convert_image', 'convert_image/get_list/get_t7')
cmd:option('--input', './input', 'input_dir')
cmd:option('--output', './output', 'output_dir')
cmd:option('--format', 'png', 'png/jpg')
cmd:option('--extract', 0, 'number of images you wish to extract (0 : all images)')
cmd:option('--resize', '128', 'resize image')
cmd:option('--padding', true, 'true : add padding keeping the ratio')
cmd:option('--brightness', '0.5', 'dark(0) <--> normal(0.5) <--> bright(1.0)')

local opt = cmd:parse(arg or {})
print(opt)



local path = opt.input
local imlist = utils.get_file_list(path, opt.format)
local imlen =  #imlist


os.execute('rmdir output')
os.execute('mkdir -p output')
local target = {}
if opt.extract > 0  then
    local idx = 1
    for i = 1, opt.extract do
        table.insert(target, imlist[idx])
        idx = idx + math.floor(imlen/opt.extract)
    end
elseif opt.extract == 0 then
    target = imlist
end

for idx = 1, #target do
    local im = image.load(string.format('%s/%s', opt.input, target[idx]))

    image.save(string.format('%s/%s', opt.output, target[idx]), im)
    print(string.format('[%d/%d] finished.', idx, #target))
end
print(#target)

















--[[
for file in lfs.dir(opt.input) do
    print(file)
    if lfs.attributes(file,"mode") == "file" then print("found file, "..file)
    elseif lfs.attributes(file,"mode")== "directory" then
        print("found dir, "..file," containing:")
        --for l in lfs.dir(opt.input .. file) do
        --    print("",l)
        --end
    end
end
]]--


















