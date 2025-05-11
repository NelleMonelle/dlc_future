return {
  version = "1.10",
  luaversion = "5.1",
  tiledversion = "1.11.0",
  class = "",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 64,
  height = 12,
  tilewidth = 40,
  tileheight = 40,
  nextlayerid = 7,
  nextobjectid = 12,
  properties = {
    ["music"] = "deltarune/wind_highplace"
  },
  tilesets = {
    {
      name = "cliffs",
      firstgid = 1,
      filename = "../../tilesets/cliffs.tsx",
      exportfilename = "../../tilesets/cliffs.lua"
    }
  },
  layers = {
    {
      type = "imagelayer",
      image = "../../../../assets/sprites/map_images/cliffs_5.png",
      id = 6,
      name = "Image Layer 1",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      repeatx = true,
      repeaty = false,
      properties = {}
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 3,
      name = "objects",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 4,
          name = "transition",
          type = "",
          shape = "rectangle",
          x = -40,
          y = 160,
          width = 40,
          height = 120,
          rotation = 0,
          visible = true,
          properties = {
            ["map"] = "cliffs_4",
            ["marker"] = "c5"
          }
        },
        {
          id = 7,
          name = "transition",
          type = "",
          shape = "rectangle",
          x = 2560,
          y = 160,
          width = 40,
          height = 120,
          rotation = 0,
          visible = true,
          properties = {
            ["map"] = "cliffs_6",
            ["marker"] = "c5"
          }
        },
        {
          id = 8,
          name = "transition",
          type = "",
          shape = "rectangle",
          x = 640,
          y = 160,
          width = 40,
          height = 120,
          rotation = 0,
          visible = true,
          properties = {
            ["flagcheck"] = "bg_convo",
            ["map"] = "cliffs_6",
            ["marker"] = "c5"
          }
        },
        {
          id = 9,
          name = "script",
          type = "",
          shape = "rectangle",
          x = 960,
          y = 160,
          width = 0,
          height = 120,
          rotation = 0,
          visible = true,
          properties = {
            ["cutscene"] = "cliffs.bg_convo"
          }
        },
        {
          id = 10,
          name = "cameratarget",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 160,
          width = 640,
          height = 120,
          rotation = 0,
          visible = true,
          properties = {
            ["flagcheck"] = "bg_convo",
            ["lockx"] = true,
            ["locky"] = true,
            ["marker"] = "camtargy",
            ["time"] = 0.1
          }
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 4,
      name = "markers",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 5,
          name = "c4",
          type = "",
          shape = "point",
          x = 40,
          y = 220,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 6,
          name = "c6",
          type = "",
          shape = "point",
          x = 600,
          y = 220,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 11,
          name = "camtargy",
          type = "",
          shape = "point",
          x = 320,
          y = 200,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 5,
      name = "collision",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 1,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 0,
          width = 2560,
          height = 160,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 2,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 280,
          width = 2560,
          height = 200,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    }
  }
}
