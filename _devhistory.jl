# Initial set up & test
using Pkg
Pkg.generate("EcoNetDynOutputs")

Pkg.activate(".")

import EcoNetDynOutputs
EcoNetDynOutputs.greet()

# Set dependencies
Pkg.add("EcologicalNetworksDynamics")

# Set public API in EcoNetDynOutputs.jl
# https://pkgdocs.julialang.org/v1/creating-packages/#Defining-a-public-API

# Adding a build step to the package
mkpath("deps")
write("deps/build.jl",
      """
      println("I am being built...")
      """)
## Building the package
Pkg.build()
print(readchomp("deps/build.log"))

# Add test
mkpath("test")
write("test/runtests.jl",
      """
      println("Testing...")
      """);
## Run the test
Pkg.test()

# Set up Licence
download("https://raw.githubusercontent.com/econetoolbox/EcologicalNetworksDynamics.jl/refs/heads/main/LICENSE",
         "LICENCE"
        )
