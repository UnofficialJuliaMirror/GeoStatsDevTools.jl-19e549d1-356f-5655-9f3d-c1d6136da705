@testset "Partitions" begin
  @testset "DirectionPartitioner" begin
    spatialdata = RegularGridData{Float64}(Dict(:z => rand(3,3)))

    # basic checks on small regular grid data
    p = partition(spatialdata, DirectionPartitioner((1.,0.)))
    @test subsets(p) == [[1,2,3], [4,5,6], [7,8,9]]

    p = partition(spatialdata, DirectionPartitioner((0.,1.)))
    @test subsets(p) == [[1,4,7], [2,5,8], [3,6,9]]

    p = partition(spatialdata, DirectionPartitioner((1.,1.), atol=10.))
    @test subsets(p) == [[1,5,9], [2,6], [3], [4,8], [7]]

    p = partition(spatialdata, DirectionPartitioner((1.,-1.), atol=10.))
    @test subsets(p) == [[1], [2,4], [3,5,7], [6,8], [9]]

    # opposite directions produce same partition
    dir1 = (rand(), rand()); dir2 = .-dir1
    p1 = partition(spatialdata, DirectionPartitioner(dir1))
    p2 = partition(spatialdata, DirectionPartitioner(dir2))
    @test subsets(p1) == subsets(p2)

    # partition of arbitrarily large regular grid always
    # returns the "lines" and "columns" of the grid
    for n in [10,100,200]
      spatialdata = RegularGridData{Float64}(Dict(:z => rand(n,n)))

      p = partition(spatialdata, DirectionPartitioner((1.,0.)))
      @test subsets(p) == [collect((i-1)*n+1:i*n) for i in 1:n]
      ns = [GeoStatsDevTools.npoints(dataview) for dataview in p]
      @test all(ns .== n)

      p = partition(spatialdata, DirectionPartitioner((0.,1.)))
      @test subsets(p) == [collect(i:n:n*n) for i in 1:n]
      ns = [GeoStatsDevTools.npoints(dataview) for dataview in p]
      @test all(ns .== n)
    end
  end
  @testset "PlanePartitioner" begin
  end
end
