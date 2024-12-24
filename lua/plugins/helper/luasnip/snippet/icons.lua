local M = {}

local ls = require "luasnip"

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt



function M.setup()
	ls.add_snippets("lua", {
		s('ICONS', fmt(
			[[
			powerline_extra:                                         
			font_awesome:                                          
			                                                
			                                                
			                                                
			                                                
			                                                
			                                                
			                                                
			                                                
			                                                
			                                                
			                                                
			                                                
			                                                
			                                            
			font_awesome_extensions:                                     
			                                                
			                                                
			                                  
			material_design_icons:                                      
			                                                
			                                                
			                                                
			            
			weather_icons:                                          
			                                                 
			                                                 
			                                                 
			                                    摒 敖 晴 朗 望 杖 歹 殺 流
			滛 滋 漢 瀞 煮 瞧
			devicons:                                             
			                                                 
			                                                 
			                                                 
			  
			octicons:                                             
			                                                 
			                                                 
			                         
			font_logos:                    
			pomicons:           
			iec_power: ⏻ ⏼ ⏽ ⏾ ⭘
			seti_ui:                                              
			      
			My icons: 
			]], {}
		))
	})
end

return M
