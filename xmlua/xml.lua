local XML = {}

local libxml2 = require("xmlua.libxml2")
local ffi = require("ffi")

local Document = require("xmlua.document")

function XML.parse(xml, options)
  local context = libxml2.xmlNewParserCtxt()
  if not context then
    error("failed to create context to parse XML")
  end
  local document = libxml2.xmlCtxtReadMemory(context, xml)
  if context.lastError.message ~= ffi.NULL then
    error("failed to parse XML: " .. ffi.string(context.lastError.message))
  end
  return Document.new(document)
end

return XML
