local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

return {

  -- Console.WriteLine
  s("cw", fmt('Console.WriteLine({});', { i(1, '"Hello"') })),

  -- Namespace + class boilerplate
  s("nsc", fmt([[
namespace {}
{{
    public class {}
    {{
        {}
    }}
}}
]], {
    i(1, "MyNamespace"),
    i(2, "MyClass"),
    i(3),
  })),

  -- Property
  s("prop", fmt("public {} {} {{ get; set; }}", {
    i(1, "int"),
    i(2, "MyProperty"),
  })),

  -- Main method
  s("main", fmt([[
static void Main(string[] args)
{{
    {}
}}
]], {
    i(1),
  })),

  -- For loop
  s("fori", fmt([[
for (int i = 0; i < {}; i++)
{{
    {}
}}
]], {
    i(1, "count"),
    i(2),
  })),

  -- Async method
  s("async", fmt([[
public async Task {}({})
{{
    {}
}}
]], {
    i(1, "MyMethod"),
    i(2),
    i(3),
  })),
}

