project "Tracy"
  kind "StaticLib"
  language "C++"

  targetdir ("bin/" .. outputdir .. "/%{prj.name}")
  objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

  files
  {
    "public/client/**.h",
    "public/client/**.hpp",
    "public/client/**.cpp",

    "public/common/**.h",
    "public/common/**.hpp",
    "public/common/**.cpp",

    "public/tracy/**.h",
    "public/tracy/**.hpp",
    "public/tracy/**.cpp",

    "public/libbacktrace/alloc.cpp",
    "public/libbacktrace/sort.cpp",
    "public/libbacktrace/state.cpp"
  }

  includedirs { "public" }

  filter "system:windows"
    systemversion "latest"
    cppdialect "C++17"
    staticruntime "off"

		defines
		{
			"NOMINMAX"
		}

  filter "configurations:Debug"
    runtime "Debug"
    symbols "On"
    conformancemode "On"

  filter "configurations:Release"
		runtime "Release"
		optimize "On"
		conformancemode "On"

		defines 
    {
			"TRACY_ENABLE",
			"TRACY_ON_DEMAND"
		}
