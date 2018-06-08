local xmlua = {}

xmlua.VERSION = "1.0.1"

xmlua.libxml2 = require("xmlua.libxml2")
xmlua.XML = require("xmlua.xml")
xmlua.HTML = require("xmlua.html")

local Document = require("xmlua.document")
Document.lazy_load()
Document.lazy_load = nil

local Searchable = require("xmlua.searchable")
Searchable.lazy_load()
Searchable.lazy_load = nil

function xmlua.init()
  xmlua.libxml2.xmlInitParser()
end

function xmlua.cleanup()
  collectgarbage()
  xmlua.libxml2.xmlCleanupParser()
end

return xmlua
