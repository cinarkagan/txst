# txst
A simple UI library for singe-button scripts. Made because yes.

## Documentation

# Getting the txst framework

```lua
local txst = loadstring(game:HttpGet(('')))()
```


# Creating a Window
```lua
local window = txst:MakeWindow('Title of UI',0)

--[[
	CreateWindow
	1: title(text)
	2: icon(ID)
	Return
	1: Window
]]--
```
# Creating a Button

```lua
local function hello()
  print('hello')
end

local test = txst:MakeButton(window,'Hello',hello)

--[[
	CreateButton
	1: Main Window(object)
	2: Text(text)
	3: Function to run(function)
	Return:
	1: None
]]--
```
